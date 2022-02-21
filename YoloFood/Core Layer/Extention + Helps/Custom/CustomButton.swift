//
//  CustomButton.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    private let btnType: ButtonType
    private let font: Font
    private let btnText: String
    private let textColor: UIColor
    private let btnColor: UIColor
    private let fontSize: Float
    
    
    init(btnType: ButtonType,
         font: Font,
         btnText: String,
         textColor: UIColor,
         btnColor: UIColor,
         fontSize: Float) {
        self.btnType = btnType
        self.font = font
        self.btnText = btnText
        self.textColor = textColor
        self.btnColor = btnColor
        self.fontSize = fontSize
        super.init(frame: .zero)
        configureButton()
    }
    
    private func configureButton() {
        switch font.self {
        case .regular:
            setTitle(btnText, font: Fonts.regular(size: fontSize), color: textColor)
            backgroundColor = btnColor
        case .medium:
            setTitle(btnText, font: Fonts.medium(size: fontSize), color: textColor)
            backgroundColor = btnColor
        case .bold:
            setTitle(btnText, font: Fonts.bold(size: fontSize), color: textColor)
            backgroundColor = btnColor
        }
        
        layer.cornerRadius = 16.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
