//
//  HomeViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Coordinator Delegate
    var delegate: HomeCoordinator?
    
    // MARK: - Facade
    private let facade = HomeViewControllerFacade()
    private let tableViewFacade = TableViewFacade()
    
    // MARK: - Factory
    private let tableViewFactory = TableViewFactory()
    let factory = HomeFactory()
    
    
    // MARK: - Header View
    private let storiesView = StoriesView()
    
    let tableView: UITableView = {
        let lb = UITableView(frame: .zero, style: .grouped)
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        showStoriesIfNeeded()
    }
}

// MARK: - ConfigureUI
extension HomeViewController {
    
    private func setUI() {
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        
        [storiesView, tableView].forEach {
            view.addSubview($0)
        }
        
        storiesView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.size.height / 6.0)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(storiesView.safeAreaLayoutGuide.snp.bottom).offset(8.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        [ListNewsTableViewCell.self].forEach {
            tableView.register($0, forCellReuseIdentifier: $0.description())
        }
        
        tableViewFactory.makeRefreshControl(tableView: tableView)
        tableViewFacade.configureRefreshControl(refresh: tableViewFactory.makeRefreshControl())
        
    }
    
    private func showStoriesIfNeeded() {
        storiesView.tappedStories = { [weak self] val in
            guard let self = self else { return }
            self.delegate?.showStoriesDetail()
        }
    }
}

// MARK: - Configure Header View
extension HomeViewController {
    
    @objc fileprivate func updateHeaderIfNeeded(notification: Notification) {
        if (notification.object != nil) {
            tableView.tableHeaderView = UIView()
            tableView.reloadData()
            tableView.layoutIfNeeded()
        }
    }
}

