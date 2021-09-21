//
//  RegistrationController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import UIKit
import RealmSwift

class RegistrationController: UIViewController {

    let regview = RegistrationView()
    var realm = try! Realm()
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        let smt = realm.objects(Book.self)
        print(type(of: smt))
        
        
    }
    
    
    //MARK: Set up view
    func setView(_ CView: UIView) {
        regview.makeConstraints(CView)
        regview.regBtnRV.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    //MARK: funcs for registration button
    @objc func register(sender: UIButton) {
        if fieldsNotEmpty() {
            let user = User(login: self.regview.loginTFRV.text!, password: self.regview.pwdTFRV.text!)
            addUser(user: user)
            self.navigationController?.popViewController(animated: true)
        } else {
            showErrorRegistration()
        }
    }

    func showErrorRegistration() {
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fieldsNotEmpty() -> Bool{
        if self.regview.loginTFRV.text?.isEmpty == false && self.regview.pwdTFRV.text?.isEmpty == false {
            return true
        } else {
            return false
        }
    }
}

//MARK: realm func
extension RegistrationController {
    
    func addUser(user: User){
        
//        let users = realm.objects(User.self)
        try! realm.write {
            realm.add(user)
        }
//        } else {
//            let alert = UIAlertController(title: "Ошибка", message: "Пользователь с таким логином уже существует", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)
//                alert.addAction(ok)
//            self.present(alert, animated: true, completion: nil)
//        }
    }
}
