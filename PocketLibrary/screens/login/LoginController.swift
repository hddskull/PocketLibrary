//
//  LoginController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit
import RealmSwift

class LoginController: UIViewController {
    
    let loginView = LoginView()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

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
        
        if login == "Admin" && password == "Admin"{
            self.navigationController?.pushViewController(AdminViewController(), animated: true)
        }
        else if validateUser(login, password) {
            let lvc = LibraryViewController()
            lvc.user = login
            self.navigationController?.pushViewController(lvc, animated: true)
        } else {
            showErrorLogin()
        }
        
    }

    
    //MARK: funcs for validating user
    
    func validateUser(_ login: String, _ password: String) -> Bool{
        let users = realm.objects(User.self)
        for user in users {
            if user.login == login && user.password == password {
                return true }
//        if users.filter("login == \(login)") != nil {
//            let usersWithLogin = users.filter("login == \(login)")
//            if usersWithLogin[0].login == login && usersWithLogin[0].password == password {
//            return true
//            }
//        }
        }
        return false
    }
    
    func showErrorLogin() {
        let alert = UIAlertController(title: "Ошибка", message: "Такой пользователь не найден", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: for registration button
    
    @objc func openRegistration(sender: UIButton){
        let regC = RegistrationController()
        self.navigationController?.pushViewController(regC, animated: true)
    }
    
    //MARK: release keboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
