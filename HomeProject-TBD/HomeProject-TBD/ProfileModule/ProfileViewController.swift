//
//  ProfileViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
//    private let serviceAPI = NetworkServices()
    
    // MARK: - View
    private var imageViewUser: UIImageView = {
        var view = UIImageView()
        //         поменять
        view.image = Constans.Image.imageLogo
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var labelNumberPhone: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed1"
        return label
    }()
    
    lazy var labelNameChat: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed2"
        return label
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed3"
        return label
    }()
    
    lazy var labelNickName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed4"
        return label
    }()
    
    lazy var labelCity: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed5"
        return label
    }()
    
    lazy var labelDateOfBirth: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed6"
        return label
    }()
    
    lazy var labelZodiacSign: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Appleseed7"
        return label
    }()
    
    lazy var labelAboutMe: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constans.Fonts.robotoRegular15
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.text = "Sue Applesee"
        return label
    }()
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelNumberPhone, labelNameChat, labelName, labelNickName, labelCity, labelDateOfBirth, labelZodiacSign, labelAboutMe])
        
        //        stackView.axis = .vertical
        //        stackView.alignment = .leading
        //        stackView.distribution = .fill
        //        stackView.spacing = 8
        
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        view.addSubview(imageViewUser)
        view.addSubview(labelStack)
        
        let margins = view.safeAreaLayoutGuide
        
        imageViewUser.translatesAutoresizingMaskIntoConstraints = false
        imageViewUser.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewUser.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewUser.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageViewUser.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        labelStack.topAnchor.constraint(equalTo: imageViewUser.bottomAnchor, constant: 10).isActive = true
        labelStack.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        labelStack.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        labelStack.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Profile"
        
        setnavigationItem()
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
    
    @objc func didTapUpdateButton(sender: AnyObject){
//        serviceAPI.fetchData(urlString: "") { result in
//            switch result {
//            case .success(let response):
//                print(response)
//            case .failure(let error):
//                print("Error loading recommended podcasts: \(error.localizedDescription)")
//            }
//        }
    }
}
