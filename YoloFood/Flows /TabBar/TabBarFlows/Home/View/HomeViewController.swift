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
    
    // MARK: - HomeFacade
    let factory = HomeFactory()
    private let facade = HomeViewControllerFacade()
    
    // MARK: - Header View
    
    private let storiesView = StoriesView()
    
    let tableView: UITableView = {
        let lb = UITableView(frame: .zero, style: .grouped)
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        showQuestionListIfNeeded()
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
    
    private func showQuestionListIfNeeded() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
//            guard let self = self else { return }
//            //self.delegate?.showQuestionListFlow()
//        }
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        [ListNewsTableViewCell.self].forEach {
            tableView.register($0, forCellReuseIdentifier: $0.description())
        }
        
    }
    
    private func showStoriesIfNeeded() {
        storiesView.tappedStories = { val in
           
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

