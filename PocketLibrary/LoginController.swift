//
//  LoginController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit

class LoginController: UIViewController {
    
    let loginView = LoginView()
    let currentUser = User("", "", "")

    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    
    func setView(_ CView: UIView) {
        loginView.makeConstraints(CView)
        loginView.regBtnLV.addTarget(self, action: #selector(openRegistration), for: .touchUpInside)

    }
    
    //MARK: funcs for validating user
    func getUser(_ LoginView: LoginView) -> User {
        let login = LoginView.loginTFLV.text!
        let password = LoginView.pwdTFLV.text!
        return User("", login, password)
    }
    
    @objc func openRegistration(sender: UIButton){
        self.navigationController?.pushViewController(RegistrationController(), animated: true)
    }
}
