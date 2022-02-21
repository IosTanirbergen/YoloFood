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
        return coordinator.start()
    }
}

final class AppCoordinator: Coordinator {
    
    // MARK: - Init
    var window: UIWindow
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        coordinate(to: onboardingCoordinator)
    }
}
