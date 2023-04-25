//
//  ChatTableViewCell.swift
//  HomeProject-TBD
//
//  Created by Bandit on 25.04.2023.
//

import UIKit

final class ChatTableViewCell: UITableViewCell {
    
    // MARK: - View
    lazy var labelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var labelNameChat: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular13
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var labelNameUser: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular13
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    lazy var labelText: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoItalic13
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    func configure(_ file: ChatTableViewModel) {
        labelImage.image = file.labelImage
        labelNameChat.text = file.labelNameChat
        labelNameUser.text = file.labelNameUser
        labelText.text = file.labelText
    }
    
    // MARK: - StyleCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(labelImage)
        contentView.addSubview(labelNameChat)
        contentView.addSubview(labelNameUser)
        contentView.addSubview(labelText)
        
        labelImage.translatesAutoresizingMaskIntoConstraints = false
        labelImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5).isActive = true
        labelImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
        labelImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5).isActive = true

        labelNameChat.translatesAutoresizingMaskIntoConstraints = false
        labelNameChat.leadingAnchor.constraint(equalTo: labelImage.trailingAnchor, constant: 5).isActive = true
        labelNameChat.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        labelNameChat.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true

        labelNameUser.translatesAutoresizingMaskIntoConstraints = false
        labelNameUser.leadingAnchor.constraint(equalTo: labelNameChat.leadingAnchor).isActive = true
        labelNameUser.trailingAnchor.constraint(equalTo: labelNameChat.trailingAnchor).isActive = true
        labelNameUser.topAnchor.constraint(equalTo: labelNameChat.bottomAnchor, constant: 1).isActive = true
        
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.leadingAnchor.constraint(equalTo: labelNameChat.leadingAnchor).isActive = true
        labelText.trailingAnchor.constraint(equalTo: labelNameChat.trailingAnchor).isActive = true
        labelText.topAnchor.constraint(equalTo: labelNameUser.bottomAnchor, constant: 1).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
