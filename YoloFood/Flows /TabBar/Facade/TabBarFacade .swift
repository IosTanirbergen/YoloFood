//
//  TabBarFacade .swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class TabBarFacade {
    
    func configureTabBar() {
        
    }
}

extension TabBarFacade {
    
    private func setCenterButton() {

    }
    
    func setMiddleButton(view: UIView) {
        let middleBtn = UIButton(type: .system)
        middleBtn.frame = CGRect(x: (view.bounds.width / 2)-30, y: -32, width: 60, height: 60)
        middleBtn.setImage(UIImage(named: "parking")?.withRenderingMode(.alwaysOriginal), for: .normal)
        middleBtn.imageEdgeInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        
        middleBtn.backgroundColor = .blue
        middleBtn.layer.cornerRadius = 30
    }
}
