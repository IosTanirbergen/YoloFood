//
//  StoriesViewCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 25.02.2022.
//

import Foundation
import UIKit

class StoriesDetailViewCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storiesVC = StoriesDetailViewController()
        storiesVC.modalTransitionStyle = .coverVertical
        storiesVC.modalPresentationStyle = .fullScreen
        navigationController.present(storiesVC, animated: true, completion: nil)
    }
}
