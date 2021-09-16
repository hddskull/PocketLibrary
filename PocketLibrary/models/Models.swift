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
    var books: [Book] = []
    
    init(_ login: String, _ password: String){
        self.login = login
        self.password = password
    }
}


class Book {
    var name = ""
    var author = ""
    var isbn = ""
    var description = ""
    var bookCover = "" // look up how to store images in the file system and keeping the path is the models property in the DB
    
    init(name: String, author: String, isbn: String, description: String, bookCover: String) {
        self.name = name
        self.author = author
        self.isbn = isbn
        self.description = description
        self.bookCover = bookCover
    }
}
