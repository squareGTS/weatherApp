//
//  SomePage.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 06.04.2021.
//

import UIKit

class SomePage: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}
