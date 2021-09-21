//
//  LibraryViewController.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 15.09.2021.
//

import UIKit
import RealmSwift

class LibraryViewController: UITableViewController {
    
    //MARK: Properties
    var user: String?
    let dataBase = DBManager()
    
    
    

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.tableView.register(LibraryViewCell.self, forCellReuseIdentifier: "libraryCell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить книгу", style: .plain, target: self, action: #selector(addBookAction))
    }

    // MARK: - Table view configuration

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBase.arrayOfBooks(user: self.user!).count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell", for: indexPath) as! LibraryViewCell
        cell = configureCellData(book: dataBase.arrayOfBooks(user: self.user!)[indexPath.row], cell: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailedViewController()
        let book = dataBase.arrayOfBooks(user: self.user!)[indexPath.row]
        if book.bookCover == "" { dvc.dbv.bookCover.image = #imageLiteral(resourceName: "425bookimg") }
        dvc.dbv.bookCover.image = loadImg(fileName: book.bookCover)
        dvc.dbv.nameLabel.text = book.name
        dvc.dbv.authorLabel.text = book.author
        dvc.dbv.isbnLabel.text = book.isbn
        dvc.dbv.descLabel.text = book.bookDesc

        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    //MARK: func
    
    func configureCellData(book: Book, cell: LibraryViewCell) -> LibraryViewCell {
        cell.nameLabel.text = book.name
        cell.authorLabel.text = book.author
        cell.isbnLabel.text = book.isbn
        cell.descriptionLabel.text = book.description
        let image = loadImg(fileName: book.bookCover)
        cell.bookCover.image = image
        return cell
    }
    
    //MARK: add book barItemBtn action
    
    @objc func addBookAction(sender: UIBarButtonItem) {
        let addBookVC = AddBookViewController()
        addBookVC.bookDelegate = self
        addBookVC.editingBook = false
        addBookVC.user = self.user
        self.navigationController?.pushViewController(addBookVC, animated: true)
    }

    
}

//MARK: DB funcs

extension LibraryViewController: BookCreationProtocol {
    func createNewBook(_ book: Book) {
        dataBase.saveNewBook(book: book)
        tableView.reloadData()
    }
    
    func updateBook(newBook: Book, oldBook: Book) {
        dataBase.updateBook(newBook: newBook, oldBook: oldBook)
        tableView.reloadData()
    }
    
    
}

//MARK: swipe actions extension

extension LibraryViewController {
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Изменить") {
            (action, view, completionHandler) in self.editHandeler(indexPathRow: indexPath.row)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func editHandeler(indexPathRow: Int){
        let book = dataBase.arrayOfBooks(user: self.user!)[indexPathRow]
        
        let addBookVC = AddBookViewController()
        addBookVC.user = self.user
        addBookVC.bookDelegate = self
        addBookVC.editingBook = true
        addBookVC.indexPathRow = indexPathRow
        addBookVC.oldBook = book
        addBookVC.addBookView.authorField.text = book.author
        addBookVC.addBookView.nameField.text = book.name
        addBookVC.addBookView.isbnField.text = book.isbn
        addBookVC.addBookView.descField.text = book.description
        
        self.navigationController?.pushViewController(addBookVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Удалить") {
            (action, view, completionHandler) in self.deleteHandler(indexPathRow: indexPath.row)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func deleteHandler(indexPathRow: Int){
        let book = dataBase.arrayOfBooks(user: self.user!)[indexPathRow]
        dataBase.deleteTask(book: book)
        tableView.reloadData()
    }

}

extension LibraryViewController {
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


