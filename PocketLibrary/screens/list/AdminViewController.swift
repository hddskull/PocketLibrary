//
//  AdminViewController.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 21.09.2021.
//

import UIKit

class AdminViewController: UITableViewController {
    
    let dataBase = DBManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .singleLine
        
        tableView.backgroundColor = .systemGray4
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableView.register(LibraryViewCell.self, forCellReuseIdentifier: "BookCell")

    }

    // MARK:  Table view config

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            let books = dataBase.realm.objects(Book.self)
            return books.count
        }
        let users = dataBase.realm.objects(User.self)
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let userCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
            let users = dataBase.realm.objects(User.self)
            userCell.userLable.text = users[indexPath.row].login
            return userCell
        }
        
        if indexPath.section == 1 {
            let bookCell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! LibraryViewCell
            let books = dataBase.realm.objects(Book.self)
            bookCell.nameLabel.text = books[indexPath.row].name
            bookCell.authorLabel.text = books[indexPath.row].author
            bookCell.isbnLabel.text = books[indexPath.row].isbn
            bookCell.descriptionLabel.text = books[indexPath.row].bookDesc
            let image = loadImg(fileName: books[indexPath.row].bookCover)
            bookCell.bookCover.image = image
            
            return bookCell
        }
        return tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Books"
        }
        return "Users"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return 150
    }
        
    
    
}

//MARK: tableView cell for users

class UserCell: UITableViewCell {
    
    let userLable: UILabel = {
        let lbl = UILabel()
        lbl.text = "user name/ login"
        lbl.backgroundColor = .white
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(userLable)
        self.contentView.backgroundColor = .white
        userLable.snp.makeConstraints(){ make in
            make.leading.equalTo(contentView).offset(10)
            make.trailing.equalTo(contentView).inset(5)
            make.height.equalTo(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension AdminViewController {
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private func loadImg(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
}
//MARK: swipe actions extension

extension AdminViewController {
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Изменить") {
            (action, view, completionHandler) in self.editHandeler(indexPathRow: indexPath.row)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func editHandeler(indexPathRow: Int){
//        let book = dataBase.arrayOfBooks(user: self.user!)[indexPathRow]
//
//        let addBookVC = AddBookViewController()
//        addBookVC.user = self.user
//        addBookVC.bookDelegate = self
//        addBookVC.editingBook = true
//        addBookVC.indexPathRow = indexPathRow
//        addBookVC.oldBook = book
//        addBookVC.addBookView.authorField.text = book.author
//        addBookVC.addBookView.nameField.text = book.name
//        addBookVC.addBookView.isbnField.text = book.isbn
//        addBookVC.addBookView.descField.text = book.description
//
//        self.navigationController?.pushViewController(addBookVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Удалить") {
            (action, view, completionHandler) in self.deleteHandler(indexPathRow: indexPath.row)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func deleteHandler(indexPathRow: Int){
//        let book = dataBase.arrayOfBooks(user: self.user!)[indexPathRow]
//        dataBase.deleteTask(book: book)
//        tableView.reloadData()
    }

}
