//
//  OnboardingCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 19.02.2022.
//

import Foundation
import UIKit

class OnboardingCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingViewController = OnboardingViewController()
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
}
