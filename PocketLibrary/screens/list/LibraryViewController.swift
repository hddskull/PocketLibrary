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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
    
    //MARK: func
    
    func configureCellData(book: Book, cell: LibraryViewCell) -> LibraryViewCell {
        cell.nameLabel.text = book.name
        cell.authorLabel.text = book.author
        cell.isbnLabel.text = book.isbn
        cell.descriptionLabel.text = book.description
        //cell.bookCover.image = book.bookCover
        return cell
    }
    
    //MARK: barItem func
    
    @objc func addBookAction(sender: UIBarButtonItem) {
        let addBookVC = AddBookViewController()
        self.navigationController?.pushViewController(addBookVC, animated: true)
    }

    
}
