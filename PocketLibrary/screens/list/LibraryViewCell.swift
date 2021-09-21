//
//  LibraryViewCell.swift
//  PocketLibrary
//
//  Created by Gladkov Maxim on 15.09.2021.
//

import UIKit

class LibraryViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: properties
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "name of book"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "author"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let isbnLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "isbn"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "cool book"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 3
        return lbl
    }()
    
    let bookCover: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "425bookimg")
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 5
        img.contentMode = .scaleToFill
        return img
    }()


    func setupConstraints(){
        self.contentView.backgroundColor = .systemTeal
        let vertSV = UIStackView(arrangedSubviews: [nameLabel, authorLabel, isbnLabel])
        vertSV.axis = .vertical
//        vertSV.backgroundColor = .systemTeal
        let horizSV = UIStackView(arrangedSubviews: [vertSV, bookCover])
        horizSV.axis = .horizontal
//        horizSV.backgroundColor = .systemTeal
        
        self.contentView.addSubview(horizSV)
        horizSV.snp.makeConstraints(){ make in
            make.top.leading.equalTo(self.contentView).offset(15)
            make.bottom.trailing.equalTo(self.contentView).inset(15)
        }
        
        bookCover.snp.makeConstraints(){ make in
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints(){ make in
            make.height.equalTo(40)
        }
        authorLabel.snp.makeConstraints(){ make in
            make.height.equalTo(40)
        }
        isbnLabel.snp.makeConstraints(){ make in
            make.height.equalTo(40)
        }

    }
}
