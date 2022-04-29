//
//  ShopTableViewCell.swift
//  YoloFood
//
//  Created by Didar Bakhitzhanov on 29.04.2022.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    private var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private var title: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.layer.cornerRadius = 4.0
        lb.font = Fonts.medium(size: 24.0)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.backgroundColor = .black.withAlphaComponent(0.5)
        return lb
    }()
    
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    
    override class func description() -> String {
        return "ShopTableViewCell"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = 8.0
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8.0
    }

}

extension CompanyTableViewCell {
    
    private func setup() {
        contentView.addSubview(image)
        
        image.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(6.0)
        }
        
        image.addSubview(title)
        
        title.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func configure(data: CompanyList) {
        image.image = UIImage(named: data.image)
        title.text = data.title
    }
}
