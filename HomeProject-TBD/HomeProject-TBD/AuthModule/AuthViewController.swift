//
//  AuthViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - View
    private var imageView: UIImageView = {
        var view = UIImageView()
        view.image = Constans.Image.imageLogo
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var textFieldPhone: UITextField = {
        var view = UITextField()
        view.placeholder = "Введите номер телефона"
        view.font = Constans.Fonts.robotoRegular13
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    private lazy var buttonSms : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Constans.Color.colorButtonBlue
        button.setTitle("Sms", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular13
        button.addTarget(self, action: #selector(buttonPost), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPost () {
        print("Post")
    }
    
    private var textFieldSms: UITextField = {
        var view = UITextField()
        view.placeholder = "Введите код с СМС"
        view.font = Constans.Fonts.robotoItalic13
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()

    private lazy var buttonRegistration : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Constans.Color.colorButtonBlue
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular13
        button.addTarget(self, action: #selector(buttonBackView), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonBackView () {
        let vc = RegistrationViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // MARK: - Functions
    func layout() {
        view.addSubview(imageView)
        view.addSubview(textFieldPhone)
        view.addSubview(buttonSms)
        view.addSubview(textFieldSms)
        view.addSubview(buttonRegistration)
        
        let margins = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textFieldPhone.topAnchor, constant: -20).isActive = true
        
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        textFieldPhone.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldPhone.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textFieldPhone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldPhone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -60).isActive = true
        
        buttonSms.translatesAutoresizingMaskIntoConstraints = false
        buttonSms.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonSms.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonSms.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        buttonSms.topAnchor.constraint(equalTo: textFieldPhone.topAnchor, constant: 0).isActive = true
        
        textFieldSms.translatesAutoresizingMaskIntoConstraints = false
        textFieldSms.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldSms.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldSms.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textFieldSms.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 20).isActive = true
        
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistration.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonRegistration.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 25).isActive = true
        buttonRegistration.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -25).isActive = true
        buttonRegistration.topAnchor.constraint(equalTo: textFieldSms.bottomAnchor, constant: 20).isActive = true
        
        
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistration.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonRegistration.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 25).isActive = true
        buttonRegistration.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -25).isActive = true
        buttonRegistration.topAnchor.constraint(equalTo: textFieldSms.bottomAnchor, constant: 20).isActive = true
    
    }
}
