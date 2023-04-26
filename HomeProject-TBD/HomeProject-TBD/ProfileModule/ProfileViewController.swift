//
//  ProfileViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    private let serviceAPI = APIProfile()
    
    // MARK: - View
    private var imageViewUser: UIImageView = {
        var view = UIImageView()
        view.image = Constans.Image.imageLogo
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var labelNumberPhone: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.text = "Ваш номер телефона: "
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        return label
    }()
    
    private var textFieldPhone: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.text = "Ваше имя: "
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        return label
    }()
    
    private var textFieldName: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    lazy var labelNickName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.text = "Ваш никнейм: "
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        return label
    }()
    
    private var textFieldNickName: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    lazy var labelCity: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Ваш город проживания: "
        return label
    }()
    
    private var textFieldCity: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.placeholder = "Город ангелов)"
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    lazy var labelDateOfBirth: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Ваш день рождения: "
        return label
    }()
    
    private var textFieldDateOfBirth: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.placeholder = "Вы точно родились в четверг!"
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    lazy var labelZodiacSign: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Ваш знак задиака: "
        return label
    }()
    
    private var textFieldZodiacSign: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.placeholder = "Возможно вы телец?"
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    lazy var labelAboutMe: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "О себе: "
        return label
    }()
    
    private var textFieldAboutMe: UITextField = {
        var view = UITextField()
        view.font = Constans.Fonts.robotoRegular15
        view.placeholder = "Я пока о вас ничего не знаю("
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Ваш профиль"
        
        textFieldPhone.text = UserDefaults.standard.userPhone
        textFieldName.text = UserDefaults.standard.nameUser
        textFieldNickName.text = UserDefaults.standard.nickNameUser
        
        self.textFieldPhone.delegate = self
        self.textFieldName.delegate = self
        self.textFieldNickName.delegate = self
        self.textFieldCity.delegate = self
        self.textFieldDateOfBirth.delegate = self
        self.textFieldZodiacSign.delegate = self
        self.textFieldAboutMe.delegate = self

        setnavigationItem()
        getZodiacSign()
    }
    
    private func setnavigationItem () {
        navigationItem.largeTitleDisplayMode = .never
        
        let editImage    = UIImage(systemName: "pencil.circle")
        let updateImage  = UIImage(systemName: "arrow.counterclockwise.icloud")
        
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(didTapEditButton(sender:)))
        let updateButton = UIBarButtonItem(image: updateImage,  style: .plain, target: self, action: #selector(didTapUpdateButton(sender:)))
        
        navigationItem.rightBarButtonItems = [editButton, updateButton]
    }
    
    @objc func didTapEditButton(sender: AnyObject){
        let vc = EditProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func didTapUpdateButton(sender: AnyObject) {
        serviceAPI.fetchProfileUser { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print("Error loading recommended podcasts: \(error.localizedDescription)")
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       if textField == textFieldPhone {
       }
       return false
    }
    
    func getZodiacSign() {
        let dateString = textFieldDateOfBirth.text // "1990-05-25"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString ?? "1990-05-25") {
            let zodiacSign = dateString!.getZodiacSign(for: date)
            print(zodiacSign)
            textFieldZodiacSign.text = zodiacSign
        }
    }
    
}

