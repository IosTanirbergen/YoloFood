//
//  DetailPrifleViewController.swift
//  YoloFood
//
//  Created by Zhanibek Santay on 16.06.2022.
//

import UIKit

final class DetailProfileViewController: BaseViewController {
    
    // MARK: - UI Elements:
    fileprivate lazy var tableView: UITableView = {
        return $0
    }(UITableView())
    
    // MARK: - Factory
    private let factory = TableViewFactory()
    
    // MARK: - Facade
    private let facade = TableViewFacade()
    
    private var images = ["user", "book", "card", "payout", "bell"]
    private var titles = ["Профиль", "Контакты", "Платежи", "Привязанные карточки", "Уведомления"]

    // MARK: - Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        configureUI()
        configureTableView()
    }
}

// MARK: - ConfigureUI:

extension DetailProfileViewController {
    
    private func configureUI() {
        [tableView].forEach {
            view.addSubview($0)
        }
        
        [tableView].forEach {
            $0.register(DetailProfileTableViewCell.self, forCellReuseIdentifier: String(describing: DetailProfileTableViewCell.self))
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
extension DetailProfileViewController: TableViewDelegateProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailProfileTableViewCell.self), for: indexPath) as! DetailProfileTableViewCell
        cell.rightImage.image = UIImage(named: images[indexPath.row])
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

