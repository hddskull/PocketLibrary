//
//  addBookViewController.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 16.09.2021.
//

import UIKit

class AddBookViewController: UIViewController {
    
    //MARK:properties
    var editingBook = false
    var user: String?
    let addBookView = AddBookView()
    var bookDelegate: BookCreationProtocol?
    var indexPathRow: Int?
    var imageName: String?
    var oldBook: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        view.addSubview(addBookView)
        addBookView.setupConstraints(vc: self.view)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveBookAction))
        self.addBookView.pickerBtn.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    //MARK: navItemBtn action
    
    @objc func saveBookAction(sender: UIBarButtonItem) {
        if self.editingBook {
            validateFields()
            let editedBook = createBookObj()
            guard let delegate = bookDelegate, let indexPR = indexPathRow else {
                print("bookDelegate error")
                return
            }
            delegate.updateBook(newBook: editedBook, oldBook: self.oldBook!)
            navigationController?.popViewController(animated: true)
        } else {
            validateFields()
            let book = createBookObj()
            guard let delegate = bookDelegate else {
                print("bookDelegate error")
                return
            }
            delegate.createNewBook(book)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    func validateFields(){
        if self.addBookView.nameField.text?.isEmpty == true {
            sendAlert(with: "Заполните название книги")
        }
        if self.addBookView.authorField.text?.isEmpty == true {
            sendAlert(with: "Заполните имя автора")
        }
        if self.addBookView.isbnField.text?.isEmpty == true {
            sendAlert(with: "Заполните номер ISBN")
        }
        if self.addBookView.descField.text?.isEmpty == true || self.addBookView.descField.text == "Введите краткое описание" {
            sendAlert(with: "Заполните краткое описание книги")
        }
    }
    
    func sendAlert(with text: String){
        let alertFields = UIAlertController(title: "Ошибка заполнения", message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)
        alertFields.addAction(ok)
        navigationController?.present(alertFields, animated: true, completion: nil)
    }
    
    func createBookObj() -> Book {
        let name = self.addBookView.nameField.text!
        let author = self.addBookView.authorField.text!
        let isbn = self.addBookView.isbnField.text!
        let description = self.addBookView.descField.text!
        let user = self.user!
        guard let bookCover = self.imageName else { return Book(user: user ,name: name, author: author, isbn: isbn, bookDesc: description, bookCover: "")
        }
        let book = Book(user: user ,name: name, author: author, isbn: isbn, bookDesc: description, bookCover: bookCover)
        return book
    }
    
    @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    //MARK: release keboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension AddBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        self.imageName = imageName
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 1.0) {
            try? jpegData.write(to: imagePath)
        }
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
