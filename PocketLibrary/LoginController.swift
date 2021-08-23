//
//  LoginController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit

class LoginController: UIViewController, NewUserProtocol {
    
    let loginView = LoginView()
    let currentUser = User("", "", "")
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    // MARK: setView
    func setView(_ CView: UIView) {
        loginView.makeConstraints(CView)
        loginView.regBtnLV.addTarget(self, action: #selector(openRegistration), for: .touchUpInside)

    }
    
    @objc func openRegistration(sender: UIButton){
        let regC = RegistrationController()
        regC.delegate = self
        self.navigationController?.pushViewController(regC, animated: true)
    }
    
    //MARK: funcs for validating user
    func getUser(_ LoginView: LoginView) -> User {
        let login = LoginView.loginTFLV.text!
        let password = LoginView.pwdTFLV.text!
        return User("", login, password)
    }
    
    //MARK: protocol implemetation
    
    func addNewUser(_ user: User) {
        users.append(user)
        print(users)
    }
}
