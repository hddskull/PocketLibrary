//
//  addBookView.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 16.09.2021.
//

import UIKit

class AddBookView: UIScrollView {
    //MARK: Properties
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Название книги"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Имя автора"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let isbnLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Номер ISBN"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Краткое описание"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let nameField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Введите название книги"
        return txt
    }()
    let authorField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Введите имя автора"
        return txt
    }()
    let isbnField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Введите номер ISBN"
        return txt
    }()
    let descField: UITextView = {
        let txt = UITextView()
        txt.text = "Введите краткое описание"
        txt.textColor = UIColor.lightGray
        return txt
    }()
    
    //imagepicker here
    
    //MARK: setup constraints
    
    func setupConstraints(vc: UIView) {
        self.backgroundColor = .systemTeal
        self.snp.makeConstraints(){ make in
            make.top.bottom.leading.trailing.equalTo(vc)
        }
        let stackView = UIStackView(arrangedSubviews: [nameLabel,   nameField,
                                                       authorLabel, authorField,
                                                       isbnLabel,   isbnField,
                                                       descLabel,   descField])
        stackView.axis = .vertical
        self.addSubview(stackView)
        stackView.snp.makeConstraints(){ make in
            make.top.equalTo(self).offset(30)
            make.bottom.equalTo(self).inset(20)
            make.leading.equalTo(vc).offset(15)
            make.trailing.equalTo(vc).inset(15)
        }
        nameLabel.snp.makeConstraints(){make in make.height.equalTo(50)}
        authorLabel.snp.makeConstraints(){make in make.height.equalTo(50)}
        isbnLabel.snp.makeConstraints(){make in make.height.equalTo(50)}
        descLabel.snp.makeConstraints(){make in make.height.equalTo(50)}

        nameField.snp.makeConstraints(){make in make.height.equalTo(50)}
        authorField.snp.makeConstraints({make in make.height.equalTo(50)})
        isbnField.snp.makeConstraints({make in make.height.equalTo(50)})
        descField.snp.makeConstraints({make in make.height.equalTo(150)})

    }

}
extension AddBookView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
}
