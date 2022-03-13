//
//  QuestionListFactory.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 13.03.2022.
//

import Foundation
import UIKit

struct PersionItems {
    var title: String
    var image: UIImage
}

final class QuestionListFactory {
    
    private let personItems: [PersionItems] = [
        PersionItems(title: "Эктоморф", image: ImagesConstants.QuestionImages.Persons.q_left!),
        PersionItems(title: "Мезоморф", image: ImagesConstants.QuestionImages.Persons.q_center!),
        PersionItems(title: "Эндоморф", image: ImagesConstants.QuestionImages.Persons.q_right!)
    ]
    
    func makePersonItems() -> [PersionItems] {
        return personItems
    }
}
