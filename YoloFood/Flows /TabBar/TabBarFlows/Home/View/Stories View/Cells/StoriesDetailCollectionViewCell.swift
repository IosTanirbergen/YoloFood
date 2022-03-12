//
//  StoriesDetailCollectionViewCell.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 25.02.2022.
//

import Foundation
import UIKit

class StoriesDetailCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "StoriesDetailCollectionViewCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
