//
//  ShopCoordinator.swift
//  YoloFood
//
//  Created by beshssg on 24.04.2022.
//

import Foundation
import UIKit

final class CompanyCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    private lazy var shopViewController: CompanyViewController = {
        let shopViewController = CompanyViewController()
        shopViewController.hidesBottomBarWhenPushed = true 
        shopViewController.viewModel = CompanyViewModel()
        return shopViewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(shopViewController, animated: true)
    }
}
