//
//  HomeViewControllerFacade.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import Foundation
import UIKit

struct GridItems {
    var image: String
    var title: String
}

struct NewsStaticData {
    var image: String
    var title: String
}

final class HomeFactory {
    
    // MARK: - Properties
    private let gridItems: [GridItems] = [
        GridItems(image: ImagesConstants.GridImages.myOrder, title: "Купить"),
        GridItems(image: ImagesConstants.GridImages.myTest, title: "Проверить"),
        GridItems(image: ImagesConstants.GridImages.myFitness, title: "Фитнес"),
        GridItems(image: ImagesConstants.GridImages.mySchedule, title: "Мой записи"),
        GridItems(image: ImagesConstants.GridImages.myHistoryOrders, title: "Мой текущий\n заказы"),
        GridItems(image: ImagesConstants.GridImages.myHistory, title: "История")
    ]
    
    private let newsItems: [NewsStaticData] = [
        NewsStaticData(image: ImagesConstants.NewsImages.food_1, title: food_1),
        NewsStaticData(image: ImagesConstants.NewsImages.food_2, title: food_1),
        NewsStaticData(image: ImagesConstants.NewsImages.food_3, title: food_1)
    ]
    
    func makeGridMenuItems() -> [GridItems] {
        return gridItems
    }
    
    func makeNewsItems() -> [NewsStaticData] {
        return newsItems
    }

}
