//
//  HomeCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

protocol ShowQuestionListFlow {
    func showQuestionList()
}

protocol ShowStoriesDetailFlow {
    func showStoriesDetail()
}

protocol ShowShopFlow {
    func showShopFlow()
}

typealias HomeCoordinatorOutputProtocol = ShowQuestionListFlow & ShowStoriesDetailFlow & ShowShopFlow

class HomeCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self 
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorOutputProtocol {
    
    // MARK: - FlowMethods
    func showQuestionList() {
        let questionListCoordinator = QuestionListCoordinator(navigationController: navigationController)
        coordinate(to: questionListCoordinator)
    }
    
    func showStoriesDetail() {
        let storiesDetailCoordinator = StoriesDetailViewCoordinator(navigationController: navigationController)
        coordinate(to: storiesDetailCoordinator)
    }
    
    func showShopFlow() {
        let shopCoordinator = CompanyCoordinator(navigationController: navigationController)
        coordinate(to: shopCoordinator)
    }
}
