//
//  CustomLabel.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

enum Font {
    case medium
    case bold
    case regular
}

class CustomTextField: UILabel {
    
    private let textSize: Float
    private let color: UIColor
    private let fonts: Font
    
    init(textSize: Float,
         color: UIColor,
         fonts: Font) {
        self.fonts = fonts
        self.color = color
        self.textSize = textSize
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        switch fonts.self {
        case .regular:
            font = Fonts.regular(size: textSize)
        case .bold:
            font = Fonts.bold(size: textSize)
        case .medium:
            font = Fonts.medium(size: textSize)
        }
    }
}
