//
//  PersonCollectionViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 13.03.2022.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "PersonCollectionViewCell"
    }
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = Fonts.regular(size: 20.0)
        lb.textColor = .black
        return lb
    }()
    
    private let personImage: UIImageView = {
        let img = UIImageView()
        img.layer.masksToBounds = true
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PersonCollectionViewCell: ConfigureView {
    
    func setView() {
        [titleLabel, personImage].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(8.0)
        }
        
        personImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.safeAreaLayoutGuide.snp.bottom).inset(-16.0)
            $0.leading.trailing.equalToSuperview().inset(58.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        configureView()
    }
    
    func configureView() {
        
    }
    
    func configure(data: PersionItems) {
        titleLabel.text = data.title
        personImage.image = data.image
    }
}
