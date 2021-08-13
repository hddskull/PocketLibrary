//
//  LoginView.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit
import SnapKit

class LoginView: UIView {

    let loginTF = UITextField()
    let pwdTF = UITextField()
    let loginBtn = UIButton()
    let regBtn = UIButton()
    
    
    //MARK: snapkit
    func makeConstraints(_ CView: UIView) {
        CView.addSubview(loginTF)
        CView.addSubview(pwdTF)
        CView.addSubview(loginBtn)
        CView.addSubview(regBtn)

        CView.backgroundColor = .systemBlue
        
        loginTF.backgroundColor = .white
        loginTF.textAlignment = .left
        loginTF.textColor = .black
        loginTF.placeholder = "Login"
        loginTF.layer.cornerRadius = 5
        
        loginTF.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(CView.snp.top).offset(2*CView.frame.size.height/5)
        }
        
        pwdTF.isSecureTextEntry = true
        pwdTF.backgroundColor = .white
        pwdTF.textAlignment = .left
        pwdTF.textColor = .black
        pwdTF.placeholder = "Password"
        pwdTF.layer.cornerRadius = 5
        
        pwdTF.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(loginTF.snp.bottom).offset(20)
        }
        
        loginBtn.backgroundColor = .white
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.layer.cornerRadius = 5
        
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(pwdTF.snp.bottom).offset(45)
            make.leading.equalTo(CView.layoutMarginsGuide).offset(80)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(80)
            make.height.equalTo(40)
        }
        
        
        regBtn.backgroundColor = .red
        regBtn.setTitle("Registration", for: .normal)
        regBtn.setTitleColor(.black, for: .normal)
        regBtn.layer.cornerRadius = 5
        
        regBtn.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(20)
            make.leading.equalTo(CView.layoutMarginsGuide).offset(80)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(80)
            make.height.equalTo(40)
        }
    }
}
