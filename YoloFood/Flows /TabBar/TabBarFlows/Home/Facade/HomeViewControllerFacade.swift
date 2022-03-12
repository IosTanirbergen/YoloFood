//
//  HomeViewControllerFacade.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 25.02.2022.
//

import Foundation
import UIKit

final class HomeViewControllerFacade {
    
    private let storiesView = StoriesView()
    
    func showStoriesIfNeeded(item: @escaping ((Int) -> ())) {
        storiesView.tappedStories = { indexPath in
            item(indexPath)
        }
    }
    
    func hideHeaderIfNeeded() {

    }
    
    
}
