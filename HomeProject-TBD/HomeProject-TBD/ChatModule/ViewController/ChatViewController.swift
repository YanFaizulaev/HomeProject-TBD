//
//  ChatViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 25.04.2023.
//

import UIKit

class ChatViewController: UIViewController{
    
    var file: ChatTableViewModel?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = file?.labelNameChat
        
        let image = UIImage(systemName: "doc.text.magnifyingglass")
//        let image = file?.labelImage.withTintColor(.white)
        let resizedImage = image?.resizeImage(targetSize: CGSize(width: 40, height: 40))
        let button = UIBarButtonItem(image: resizedImage, style: .plain, target: self, action: #selector(rightBarButton))
        button.image?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = button
        
    }
    
    @objc func rightBarButton() {
        print("Информация про чат")
//        let vc = InfoChatViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

