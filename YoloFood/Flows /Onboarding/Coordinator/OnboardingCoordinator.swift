//
//  OnboardingCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 19.02.2022.
//

import Foundation
import UIKit

protocol ShowTabBarFlow {
    func showTabBarFlow()
}

typealias OnboardingOutputProtocol = ShowTabBarFlow

class OnboardingCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.delegate = self 
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
}

extension OnboardingCoordinator: OnboardingOutputProtocol {
    // MARK: - FlowMethods
    func showTabBarFlow() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
