//
//  StoriesDetailCollectionViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 25.02.2022.
//

import Foundation
import UIKit

class StoriesDetailCollectionViewCell: UICollectionViewCell {
    
    private let backgroundImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    
    private let informationLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.font = Fonts.medium(size: 19.0)
        lb.backgroundColor = .black.withAlphaComponent(0.5)
        lb.textColor = .white
        lb.textAlignment = .center
        return lb
    }()
    
    override class func description() -> String {
        return "StoriesDetailCollectionViewCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI
extension StoriesDetailCollectionViewCell: ConfigureView {
    
    func setView() {
        [backgroundImage].forEach {
            contentView.addSubview($0)
        }
        
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backgroundImage.addSubview(informationLabel)
        informationLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24.0)
        }
        
        configureView()
    }
    
    func configureView() {
        
    }
    
    func configure(data: StoriesDetailItems) {
        backgroundImage.image = UIImage(named: data.image)
        informationLabel.text = data.title
        
    }
}
