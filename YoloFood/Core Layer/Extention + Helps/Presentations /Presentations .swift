//
//  Presentations .swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 19.02.2022.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
      return self
    }
}

