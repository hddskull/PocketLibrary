//
//  LoginController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 12.08.2021.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    
    func setView(_ CView: UIView) {
        let view = LoginView()
        view.makeConstraints(CView)
    }
}
