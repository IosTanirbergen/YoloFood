//
//  CustomNavigationBAr.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 13.03.2022.
//

import Foundation
import UIKit

protocol CustomNavBarProtocol {
    func tappedLeftIconNavBar()
    func tappedRightIconNavBar()
}

class CustomNavBar: UIView {
    
    // MARK: - Properties
    private let leftIcon: String?
    private let rightIcon: String?
    private let title: String?
    
    var delegate: CustomNavBarProtocol?
    
    private lazy var leftIconImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: leftIcon ?? "")
        return img
    }()
    
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = title
        lb.textAlignment = .center
        lb.font = Fonts.medium(size: 18.0)
        return lb
    }()
    
    private lazy var rightIconImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: rightIcon ?? "")
        return img
    }()
    
    init(leftIcon: String?, title: String?, rightIcon: String?) {
        self.leftIcon = leftIcon
        self.title = title
        self.rightIcon = rightIcon
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavBar: ConfigureView {
    
    func setView() {
        [leftIconImage, titleLabel, rightIconImage].forEach {
            addSubview($0)
        }
        
        leftIconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.0)
            $0.height.width.equalTo(20.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        rightIconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16.0)
            $0.height.width.equalTo(20.0)
        }
       
        configureView()
    }
    
    func configureView() {
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        leftIconImage.onTapped { [weak self] in
            guard let self = self else { return }
            self.delegate?.tappedLeftIconNavBar()
        }
        
        rightIconImage.onTapped { [weak self] in
            guard let self = self else { return }
            self.delegate?.tappedRightIconNavBar()
        }
    }
    
}
