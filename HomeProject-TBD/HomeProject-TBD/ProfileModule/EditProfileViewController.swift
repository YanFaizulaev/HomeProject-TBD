//
//  EditProfileViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 25.04.2023.
//

import UIKit

final class EditProfileViewController: ProfileViewControllerDefault {
    
    private lazy var buttonResetImage : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = Constans.Color.colorButtonBlue
        button.setTitle("Выбрать фотографию", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constans.Fonts.robotoRegular15
        button.addTarget(self, action: #selector(buttonReset), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Кнопка для замены картинки
    @objc func buttonReset () {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.addSubview(buttonResetImage)
        
        let margins = view.safeAreaLayoutGuide
        
        buttonResetImage.translatesAutoresizingMaskIntoConstraints = false
        buttonResetImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonResetImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 25).isActive = true
        buttonResetImage.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -25).isActive = true
        buttonResetImage.topAnchor.constraint(equalTo: imageViewUser.bottomAnchor, constant: 10).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        createDatePicker()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setView() {
        title = "Редактирование"
        view.backgroundColor = .systemBackground
        
        self.textFieldPhone.delegate = self
        self.textFieldNickName.delegate = self
        self.textFieldZodiacSign.delegate = self
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(rightBarButton))
    }
    
    @objc func rightBarButton() {
        if textFieldName.text!.count == 0 {
            let alert = UIAlertController(title: "Заполните пожалуйста поле с вашим именем.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        } else if textFieldCity.text!.count == 0 {
            let alert = UIAlertController(title: "Заполните пожалуйста поле с вашим местом жительства.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }  else if textFieldDateOfBirth.text!.count == 0 {
            let alert = UIAlertController(title: "Заполните пожалуйста поле с вашим днем рождения.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }  else if textFieldAboutMe.text!.count == 0 {
            let alert = UIAlertController(title: "Заполните пожалуйста поле о себе.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Повторить ввод", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: false)
            self.dismiss(animated: false, completion: nil)
            UserDefaults.standard.set(textFieldName.text, forKey: KeysUserDefaults.nameUser)
            UserDefaults.standard.set(textFieldCity.text, forKey: KeysUserDefaults.cityUser)
            UserDefaults.standard.set(textFieldDateOfBirth.text, forKey: KeysUserDefaults.dateOfBirthUser)
            UserDefaults.standard.set(textFieldZodiacSign.text, forKey: KeysUserDefaults.zodiacSignUser)
            UserDefaults.standard.set(textFieldAboutMe.text, forKey: KeysUserDefaults.aboutMeUser)
        }
    }
    
    private let datePicker = UIDatePicker()
    
    private func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([flexible, doneButton], animated: true)
        
        textFieldDateOfBirth.inputAccessoryView = toolBar
        textFieldDateOfBirth.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(doneAction), for: .valueChanged)
    }
    
    @objc func doneAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        textFieldDateOfBirth.text = formatter.string(from: datePicker.date)
        textFieldZodiacSign.text = textFieldDateOfBirth.text!.getZodiacSign()
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        textFieldDateOfBirth.text = formatter.string(from: datePicker.date)
        textFieldZodiacSign.text = textFieldDateOfBirth.text!.getZodiacSign()
        self.view.endEditing(true)
    }
}

extension EditProfileViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       if textField == textFieldPhone {
       }
       return false
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage {
            imageViewUser.image = image
            
            guard let data = image.jpegData(compressionQuality: 0.5) else { return }
            let encoded = try! PropertyListEncoder().encode(data)
            UserDefaults.standard.set(encoded, forKey: KeysUserDefaults.imageUser)
        }
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
