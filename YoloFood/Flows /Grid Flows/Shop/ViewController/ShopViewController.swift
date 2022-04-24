//
//  ShopViewController.swift
//  YoloFood
//
//  Created by beshssg on 24.04.2022.
//

import UIKit
import SwiftUI

final class ShopViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ShopViewController {
    
    private func setup() {
        
        let hostView = ShopView()
        
        let controller = UIHostingController(rootView: hostView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
