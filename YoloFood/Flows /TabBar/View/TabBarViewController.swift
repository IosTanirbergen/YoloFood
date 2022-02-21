//
//  TabBarViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

final class TabBarViewController: UITabBarController {
    
    private let tabBarView = TabBarView()
    private let facade = TabBarFacade()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setupMiddleButton()
    }
}

extension TabBarViewController {
    
    private func setUI() {
        view.layoutIfNeeded()
        setValue(TabBarView(frame: tabBar.frame), forKey: "tabBar")
    }
    
    private func setupMiddleButton() {
        let middleBtn = UIButton(type: .system)
        middleBtn.frame = CGRect(x: (self.view.bounds.width / 2)-30, y: -32, width: 60, height: 60)
        middleBtn.setImage(UIImage(named: "order")?.withRenderingMode(.alwaysOriginal), for: .normal)
        middleBtn.imageEdgeInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        middleBtn.backgroundColor = .green
        middleBtn.layer.cornerRadius = 30
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(handleTappedCenterButton), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
}

// MARK: - Tapped Events
extension TabBarViewController {
    @objc fileprivate func handleTappedCenterButton() {
        self.selectedIndex = 2
    }
}
