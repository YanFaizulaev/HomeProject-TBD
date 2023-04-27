//
//  AuthViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit
import PhoneNumberKit
import CountryPickerView


final class AuthViewController: UIViewController {
    
    // MARK: - Service
    private let serviceAPI = APIAuthNetwork()
    
    // MARK: - View
    private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = Constans.Image.imageLogo
        imageView.tintColor = .clear
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var textFieldNumberPhone: TextFieldPhone = {
        var textField = TextFieldPhone()
        textField.placeholder = "Введите номер телефона"
        textField.setPlaceholder("Введите номер телефона", color: UIColor.gray)
        textField.font = Constans.Fonts.robotoItalic15
        textField.cornerRadius = 10
        textField.borderWidth = 1
        textField.borderColor = UIColor.gray
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .blue
        return textField
    }()
    
    private lazy var buttonSms : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Constans.Color.colorButtonBlue
        button.setTitle("Sms", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular15
        button.addTarget(self, action: #selector(buttonPost), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Кнопка отправки кода для подтверждения
    @objc func buttonPost () {
        setAuthUser()
        let alert = UIAlertController(title: "СМС с кодом отправлен на ваш телефон.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Хорошо", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    private var textFieldCode: TextFieldCode = {
        var textField = TextFieldCode()
        textField.placeholder = "Введите код с СМС"
        textField.setPlaceholder("Введите код с СМС", color: UIColor.gray)
        textField.font = Constans.Fonts.robotoItalic15
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
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular15
        button.addTarget(self, action: #selector(buttonNextView), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Кнопка для перехода на следующий экран
    @objc func buttonNextView () {
        setAuthCheckUser()
        if textFieldCode.text == "133337" {
            let vc = RegistrationViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.phone = textFieldNumberPhone.text
            self.navigationController?.pushViewController(vc, animated: true)
            UserDefaults.standard.set(textFieldNumberPhone.text, forKey: KeysUserDefaults.userPhone)
            UserDefaults.standard.set(true, forKey: KeysUserDefaults.userIsLogged)
        } else {
            let alert = UIAlertController(title: "Код для подтверждения неверный.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.addSubview(imageView)
        view.addSubview(textFieldNumberPhone)
        view.addSubview(buttonSms)
        view.addSubview(textFieldCode)
        view.addSubview(buttonRegistration)
        
        let margins = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textFieldNumberPhone.topAnchor, constant: -20).isActive = true
        
        textFieldNumberPhone.translatesAutoresizingMaskIntoConstraints = false
        textFieldNumberPhone.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldNumberPhone.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textFieldNumberPhone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldNumberPhone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -60).isActive = true
        
        buttonSms.translatesAutoresizingMaskIntoConstraints = false
        buttonSms.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonSms.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonSms.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        buttonSms.topAnchor.constraint(equalTo: textFieldNumberPhone.topAnchor, constant: 0).isActive = true
        
        textFieldCode.translatesAutoresizingMaskIntoConstraints = false
        textFieldCode.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textFieldCode.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        textFieldCode.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        textFieldCode.topAnchor.constraint(equalTo: textFieldNumberPhone.bottomAnchor, constant: 20).isActive = true
        
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistration.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonRegistration.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        buttonRegistration.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
        buttonRegistration.topAnchor.constraint(equalTo: textFieldCode.bottomAnchor, constant: 20).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - Functions
    private func setAuthUser () {
        serviceAPI.fetchAuthUserPhone(phone: textFieldNumberPhone.text ?? "") { result in
            switch result {
            case .success(let response):
                if response.is_success == true {
                    print("Пользователь зарегистрирован")
                }
            case .failure(let error):
                print("Error loading recommended podcasts: \(error.localizedDescription)")
            }
        }
    }
    
    private func setAuthCheckUser () {
        serviceAPI.fetchAuthCheckUser(phone: textFieldNumberPhone.text ?? "", code: textFieldCode.text ?? "") { result in
            switch result {
            case .success(let response):
                UserDefaults.standard.set(response.access_token, forKey: KeysUserDefaults.accessTokenUser)
                UserDefaults.standard.set(response.refresh_token, forKey: KeysUserDefaults.refreshTokenUser)
                print("Пользователь проходит регистрацию")
            case .failure(let error):
                print("Error loading recommended podcasts: \(error.localizedDescription)")
            }
        }
    }
}
