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
    
    // MARK: - Factory
    private let factory = TableViewFactory()
    
    // MARK: - Facade
    private let facade = TableViewFacade()
    
    // MARK: - Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
}

// MARK: - ConfigureUI:

extension ProfileViewController {
    
    private func configureUI() {
        [tableView].forEach {
            view.addSubview($0)
        }
        
        [tableView].forEach {
            $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: String(describing: ProfileTableViewCell.self))
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.backgroundColor = .clear
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        factory.makeRefreshControl(tableView: tableView)
        facade.configureRefreshControl(refresh: factory.makeRefreshControl())
    }
}

// MARK: - TableViewDelegate / DataSource:

extension ProfileViewController: TableViewDelegateProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
