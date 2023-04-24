//
//  ChatTableViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class ChatTableViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = .white
        view.rowHeight = 60
        view.separatorStyle = .none
        return view
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()

        view.addSubview(tableView)
        
        let margins = view.safeAreaLayoutGuide

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Chat"
        navigationItem.largeTitleDisplayMode = .never
        
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(rightBarButton))
    }
    
    @objc func rightBarButton() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


