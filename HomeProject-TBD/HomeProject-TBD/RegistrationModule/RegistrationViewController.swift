//
//  RegistrationViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Буфер для номера телефона
    var phone: String?
    
    // MARK: - View
    private var imageViewLogo: UIImageView = {
        var imageView = UIImageView()
        imageView.image = Constans.Image.imageLogo
        imageView.tintColor = .clear
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var textView: UILabel = {
        var label = UILabel()
        label.text = "Регистрация в ЗГТ"
        label.textAlignment = .center
        label.textColor = Constans.Color.colorButtonBlue
        label.font = Constans.Fonts.robotoRegular15
        return label
    }()
    
    private var textFieldNumberPhone: TextFieldPhone = {
        var textField = TextFieldPhone()
        textField.font = Constans.Fonts.robotoItalic15
        textField.cornerRadius = 10
        textField.borderWidth = 1
        textField.borderColor = UIColor.gray
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .blue
        return textField
    }()
    
    private var textFieldName: TextFieldCustom = {
        var textField = TextFieldCustom()
        textField.placeholder = "Введите Имя"
        textField.setPlaceholder("Введите Имя", color: UIColor.gray)
        textField.font = Constans.Fonts.robotoRegular15
        textField.cornerRadius = 10
        textField.borderWidth = 1
        textField.borderColor = UIColor.gray
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .blue
        return textField
    }()
    
    private var textFieldNickName: TextFieldUserName = {
        var textField = TextFieldUserName()
        textField.placeholder = "Введите Ник"
        textField.setPlaceholder("Введите Ник", color: UIColor.gray)
        textField.font = Constans.Fonts.robotoRegular15
        textField.cornerRadius = 10
        textField.borderWidth = 1
        textField.borderColor = UIColor.gray
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .blue
        return textField
    }()
    
    private lazy var buttonRegistration : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Constans.Color.colorButtonBlue
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular15
        button.addTarget(self, action: #selector(buttonNextView), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonNextView () {
        if textFieldName.text!.count == 0 {
            let alert = UIAlertController(title: "Заполните пожалуйста поле с вашим именем.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        } else if textFieldNickName.text!.count == 0 {
            let alert = UIAlertController(title: "Заполните пожалуйста поле с вашим никнеймом.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        } else {
            let vc = ChatTableViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(vc, animated: true)
            UserDefaults.standard.set(textFieldName.text, forKey: KeysUserDefaults.nameUser)
            UserDefaults.standard.set(textFieldNickName.text, forKey: KeysUserDefaults.nickNameUser)
            //        UserDefaults.standard.set(response.userID, forKey: KeysUserDefaults.userID)
            UserDefaults.standard.set(true, forKey: KeysUserDefaults.userHasRegistered)
        }
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.addSubview(imageViewLogo)
        view.addSubview(textView)
        view.addSubview(textFieldNumberPhone)
        view.addSubview(textFieldName)
        view.addSubview(textFieldNickName)
        view.addSubview(buttonRegistration)

        let margins = view.safeAreaLayoutGuide
        
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        imageViewLogo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageViewLogo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageViewLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageViewLogo.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -20).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textView.bottomAnchor.constraint(equalTo: textFieldNumberPhone.topAnchor, constant: -20).isActive = true
        
        textFieldNumberPhone.translatesAutoresizingMaskIntoConstraints = false
        textFieldNumberPhone.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldNumberPhone.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textFieldNumberPhone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldNumberPhone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        textFieldName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textFieldName.topAnchor.constraint(equalTo: textFieldNumberPhone.bottomAnchor, constant: 20).isActive = true
        
        textFieldNickName.translatesAutoresizingMaskIntoConstraints = false
        textFieldNickName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldNickName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldNickName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textFieldNickName.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20).isActive = true
        
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistration.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonRegistration.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        buttonRegistration.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        buttonRegistration.topAnchor.constraint(equalTo: textFieldNickName.bottomAnchor, constant: 20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setView () {
        view.backgroundColor = .systemBackground
        textFieldNumberPhone.text = self.phone
        self.textFieldNumberPhone.delegate = self
        
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        self.navigationController?.navigationBar.topItem?.title = " "
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    // MARK: - Functions - Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       if textField == textFieldNumberPhone {
       }
       return false
    }
}
