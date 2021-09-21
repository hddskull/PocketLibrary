//
//  Models.swift
//  PocketLibrary
//
//  Created by Max Gladkov on 13.08.2021.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var login = ""
    @objc dynamic var password = ""
    
    convenience init(login: String, password: String) {
        self.init()
        self.login = login
        self.password = password
    }
}


class Book: Object {
    @objc dynamic var user = ""
    @objc dynamic var name = ""
    @objc dynamic var author = ""
    @objc dynamic var isbn = ""
    @objc dynamic var bookDesc = ""
    @objc dynamic var bookCover = ""
    
    convenience init(user: String, name: String, author: String, isbn: String, bookDesc: String, bookCover: String) {
        self.init()
        self.user = user
        self.name = name
        self.author = author
        self.isbn = isbn
        self.bookDesc = bookDesc
        self.bookCover = bookCover
    }
}
