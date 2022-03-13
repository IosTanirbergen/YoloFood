//
//  ProfileFactory.swift
//  YoloFood
//
//  Created by beshssg on 13.03.2022.
//

import UIKit

final class TableViewFactory {
    
    private let refreshControl = UIRefreshControl()
    
    func makeRefreshControl() -> UIRefreshControl {
        return refreshControl
    }
    
    func makeRefreshControl(tableView: UITableView) {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
    
}
