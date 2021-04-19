//
//  ViewController.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 03.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonPressed: UIButton!
    
    override func loadView() {
        super.loadView()
        // load view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "MyUserName"
        passwordLabel.text = "Qwerty"
        button.setTitle("Login", for: .normal)
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    //rewrite subview after changing orientation
    override func viewWillLayoutSubviews() {
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if userNameTextField.text == "admin", passwordTextField.text == "qwerty" {
            print("Auth vsuccess")
        } else {
            print("Auth deny")
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) { }
    
    
    private func checkserInfo() -> Bool {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text,
              userName == "admin",
              password == "12345"
        else {
            presentError()
            return false}
        return true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        checkserInfo()
    }
    
    private func presentError(with message: String = "Wrong login or password") {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
    
    
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}

