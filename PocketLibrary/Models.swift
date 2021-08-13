//
//  Models.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import Foundation

class User {
    var name = ""
    var login = ""
    var password = ""
    
    init(_ name: String, _ login: String, _ password: String){
        self.name = name
        self.login = login
        self.password = password
    }
}
