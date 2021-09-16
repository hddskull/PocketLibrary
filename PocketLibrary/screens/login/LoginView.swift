//
//  LoginView.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit
import SnapKit

class LoginView: UIView {

    let loginTFLV = UITextField()
    let pwdTFLV = UITextField()
    let loginBtnLV = UIButton()
    let regBtnLV = UIButton()
    
    
    //MARK: snapkit
    func makeConstraints(_ CView: UIView) {
        CView.addSubview(loginTFLV)
        CView.addSubview(pwdTFLV)
        CView.addSubview(loginBtnLV)
        CView.addSubview(regBtnLV)

        CView.backgroundColor = .systemBlue
        
        loginTFLV.backgroundColor = .white
        loginTFLV.textAlignment = .left
        loginTFLV.textColor = .black
        loginTFLV.placeholder = "Login"
        loginTFLV.layer.cornerRadius = 5
        
        loginTFLV.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(CView.snp.top).offset(2*CView.frame.size.height/5)
        }
        
        pwdTFLV.isSecureTextEntry = true
        pwdTFLV.textContentType = .oneTimeCode
        pwdTFLV.backgroundColor = .white
        pwdTFLV.textAlignment = .left
        pwdTFLV.textColor = .black
        pwdTFLV.placeholder = "Password"
        pwdTFLV.layer.cornerRadius = 5
        
        pwdTFLV.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(loginTFLV.snp.bottom).offset(20)
        }
        
        loginBtnLV.backgroundColor = .white
        loginBtnLV.setTitle("Login", for: .normal)
        loginBtnLV.setTitleColor(.black, for: .normal)
        loginBtnLV.layer.cornerRadius = 5
        
        loginBtnLV.snp.makeConstraints { make in
            make.top.equalTo(pwdTFLV.snp.bottom).offset(45)
            make.leading.equalTo(CView.layoutMarginsGuide).offset(80)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(80)
            make.height.equalTo(40)
        }
        
        
        regBtnLV.backgroundColor = .red
        regBtnLV.setTitle("Registration", for: .normal)
        regBtnLV.setTitleColor(.black, for: .normal)
        regBtnLV.layer.cornerRadius = 5
        
        regBtnLV.snp.makeConstraints { make in
            make.top.equalTo(loginBtnLV.snp.bottom).offset(20)
            make.leading.equalTo(CView.layoutMarginsGuide).offset(80)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(80)
            make.height.equalTo(40)
        }
    }
}
