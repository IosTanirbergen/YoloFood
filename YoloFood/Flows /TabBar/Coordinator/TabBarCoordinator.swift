//
//  TabBarCoordinator.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let tabBarController = TabBarViewController()
    
    /// *
    //** tabBarFlows
    /// *
    private let homeViewController = HomeViewController()
    private let searchViewController = SearchViewController()
    private let orderViewController = OrderViewController()
    private let myPlansviewController = MyPlansViewController()
    private let profileViewController = ProfileViewController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        tabBarController.modalTransitionStyle = .crossDissolve
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        configureTabBar()
    }
}

extension TabBarCoordinator {
    
    private func configureTabBar() {
        
        /// home
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        let orderCoordinator = OrderCoordinator(navigationController: navigationController)
        let myPlansCoordinator = MyPlansCoordinator(navigationController: navigationController)
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        
        tabBarController.setViewControllers([
            homeViewController,
            searchViewController,
            orderViewController,
            myPlansviewController,
            profileViewController
        ], animated: true)
        
        configureTabBarIcons()
        
        coordinate(to: homeCoordinator)
        coordinate(to: searchCoordinator)
        coordinate(to: orderCoordinator)
        coordinate(to: myPlansCoordinator)
        coordinate(to: profileCoordinator)
    }
    
    private func configureTabBarIcons() {
        homeViewController.tabBarItem = UITabBarItem(title: nil,
                                                     image: ImagesConstants.TabBarImages.home,
                                                     selectedImage: ImagesConstants.TabBarImages.selectedHome)
        searchViewController.tabBarItem = UITabBarItem(title: nil,
                                                       image: ImagesConstants.TabBarImages.search,
                                                       selectedImage: ImagesConstants.TabBarImages.selectedsearch)
        myPlansviewController.tabBarItem = UITabBarItem(title: nil,
                                                        image: ImagesConstants.TabBarImages.heart,
                                                        selectedImage: ImagesConstants.TabBarImages.selectedHeart)
        profileViewController.tabBarItem = UITabBarItem(title: nil,
                                                        image: ImagesConstants.TabBarImages.profile,
                                                        selectedImage: ImagesConstants.TabBarImages.selectedProfile)
    }
}
