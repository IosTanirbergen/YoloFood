//
//  OnboardingTableViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

struct OnboardingItems {
    var image: String
    var title: String
    var subTitle: String
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    /// CellID
    override class func description() -> String {
        return "OnboardingCollectionViewCell"
    }
    
    // MARK: - Properties
    private var onboardingImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private var onboardingTitle: CustomTextField = {
        let lb = CustomTextField(textSize: 20.0, color: .black, fonts: .medium)
        lb.textAlignment = .center
        return lb
    }()
    
    private var onboardingSubTitle: CustomTextField = {
        let lb = CustomTextField(textSize: 16.0, color: .black, fonts: .regular)
        lb.numberOfLines = 0 
        return lb
    }()
    
    private lazy var stackTitleLabel: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            onboardingTitle,
            onboardingSubTitle
        ])
        sv.axis = .vertical
        sv.spacing = 16.0
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingCollectionViewCell {
    
    private func setUI() {
        [onboardingImage, stackTitleLabel].forEach {
            contentView.addSubview($0)
        }
        configureUI()
    }
    
    private func configureUI() {
        onboardingImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3.2)
            $0.leading.trailing.equalToSuperview().inset(64.0)
        }
        
        stackTitleLabel.snp.makeConstraints {
            $0.top.equalTo(onboardingImage.safeAreaLayoutGuide.snp.bottom).offset(32.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configure(data: OnboardingItems) {
        onboardingImage.image = UIImage(named: data.image)
        onboardingTitle.text = data.title
        onboardingSubTitle.text = data.subTitle
    }
}
