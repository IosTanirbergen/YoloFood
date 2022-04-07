//
//  ListNewsTableViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 12.03.2022.
//

import UIKit

class ListNewsTableViewCell: UITableViewCell {
    
    override class func description() -> String {
        return "ListNewsTableViewCell"
    }
    
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
    
    // MARK: - Properties
    private let newsImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private let newsDetailLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .natural
        lb.numberOfLines = 0
        lb.font = Fonts.regular(size: 14.0)
        return lb
    }()
    
    private let likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(ImagesConstants.TabBarImages.heart?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleLike), for: .touchUpInside)
        return btn
    }()
    
    var isTappedCount = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setView()
    }

}

// MARK: - Configure View
extension ListNewsTableViewCell: ConfigureView {
    
    func setView() {
        [newsImage, newsDetailLabel, likeButton].forEach {
            contentView.addSubview($0)
        }
        
        newsImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(frame.size.width / 1.5)
        }
        
        newsDetailLabel.snp.makeConstraints {
            $0.top.equalTo(newsImage.safeAreaLayoutGuide.snp.bottom).offset(8.0)
            $0.leading.trailing.equalToSuperview().inset(8.0)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(newsDetailLabel.safeAreaLayoutGuide.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview().inset(16.0)
            $0.height.width.equalTo(24.0)
        }
        
        configureView()
    }
    
    func configureView() {
        selectionStyle = .none
    }
    
    private func configureLayerView() {
        newsImage.roundCorners(corners: [.topLeft, .topRight], radius: 16.0)
        layer.cornerRadius = 16
        //newsImage.contentMode = .scaleAspectFill
        layer.masksToBounds = true
    }
    
    func configure(data: NewsStaticData) {
        newsImage.image = UIImage(named: data.image)
        newsDetailLabel.text = data.title
    }
    
    @objc fileprivate func handleLike() {
        if isTappedCount % 2 == 0 {
            buttonIsSelected()
        } else  {
            buttonIsSelected()
        }
        
        isTappedCount += 1
    }
    
    private func buttonIsSelected() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            likeButton.setImage(ImagesConstants.TabBarImages.selectedHeart, for: .normal)
            likeButton.layoutIfNeeded()
        }
    }
    
    private func buttonUnSelected() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            likeButton.setImage(ImagesConstants.TabBarImages.heart, for: .normal)
            likeButton.layoutIfNeeded()
        }
    }
}
