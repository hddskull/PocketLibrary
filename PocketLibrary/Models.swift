//
//  Models.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import Foundation

class User {
    var login = ""
    var password = ""
    
    init(_ login: String, _ password: String){
        self.login = login
        self.password = password
    }
}
