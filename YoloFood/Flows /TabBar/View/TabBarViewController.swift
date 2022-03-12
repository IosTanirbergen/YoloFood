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
    
    lazy var yoloTitle: UILabel = {
        $0.text = "YoloFood"
        $0.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
        $0.textColor = .green
        return $0
    }(UILabel())
    
    // MARK: - coordinator delegate
    var coordinatorDelegate: TabBarCoordinator?
    
    override func viewDidLoad() {
        setUI()
        setupMiddleButton()
        configureTabBar()
        
        view.addSubview(yoloTitle)
        yoloTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
            UIView.animate(withDuration: 1.5) {
                yoloTitle.alpha = 0
            }
        }
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
    
    private func configureTabBar() {
        navigationController?.navigationBar.isHidden = true
    }
}
