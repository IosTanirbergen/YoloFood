//
//  ShopCoordinator.swift
//  YoloFood
//
//  Created by beshssg on 24.04.2022.
//

import Foundation
import UIKit

final class ShopCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    private lazy var shopViewController: ShopViewController = {
        let shopViewController = ShopViewController()
        return shopViewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(shopViewController, animated: true)
    }
}
