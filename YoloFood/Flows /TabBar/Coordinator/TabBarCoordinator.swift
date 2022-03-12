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
    private let homeViewController = UINavigationController()
    private let searchViewController = UINavigationController()
    private let orderViewController = UINavigationController()
    private let myPlansviewController = UINavigationController()
    private let profileViewController = UINavigationController()
    
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
        let homeCoordinator = HomeCoordinator(navigationController: homeViewController)
        let searchCoordinator = SearchCoordinator(navigationController: searchViewController)
        let orderCoordinator = OrderCoordinator(navigationController: orderViewController)
        let myPlansCoordinator = MyPlansCoordinator(navigationController: myPlansviewController)
        let profileCoordinator = ProfileCoordinator(navigationController: profileViewController)
        
        tabBarController.viewControllers = [
            homeViewController,
            searchViewController,
            orderViewController,
            myPlansviewController,
            profileViewController
        ]
        
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
