//
//  LoginController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit

class LoginController: UIViewController, NewUserProtocol {
    
    let loginView = LoginView()
    var currentUser = User("", "")
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    // MARK: setView
    func setView(_ CView: UIView) {
        loginView.makeConstraints(CView)
        loginView.regBtnLV.addTarget(self, action: #selector(openRegistration), for: .touchUpInside)
        loginView.loginBtnLV.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
    }
    
    //MARK: login button
    
    @objc func loginUser(sender: UIButton){
        
        let login = self.loginView.loginTFLV.text!
        let password = self.loginView.pwdTFLV.text!
        
        if validateUser(login, password) {
            //OpenTableViewController
        } else {
            showErrorLogin()
        }
        
    }

    
    //MARK: funcs for validating user
    
    func validateUser(_ login: String, _ password: String) -> Bool{
        var foundUser: User?
        
        for user in users {
            if login == user.login && password == user.password {
                foundUser = user
            }
        }
        
        if let user = foundUser {
            self.currentUser = user
            return true
        } else {
            return false
        }
    }
    
    func showErrorLogin() {
        let alert = UIAlertController(title: "Error", message: "Such user not found", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: for registration button
    
    @objc func openRegistration(sender: UIButton){
        let regC = RegistrationController()
        regC.delegate = self
        self.navigationController?.pushViewController(regC, animated: true)
    }
    
    //MARK: protocol implemetation
    
    func addNewUser(_ user: User) {
        users.append(user)
    }
}
