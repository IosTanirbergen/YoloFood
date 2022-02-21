//
//  OrderCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class OrderCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let orderViewController = OrderViewController()
        navigationController.pushViewController(orderViewController, animated: true)
    }
}

