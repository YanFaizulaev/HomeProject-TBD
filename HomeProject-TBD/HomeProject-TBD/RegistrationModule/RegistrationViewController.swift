//
//  RegistrationViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - View
    private var imageView: UIImageView = {
        var view = UIImageView()
        view.image = Constans.Image.imageLogo
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var textView: UITextView = {
        var view = UITextView()
        view.text = "Регистрация в ЗГТ"
        view.textAlignment = .center
        view.textColor = Constans.Color.colorButtonBlue
        view.font = Constans.Fonts.robotoRegular13
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
    
    private var textFieldName: UITextField = {
        var view = UITextField()
        view.placeholder = "Введите Имя"
        view.font = Constans.Fonts.robotoRegular13
        view.borderStyle = UITextField.BorderStyle.roundedRect
        view.autocorrectionType = UITextAutocorrectionType.no
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return view
    }()
    
    private var textFieldNickName: UITextField = {
        var view = UITextField()
        view.placeholder = "Введите Ник"
        view.font = Constans.Fonts.robotoRegular13
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
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular13
        button.addTarget(self, action: #selector(buttonNextView), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonNextView () {
        let vc = ChatTableViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(textFieldPhone)
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
        textView.bottomAnchor.constraint(equalTo: textFieldPhone.topAnchor, constant: -20).isActive = true
        
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        textFieldPhone.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldPhone.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textFieldPhone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldPhone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        textFieldName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textFieldName.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 20).isActive = true
        
        textFieldNickName.translatesAutoresizingMaskIntoConstraints = false
        textFieldNickName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldNickName.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldNickName.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textFieldNickName.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20).isActive = true
        
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistration.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonRegistration.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 25).isActive = true
        buttonRegistration.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -25).isActive = true
        buttonRegistration.topAnchor.constraint(equalTo: textFieldNickName.bottomAnchor, constant: 20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
}
