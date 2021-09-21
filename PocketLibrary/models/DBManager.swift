//
//  DBManager.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 21.09.2021.
//

import Foundation
import RealmSwift

class DBManager {
    var realm: Realm = try! Realm()
    
    
    public func saveNewBook(book: Book){
        try! realm.write{
            realm.add(book)
        }
    }

    
    public func arrayOfBooks(user: String) -> Results<Book> {
        let results = realm.objects(Book.self).filter("user = '\(user)'").sorted(byKeyPath: "name", ascending: true)
        if results.isEmpty {
            self.saveNewBook(book: Book(user: user, name: "Название", author: "автор", isbn: "номер исбн", bookDesc: "Описание", bookCover: "название файла"))
        }
        return results
    }

    
    public func deleteTask(book: Book) {
        try! realm.write{
            realm.delete(realm.objects(Book.self).filter("name=%@",book.name))
        }
    }
    
    public func updateBook(newBook: Book, oldBook: Book) {
        let books = realm.objects(Book.self).filter("name=%@",oldBook.name)
        print("old book name: \(books[0].name)")
        print("found book name: \(oldBook.name)")
        if let book = books.first {
            try! realm.write {
                book.user = newBook.user
                book.name = newBook.name
                book.author = newBook.author
                book.isbn = newBook.isbn
                book.bookDesc = newBook.bookDesc
                book.bookCover = newBook.bookCover
            }
        }

    }
    
    public func deleteUser(user: String){
        let userObj = realm.objects(User.self).filter("name=%@", user)
        if userObj.count == 1{
            realm.delete(userObj)
        }
    }
    
    
}

