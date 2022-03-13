//
//  StoriesFactory.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 13.03.2022.
//

import Foundation
import UIKit

struct StoriesDetailItems {
    var image: String
    var title: String
}

class StoriesFactory {
    
    private let storiesDetailItems: [StoriesDetailItems] = [
        StoriesDetailItems(image: ImagesConstants.NewsImages.food_1,
                           title: Strings.Stories.firstTitle),
        StoriesDetailItems(image: ImagesConstants.NewsImages.food_2,
                           title: Strings.Stories.secondTitle),
        StoriesDetailItems(image: ImagesConstants.NewsImages.food_3,
                           title: Strings.Stories.thirdTitle)
    ]
    
    func makeStoriesDetailItems() -> [StoriesDetailItems] {
        return storiesDetailItems
    }
    
}
