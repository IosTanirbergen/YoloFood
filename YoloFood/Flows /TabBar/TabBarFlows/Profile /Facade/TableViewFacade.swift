//
//  ProrfileFacade.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 13.03.2022.
//

import Foundation
import UIKit

protocol TableViewFacadeProtocol {
    func configureRefreshControl(refresh: UIRefreshControl)
}

final class TableViewFacade: TableViewFacadeProtocol {
    
    private var valueChanged: ((Bool) -> ())? = nil
    
    func configureRefreshControl(refresh: UIRefreshControl) {
        refresh.addTarget(self, action: #selector(updateRefresh(_:)), for: .valueChanged)
        
        valueChanged = {
            if $0 {
                refresh.endRefreshing()
            }
        }
    }
    
    @objc private func updateRefresh(_ sender: Any) {
        valueChanged?(true)
    }
}
