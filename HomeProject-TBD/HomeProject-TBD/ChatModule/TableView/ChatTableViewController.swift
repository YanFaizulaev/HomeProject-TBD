//
//  ChatTableViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 24.04.2023.
//

import UIKit

final class ChatTableViewController: UIViewController {
    
    // MARK: - Model
    private let table: [ChatTableViewModel] = [
        ChatTableViewModel(labelImage: UIImage(named: "3690476")!, labelNameChat: "Рабочий", labelNameUser: "Nikita", labelText: "Завтра собрание!!! В 12:00, не опаздывать!", labelMessage: 25, labelTime: "19:10"),
        ChatTableViewModel(labelImage: UIImage(named: "3690476")!, labelNameChat: "Корпоративный", labelNameUser: "Sveta", labelText: "Не забудьте план теплицы.", labelMessage: 65, labelTime: "14:45"),
        ChatTableViewModel(labelImage: UIImage(named: "3690476")!, labelNameChat: "Партнеры", labelNameUser: "Maxim", labelText: "Собрание акционеров переносится на 2 недели с сохранением времени встречи. Спасибо за понимание.", labelMessage: 78, labelTime: "11:18"),
        ChatTableViewModel(labelImage: UIImage(named: "3690476")!, labelNameChat: "Общий", labelNameUser: "Pavel", labelText: "Я завтра не приду на собрание.", labelMessage: 7, labelTime: "09:15")
            ]
    
    // MARK: - View
    let refreshControl = UIRefreshControl()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = .white
        view.rowHeight = 60
        view.separatorStyle = .none
        view.addSubview(refreshControl)
        return view
    }()
    
    private let fileCellIndentifier = "FileTableViewCell"
    
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.badge.key"), style: UIBarButtonItem.Style.done, target: self, action: #selector(rightBarButton))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: fileCellIndentifier)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    @objc func rightBarButton() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        // Функция для обновление данных
//        updateData()
        refreshControl.endRefreshing()
    }

}

extension ChatTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: fileCellIndentifier) as? ChatTableViewCell
        let viewModel = table[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.file = table[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
