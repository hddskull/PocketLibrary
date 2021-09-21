//
//  LibraryViewController.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 15.09.2021.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    //MARK: Properties
    var books: [Book] = [
        Book(name: "peepee", author: "auht", isbn: "123", description: "cool book", bookCover: "some cover"),
        Book(name: "Финансист", author: "Теодор Драйзер", isbn: "978-5-699-36993-5", description: "Герой романа Финансист - Фрэнк Каупервуд - не только удачливый бизнесмен и владелец огромного состояния. Он обладает особым магнетизмом, сверхъестественной властью как над мужчинами, так и над женщинами. Богатство для него не цель, а средство, позволяющее Каупервуду жить, руководствуясь принципом: Мои желания прежде всего", bookCover: "обложка")]

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
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell", for: indexPath) as! LibraryViewCell
        cell = configureCellData(book: books[indexPath.row], cell: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailedViewController()
        //заполнить поля dvc
        let book = books[indexPath.row]
        dvc.dbv.bookCover.image = loadImg(fileName: book.bookCover)
        dvc.dbv.nameLabel.text = book.name
        dvc.dbv.authorLabel.text = book.author
        dvc.dbv.isbnLabel.text = book.isbn
        dvc.dbv.descLabel.text = book.description

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
        self.navigationController?.pushViewController(addBookVC, animated: true)
    }

    
}

extension LibraryViewController: BookCreationProtocol {
    func createNewBook(_ book: Book) {
        //db here
        books.append(book)
        tableView.reloadData()
    }
    
    func updateBook(_ book: Book, _ indexPathRow: Int) {
        print("upd")
        books.remove(at: indexPathRow)
        books.append(book)
        tableView.reloadData()
        //db here
        //get from db by book.name
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
        let book = books[indexPathRow]
        let addBookVC = AddBookViewController()
        addBookVC.bookDelegate = self
        addBookVC.editingBook = true
        addBookVC.indexPathRow = indexPathRow
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
        books.remove(at: indexPathRow)
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
