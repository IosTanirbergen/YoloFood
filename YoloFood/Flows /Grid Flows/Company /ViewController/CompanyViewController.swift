//
//  ShopViewController.swift
//  YoloFood
//
//  Created by beshssg on 24.04.2022.
//

import UIKit
import SwiftUI

final class CompanyViewController: BaseViewController {
    
    var viewModel: CompanyViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension CompanyViewController {
    
    private func setup() {
        guard let viewModel = viewModel else {
            return
        }
        
        let mainView = CompanyView(
            viewModel: viewModel
        )
        
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
