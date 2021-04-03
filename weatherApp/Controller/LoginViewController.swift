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
    
    override func loadView() {
        super.loadView()
        // load view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "MyUserName"
        passwordLabel.text = "Qwerty"
        button.setTitle("Login", for: .normal)
    }

    //rewrite subview after changing orientation
    override func viewWillLayoutSubviews() {
       // 
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if userNameTextField.text == "admin", passwordTextField.text == "qwerty" {
            print("Auth success")
        } else {
            print("Auth deny")
        }
    }
}

