//
//  DetailedBookView.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 21.09.2021.
//

import UIKit

class DetailedBookView: UIScrollView {
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let isbnLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let descLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let bookCover: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "425bookimg")
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 5
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    
    //MARK: constraints
    func setupConstraints(_ vc: UIView){
        self.backgroundColor = .systemTeal
        self.snp.makeConstraints(){ make in
            make.top.bottom.leading.trailing.equalTo(vc)
        }
        let stackView = UIStackView(arrangedSubviews: [bookCover,
                                                       nameLabel,
                                                       authorLabel,
                                                       isbnLabel,
                                                       descLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        self.addSubview(stackView)
        stackView.snp.makeConstraints(){ make in
            make.top.equalTo(self).offset(30)
            make.bottom.equalTo(self).inset(20)
            make.leading.equalTo(vc).offset(15)
            make.trailing.equalTo(vc).inset(15)
        }
        bookCover.snp.makeConstraints() { make in
            make.height.width.equalTo(150)
        }
    }
}
