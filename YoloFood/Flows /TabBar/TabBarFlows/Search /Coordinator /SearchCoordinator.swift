//
//  SearchCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = SearchViewController()
        navigationController.pushViewController(searchViewController, animated: true)
    }
}
