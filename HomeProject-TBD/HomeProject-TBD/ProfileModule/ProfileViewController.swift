//
//  ProfileViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()

//        let margins = view.safeAreaLayoutGuide

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Profile"
        navigationItem.largeTitleDisplayMode = .never
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                            target: self,
                                                            action: #selector(rightBarButton))
    }
    
    @objc func rightBarButton() {
//        let vc = ProfileViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        self.navigationController?.pushViewController(vc, animated: true)
    }

}



