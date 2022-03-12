//
//  QuestionListViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import UIKit

final class QuestionListViewController: BaseViewController {
    
    // MARK: - Properties
    private let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(ImagesConstants.NavigationImages.close, for: .normal)
        btn.addTarget(self, action: #selector(handleCloseQuestionList), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension QuestionListViewController {
    
    private func setUI() {
        [closeButton].forEach {
            view.addSubview($0)
        }
        
        configureUI()
    }
    
    private func configureUI() {
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.height.width.equalTo(24)
        }
    }
}

extension QuestionListViewController {
    @objc fileprivate func handleCloseQuestionList() {
        self.dismiss(animated: true, completion: nil)
    }
}
