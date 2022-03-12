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
        return sizeForServicesCell(indexPath: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    private func configureCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ServicesTableViewCell.description(), for: indexPath) as!
            ServicesTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ListNewsTableViewCell.description(), for: indexPath) as!
            ListNewsTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    private func sizeForServicesCell(indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            let size = (UIScreen.main.bounds.size.width) / 1.2 - 44.5
            return size
        case 1:
            return 300
        default:
            return 0
        }

    }
}
