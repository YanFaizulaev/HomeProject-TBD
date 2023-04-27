//
//  RegistrationViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    var phone: String?
    
    // MARK: - View
    private var imageView: UIImageView = {
        var view = UIImageView()
        view.image = Constans.Image.imageLogo
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var textView: UILabel = {
        var view = UILabel()
        view.text = "Регистрация в ЗГТ"
        view.textAlignment = .center
        view.textColor = Constans.Color.colorButtonBlue
        view.font = Constans.Fonts.robotoRegular15
        return view
    }()
    
    private var textFieldNumberPhone: TextFieldPhone = {
        var view = TextFieldPhone()
        view.font = Constans.Fonts.robotoItalic15
        view.cornerRadius = 10
        view.borderWidth = 1
        view.borderColor = UIColor.gray
        view.textColor = .black
        view.clearButtonMode = .whileEditing
        view.tintColor = .blue
        return view
    }()
    
    private var textFieldName: TextFieldCustom = {
        var view = TextFieldCustom()
        view.placeholder = "Введите Имя"
        view.setPlaceholder("Введите Имя", color: UIColor.gray)
        view.font = Constans.Fonts.robotoRegular15
        view.cornerRadius = 10
        view.borderWidth = 1
        view.borderColor = UIColor.gray
        view.textColor = .black
        view.clearButtonMode = .whileEditing
        view.tintColor = .blue
        return view
    }()
    
    private var textFieldNickName: TextFieldUserName = {
        var view = TextFieldUserName()
        view.placeholder = "Введите Ник"
        view.setPlaceholder("Введите Ник", color: UIColor.gray)
        view.font = Constans.Fonts.robotoRegular15
        view.cornerRadius = 10
        view.borderWidth = 1
        view.borderColor = UIColor.gray
        view.textColor = .black
        view.clearButtonMode = .whileEditing
        view.tintColor = .blue
        return view
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
        let vc = ChatTableViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: true)
        UserDefaults.standard.set(textFieldName.text, forKey: KeysUserDefaults.nameUser)
        UserDefaults.standard.set(textFieldNickName.text, forKey: KeysUserDefaults.nickNameUser)
//        UserDefaults.standard.set(response.userID, forKey: KeysUserDefaults.userID)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(textFieldNumberPhone)
        view.addSubview(textFieldName)
        view.addSubview(textFieldNickName)
        view.addSubview(buttonRegistration)

        let margins = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -20).isActive = true
        
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
        
        view.backgroundColor = .white
        textFieldNumberPhone.text = self.phone
        self.textFieldNumberPhone.delegate = self
        
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       if textField == textFieldNumberPhone {
       }
       return false
    }
    
}
