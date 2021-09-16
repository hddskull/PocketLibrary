//
//  addBookViewController.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 16.09.2021.
//

import UIKit

class AddBookViewController: UIViewController {
    
    //MARK:properties
    let addBookView = AddBookView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        view.addSubview(addBookView)
        addBookView.setupConstraints(vc: self.view)
        
    }
    
    
    //MARK: UI
    
    func setupUI(_ view: UIView){
        addBookView.setupConstraints(vc: view)
    }
}
