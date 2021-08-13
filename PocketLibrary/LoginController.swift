//
//  LoginController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit

class LoginController: UIViewController {
    
    let loginView = LoginView()
    let regview = RegistrationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    
    func setView(_ CView: UIView) {
//        loginView.makeConstraints(CView)
        regview.makeConstraints(CView)

    }
    
    
}
