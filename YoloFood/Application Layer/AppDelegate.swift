//
//  AppDelegate.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 16.02.2022.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /// * Window
        configureWindow()
        
        /// * Coordinator
        setCoordinator()
        
        /// * IQKeyboardManager
        setConfigureKeyboard()
        
        return true
    }
    
    private func setCoordinator() {
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
    }
    
    private func configureWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        Thread.sleep(forTimeInterval: 1.0)
    }
    
    private func setConfigureKeyboard() {
        IQKeyboardManager.shared.enable = true
    }
}

