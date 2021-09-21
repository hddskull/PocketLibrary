//
//  DetailedViewController.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 21.09.2021.
//

import UIKit

class DetailedViewController: UIViewController {
    //MARK: properties
    let dbv = DetailedBookView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        view.addSubview(dbv)
        dbv.setupConstraints(self.view)
    }
    

}
