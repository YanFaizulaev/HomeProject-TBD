//
//  ProfileViewControllerDefault.swift
//  HomeProject-TBD
//
//  Created by Bandit on 28.04.2023.
//

import UIKit

public class ProfileViewControllerDefault: UIViewController {
    
    // MARK: - Service
    let serviceAPI = APIProfile()
    
    // MARK: - View
    lazy var imageViewUser: UIImageView = {
        var imageView = UIImageView()
        imageView.image = Constans.Image.imageLogo
        imageView.layer.cornerRadius = 100
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var labelNumberPhone: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.text = "Ваш номер телефона: "
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        return label
    }()
    
    lazy var textFieldPhone: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.text = "Ваше имя: "
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        return label
    }()
    
    lazy var textFieldName: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var labelNickName: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.text = "Ваш никнейм: "
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        return label
    }()
    
    lazy var textFieldNickName: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var labelCity: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Ваш город проживания: "
        return label
    }()
    
    lazy var textFieldCity: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.placeholder = "Город ангелов)"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var labelDateOfBirth: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Ваш день рождения: "
        return label
    }()
    
    lazy var textFieldDateOfBirth: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.placeholder = "Вы точно родились в четверг!"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var labelZodiacSign: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Ваш знак задиака: "
        return label
    }()
    
    lazy var textFieldZodiacSign: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.placeholder = "Возможно вы телец?"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var labelAboutMe: UILabel = {
        let label = UILabel()
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "О себе: "
        return label
    }()
    
    lazy var textFieldAboutMe: UITextField = {
        var textField = UITextField()
        textField.font = Constans.Fonts.robotoRegular15
        textField.placeholder = "Я пока о вас ничего не знаю("
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    // MARK: - Lifecycle
    public override func loadView() {
        super.loadView()
        view.addSubview(imageViewUser)
        view.addSubview(labelNumberPhone)
        view.addSubview(textFieldPhone)
        view.addSubview(labelName)
        view.addSubview(textFieldName)
        view.addSubview(labelNickName)
        view.addSubview(textFieldNickName)
        view.addSubview(labelCity)
        view.addSubview(textFieldCity)
        view.addSubview(labelDateOfBirth)
        view.addSubview(textFieldDateOfBirth)
        view.addSubview(labelZodiacSign)
        view.addSubview(textFieldZodiacSign)
        view.addSubview(labelAboutMe)
        view.addSubview(textFieldAboutMe)
        
        let margins = view.safeAreaLayoutGuide
        
        imageViewUser.translatesAutoresizingMaskIntoConstraints = false
        imageViewUser.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewUser.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewUser.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageViewUser.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        
        labelNumberPhone.translatesAutoresizingMaskIntoConstraints = false
        labelNumberPhone.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelNumberPhone.topAnchor.constraint(equalTo: imageViewUser.bottomAnchor, constant: 40).isActive = true
        labelNumberPhone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelNumberPhone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        textFieldPhone.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldPhone.topAnchor.constraint(equalTo: labelNumberPhone.bottomAnchor, constant: 5).isActive = true
        textFieldPhone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldPhone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelName.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 5).isActive = true
        labelName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        textFieldName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5).isActive = true
        textFieldName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        labelNickName.translatesAutoresizingMaskIntoConstraints = false
        labelNickName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelNickName.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 5).isActive = true
        labelNickName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelNickName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldNickName.translatesAutoresizingMaskIntoConstraints = false
        textFieldNickName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldNickName.topAnchor.constraint(equalTo: labelNickName.bottomAnchor, constant: 5).isActive = true
        textFieldNickName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldNickName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        labelCity.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelCity.topAnchor.constraint(equalTo: textFieldNickName.bottomAnchor, constant: 5).isActive = true
        labelCity.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelCity.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldCity.translatesAutoresizingMaskIntoConstraints = false
        textFieldCity.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldCity.topAnchor.constraint(equalTo: labelCity.bottomAnchor, constant: 5).isActive = true
        textFieldCity.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldCity.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        labelDateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        labelDateOfBirth.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelDateOfBirth.topAnchor.constraint(equalTo: textFieldCity.bottomAnchor, constant: 5).isActive = true
        labelDateOfBirth.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelDateOfBirth.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldDateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        textFieldDateOfBirth.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldDateOfBirth.topAnchor.constraint(equalTo: labelDateOfBirth.bottomAnchor, constant: 5).isActive = true
        textFieldDateOfBirth.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldDateOfBirth.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        labelZodiacSign.translatesAutoresizingMaskIntoConstraints = false
        labelZodiacSign.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelZodiacSign.topAnchor.constraint(equalTo: textFieldDateOfBirth.bottomAnchor, constant: 5).isActive = true
        labelZodiacSign.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelZodiacSign.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldZodiacSign.translatesAutoresizingMaskIntoConstraints = false
        textFieldZodiacSign.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldZodiacSign.topAnchor.constraint(equalTo: labelZodiacSign.bottomAnchor, constant: 5).isActive = true
        textFieldZodiacSign.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldZodiacSign.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        labelAboutMe.translatesAutoresizingMaskIntoConstraints = false
        labelAboutMe.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelAboutMe.topAnchor.constraint(equalTo: textFieldZodiacSign.bottomAnchor, constant: 5).isActive = true
        labelAboutMe.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelAboutMe.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
        textFieldAboutMe.translatesAutoresizingMaskIntoConstraints = false
        textFieldAboutMe.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textFieldAboutMe.topAnchor.constraint(equalTo: labelAboutMe.bottomAnchor, constant: 5).isActive = true
        textFieldAboutMe.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        textFieldAboutMe.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    // MARK: - ViewDidAppear
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateData()
    }
    
    private func updateData () {
        textFieldPhone.text = UserDefaults.standard.userPhone
        textFieldName.text = UserDefaults.standard.nameUser
        textFieldNickName.text = UserDefaults.standard.nickNameUser
        textFieldCity.text = UserDefaults.standard.cityUser
        textFieldDateOfBirth.text = UserDefaults.standard.dateOfBirthUser
        textFieldZodiacSign.text = UserDefaults.standard.zodiacSignUser
        textFieldAboutMe.text = UserDefaults.standard.aboutMeUser
        
        guard let data = UserDefaults.standard.data(forKey: KeysUserDefaults.imageUser) else { return }
             let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
             let image = UIImage(data: decoded)
        imageViewUser.image = image
    }
}

