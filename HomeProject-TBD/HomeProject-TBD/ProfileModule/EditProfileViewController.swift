//
//  EditProfileViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 25.04.2023.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    // MARK: - View
    private var imageViewUser: UIImageView = {
        var view = UIImageView()
//         поменять
        view.image = Constans.Image.imageLogo
        view.contentMode = .scaleAspectFit
        return view
    }()
    
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
    
    @objc func buttonReset () {
        print("Замена картинки")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageViewUser)
        view.addSubview(buttonResetImage)
        
        let margins = view.safeAreaLayoutGuide
        
        imageViewUser.translatesAutoresizingMaskIntoConstraints = false
        imageViewUser.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewUser.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewUser.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageViewUser.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        
        buttonResetImage.translatesAutoresizingMaskIntoConstraints = false
        buttonResetImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonResetImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 25).isActive = true
        buttonResetImage.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -25).isActive = true
        buttonResetImage.topAnchor.constraint(equalTo: imageViewUser.bottomAnchor, constant: 10).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Edit Profile"
        navigationItem.largeTitleDisplayMode = .never
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(rightBarButton))
    }
    
    @objc func rightBarButton() {
        navigationController?.popViewController(animated: false)
        self.dismiss(animated: false, completion: nil)
    }
}
