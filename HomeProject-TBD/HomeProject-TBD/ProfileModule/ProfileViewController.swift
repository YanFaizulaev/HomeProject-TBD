//
//  ProfileViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class ProfileViewController: ProfileViewControllerDefault {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setnavigationItem()
    }
    
    // MARK: - Functions
    private func setView() {
        title = "Ваш профиль"
        view.backgroundColor = .systemBackground
        
        self.textFieldPhone.delegate = self
        self.textFieldName.delegate = self
        self.textFieldNickName.delegate = self
        self.textFieldCity.delegate = self
        self.textFieldDateOfBirth.delegate = self
        self.textFieldZodiacSign.delegate = self
        self.textFieldAboutMe.delegate = self
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
    
    private func setnavigationItem () {
        navigationItem.largeTitleDisplayMode = .never
        
        let updateImage = UIImage(systemName: "arrow.counterclockwise.icloud")
        let editImage = UIImage(systemName: "pencil.circle")
        
        let updateButton = UIBarButtonItem(image: updateImage,  style: .plain, target: self, action: #selector(didTapUpdateButton(sender:)))
        let editButton = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(didTapEditButton(sender:)))
        
        navigationItem.rightBarButtonItems = [editButton, updateButton]
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
        let alert = UIAlertController(title: "Возникли проблемы. Мы их решаем)", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторите запрос", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func didTapEditButton(sender: AnyObject){
        let vc = EditProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       if textField == textFieldPhone {
       }
       return false
    }
}

