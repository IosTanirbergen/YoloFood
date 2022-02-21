//
//  MyPlansCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class MyPlansCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let myPlansViewController = MyPlansViewController()
        navigationController.pushViewController(myPlansViewController, animated: true)
    }
}
