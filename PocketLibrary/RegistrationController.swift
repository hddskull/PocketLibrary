//
//  RegistrationController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import UIKit

class RegistrationController: UIViewController {

    let regview = RegistrationView()
    var delegate: NewUserProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    //MARK: Set up view
    func setView(_ CView: UIView) {
        regview.makeConstraints(CView)
        regview.regBtnRV.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    //MARK: funcs for registration button
    @objc func register(sender: UIButton) {
        if fieldsNotEmpty() {
            let user = User(self.regview.nameRV.text!, self.regview.loginTFRV.text!, self.regview.pwdTFRV.text!)
            self.delegate?.addNewUser(user)
        } else {
            showError()
        }
    }

    func showError() {
        let alert = UIAlertController(title: "Error", message: "Please fill out all the fields", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fieldsNotEmpty() -> Bool{
        if self.regview.nameRV.text?.isEmpty == false && self.regview.loginTFRV.text?.isEmpty == false && self.regview.pwdTFRV.text?.isEmpty == false {
            return true
        } else {
            return false
        }
    }
}
