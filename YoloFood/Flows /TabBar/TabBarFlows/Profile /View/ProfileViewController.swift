//
//  ProfileViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import UIKit

final class ProfileViewController: BaseViewController {
    
// MARK: - UI Elements:
    
    fileprivate lazy var tableView: UITableView = {
        return $0
    }(UITableView())
    
// MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - ConfigureUI:

extension ProfileViewController {
    
    func configureUI() {
        [view].forEach {
            $0?.backgroundColor = .white
            $0?.addSubview(tableView)
        }
        
        [tableView].forEach {
            $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
            $0.delegate = self
            $0.dataSource = self
            
            $0.separatorStyle = .none
        }
        
        makeConstraints()
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - TableViewDelegate / DataSource:

extension ProfileViewController: TableViewDelegateProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
