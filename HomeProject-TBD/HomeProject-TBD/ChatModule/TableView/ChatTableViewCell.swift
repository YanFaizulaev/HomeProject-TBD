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
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var labelNameUser: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    lazy var labelText: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoItalic15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    // MARK: -Right side of the cell
    
    lazy var labelTime: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoItalic12
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "15:40"
        return label
    }()
    
    lazy var labelMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: -10, width: 20, height: 20))
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = label.bounds.size.height / 2
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = Constans.Fonts.robotoItalic12
        label.textColor = .white
        label.backgroundColor = .red
        label.text = "85"
        return label
    }()

      // button
    lazy var buttonMessage : UIButton = {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 18, height: 16))
        rightButton.setBackgroundImage(UIImage(systemName: "message"), for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTouched), for: .touchUpInside)
        rightButton.addSubview(labelMessage)
        return rightButton
    }()
        
    @objc func rightButtonTouched() {
          print("Right button touched")
        }

    
    // MARK: - Configure
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
        contentView.addSubview(labelTime)
        contentView.addSubview(buttonMessage)
        
        labelImage.translatesAutoresizingMaskIntoConstraints = false
        labelImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5).isActive = true
        labelImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
        labelImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5).isActive = true

        labelNameChat.translatesAutoresizingMaskIntoConstraints = false
        labelNameChat.leadingAnchor.constraint(equalTo: labelImage.trailingAnchor, constant: 5).isActive = true
        labelNameChat.trailingAnchor.constraint(equalTo: buttonMessage.leadingAnchor, constant: -5).isActive = true
        labelNameChat.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true

        labelNameUser.translatesAutoresizingMaskIntoConstraints = false
        labelNameUser.leadingAnchor.constraint(equalTo: labelNameChat.leadingAnchor).isActive = true
        labelNameUser.trailingAnchor.constraint(equalTo: labelNameChat.trailingAnchor).isActive = true
        labelNameUser.topAnchor.constraint(equalTo: labelNameChat.bottomAnchor, constant: 1).isActive = true
        
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.leadingAnchor.constraint(equalTo: labelNameChat.leadingAnchor).isActive = true
        labelText.trailingAnchor.constraint(equalTo: labelNameChat.trailingAnchor).isActive = true
        labelText.topAnchor.constraint(equalTo: labelNameUser.bottomAnchor, constant: 1).isActive = true
        
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelTime.widthAnchor.constraint(equalToConstant: 30).isActive = true
        labelTime.heightAnchor.constraint(equalToConstant: 15).isActive = true
        labelTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5).isActive = true
        labelTime.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
        
        buttonMessage.translatesAutoresizingMaskIntoConstraints = false
        buttonMessage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        buttonMessage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        buttonMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10).isActive = true
        buttonMessage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
