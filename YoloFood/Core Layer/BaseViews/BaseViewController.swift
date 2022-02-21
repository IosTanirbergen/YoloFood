//
//  BaseViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 19.02.2022.
//

import Foundation
import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension BaseViewController {
    
    private func configureView() {
        view.backgroundColor = .white
    }
}
