//
//  StoriesCollectionViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import Foundation
import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let image: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private let imageTitle: CustomLabel = {
        let lb = CustomLabel(textSize: 16.0, color: .white, fonts: .bold)
        lb.numberOfLines = 0
        return lb
    }()
    
    override class func description() -> String {
        return "CollectionViewCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoriesCollectionViewCell {
    
    private func setUI() {
        [image].forEach {
            contentView.addSubview($0)
        }
        
        image.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
        
        image.addSubview(imageTitle)
        imageTitle.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(10.0)
        }
        
        configureView()
    }
    
    func configure(data: StoriesItems) {
        image.image = UIImage(named: data.image)
        imageTitle.text = data.title
    }
    
    private func configureView() {
        image.layer.cornerRadius = 8.0
        image.layer.masksToBounds = true
        
        backgroundColor = .white
    }
}
