//
//  AppCoordinator .swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 19.02.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}

final class AppCoordinator: Coordinator {
    
    // MARK: - Init
    var window: UIWindow
    var logOut = String()
    private let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        if logOut == "true" {
            let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
            coordinate(to: onboardingCoordinator)
            return
        }
        let onboardingCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: onboardingCoordinator)
    }
}
