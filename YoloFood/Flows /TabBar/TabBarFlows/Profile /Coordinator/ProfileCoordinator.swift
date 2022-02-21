//
//  ProfileCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
