//
//  ServicesCollectionViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 12.03.2022.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "ServicesCollectionViewCell"
    }
    
    // MARK: - Properties
    private let gridImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private let gridTitle: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = Fonts.medium(size: 15.0)
        return lb
    }()
    
    lazy var stackGridItems: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            gridImage,
            gridTitle
        ])
        
        sv.axis = .vertical
        sv.spacing = 8.0
        
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: GridItems) {
        gridImage.image = UIImage(named: data.image)
        gridTitle.text = data.title
    }
}

extension ServicesCollectionViewCell: ConfigureView {
    
    func setView() {
        [stackGridItems].forEach {
            contentView.addSubview($0)
        }
        
        stackGridItems.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func configureView() {
        backgroundColor = .white
        gridImage.snp.makeConstraints {
            $0.height.width.equalTo(UIScreen.main.bounds.size.width / 7)
        }
    }
}
