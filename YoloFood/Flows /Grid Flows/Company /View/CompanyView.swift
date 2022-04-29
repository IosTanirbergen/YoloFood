//
//  ShopView.swift
//  YoloFood
//
//  Created by beshssg on 24.04.2022.
//

import UIKit

class CompanyView: UIView {
    
    var viewModel: CompanyViewModel
    
    private var tableView: UITableView = {
        let tb = UITableView(frame: .zero)
        return tb
    }()
    
    private var tableFactory = TableViewFactory()
    private var tableFacade = TableViewFacade()
    
    init(viewModel: CompanyViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError(#function)
    }
}

extension CompanyView {
    
    private func setup() {
        addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: CompanyTableViewCell.description())
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        tableFactory.makeRefreshControl(tableView: tableView)
        tableFacade.configureRefreshControl(refresh: tableFactory.makeRefreshControl())
    }
}

extension CompanyView: TableViewDelegateProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
}
