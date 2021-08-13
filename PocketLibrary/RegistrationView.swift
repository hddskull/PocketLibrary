//
//  RegistrationView.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import UIKit

class RegistrationView: UIView {

    let nameRV = UITextField()
    let loginTFRV = UITextField()
    let pwdTFRV = UITextField()
    let regBtnRV = UIButton()

    func makeConstraints(_ CView: UIView) {
        CView.addSubview(nameRV)
        CView.addSubview(loginTFRV)
        CView.addSubview(pwdTFRV)
        CView.addSubview(regBtnRV)

        CView.backgroundColor = .systemBlue
        
        nameRV.backgroundColor = .white
        nameRV.textAlignment = .left
        nameRV.textColor = .black
        nameRV.placeholder = "Name"
        nameRV.layer.cornerRadius = 5
        
        nameRV.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(CView.snp.top).offset(2*CView.frame.size.height/5)
        }
        
        loginTFRV.backgroundColor = .white
        loginTFRV.textAlignment = .left
        loginTFRV.textColor = .black
        loginTFRV.placeholder = "Email"
        loginTFRV.layer.cornerRadius = 5
        
        loginTFRV.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(nameRV.snp.bottom).offset(20)
        }
        
        pwdTFRV.backgroundColor = .white
        pwdTFRV.textAlignment = .left
        pwdTFRV.textColor = .black
        pwdTFRV.placeholder = "Password"
        pwdTFRV.layer.cornerRadius = 5
        
        pwdTFRV.snp.makeConstraints { make in
            make.leading.equalTo(CView.layoutMarginsGuide).offset(20)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(CView)
            make.top.equalTo(loginTFRV.snp.bottom).offset(20)
        }
        
        
        regBtnRV.backgroundColor = .red
        regBtnRV.setTitle("Register", for: .normal)
        regBtnRV.setTitleColor(.black, for: .normal)
        regBtnRV.layer.cornerRadius = 5
        
        regBtnRV.snp.makeConstraints { make in
            make.top.equalTo(pwdTFRV.snp.bottom).offset(20)
            make.leading.equalTo(CView.layoutMarginsGuide).offset(80)
            make.trailing.equalTo(CView.layoutMarginsGuide).inset(80)
            make.height.equalTo(40)
        }
    }
}
