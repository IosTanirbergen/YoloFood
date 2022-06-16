//
//  DetailProfileTableViewCell.swift
//  YoloFood
//
//  Created by Zhanibek Santay on 16.06.2022.
//

import UIKit

class DetailProfileTableViewCell: UITableViewCell {
    
     var titleLabel: CustomLabel = {
        let title = CustomLabel(textSize: 20.0, color: .black, fonts: .regular)
        return title
    }()
    
    var rightImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "book")
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .yoloBackgroundColor
        addSubview(titleLabel)
        addSubview(rightImage)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().offset(29)
        }
        
        addSubview(rightImage)
        rightImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        // Configure the view for the selected state
    }
    
}
