//
//  QuestionListCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import Foundation
import UIKit

class QuestionListCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let questionListViewController = QuestionListViewController()
        questionListViewController.modalPresentationStyle = .fullScreen
        questionListViewController.modalTransitionStyle = .coverVertical
        navigationController.present(questionListViewController, animated: true, completion: nil)
    }
}

extension QuestionListCoordinator {
    
}
