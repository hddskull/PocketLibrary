//
//  RegistrationController.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import UIKit

class RegistrationController: UIViewController {

    let regview = RegistrationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView(self.view)
        
    }
    
    
    
    func setView(_ CView: UIView) {
        regview.makeConstraints(CView)

    }
    


}
