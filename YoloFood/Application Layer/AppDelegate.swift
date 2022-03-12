//
//  AppDelegate.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 16.02.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        setCoordinator()
        return true
    }
    
    private func setCoordinator() {
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
    }
}

