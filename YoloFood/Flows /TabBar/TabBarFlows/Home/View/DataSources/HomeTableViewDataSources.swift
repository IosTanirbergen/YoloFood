//
//  HomeTableViewDataSources.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 23.02.2022.
//

import Foundation
import UIKit

extension HomeViewController: TableViewDelegateProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(indexPath: indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sizeForServicesCell(tableView: tableView, indexPath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factory.makeNewsItems().count
    }
    
    /// * Header View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return serviceHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sizeForHeader()
    }
}

// MARK: - Configure Cells
extension HomeViewController {
    
    private func configureCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListNewsTableViewCell.description(), for: indexPath) as!
        ListNewsTableViewCell
        cell.configure(data: factory.makeNewsItems()[indexPath.row])
        return cell
    }
    
    private func sizeForServicesCell(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    private func sizeForHeader() -> CGFloat {
        let size = (UIScreen.main.bounds.size.width) / 1.2 - 44.5
        return size
    }
    
    private func sizeHideHeader() -> CGFloat {
        let size = (UIScreen.main.bounds.size.width) / 1.1 - 44.5
        return size
    }
    
    private func serviceHeaderView() -> UIView {
        let view = ServicesView()
        return view
    }
}
