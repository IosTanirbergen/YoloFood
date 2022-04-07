//
//  ImageConstants .swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

struct ImagesConstants {
    /// Navigation
    struct NavigationImages {
        static let close = UIImage(named: "close")?.withRenderingMode(.alwaysOriginal)
    }
    
    /// Onboarding
    struct OnboardingImages {
        static let first = "onboardingFirst"
        static let second = "onboardingSecond"
        static let third = "onboardingThird"
    }
    
    /// Grid
    struct GridImages {
        static let myOrder = "my-order"
        static let myTest = "my-test"
        static let myFitness = "my-fitness"
        static let myHistoryOrders = "my-history-orders"
        static let mySchedule = "my-schedule"
        static let myHistory = "my-history"
    }
    
    /// News Static Mock Data
    struct NewsImages {
        static let food_1 = "food-1"
        static let food_2 = "food-2"
        static let food_3 = "food-3"
    }
    
    /// TabBar
    struct TabBarImages {
        /// unselected
        static let home = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        static let search = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        static let order = UIImage(named: "order")?.withRenderingMode(.alwaysOriginal)
        static let heart = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        static let profile = UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal)
        
        /// selected
        static let selectedHome = UIImage(named: "homeSelected")?.withRenderingMode(.alwaysOriginal)
        static let selectedsearch = UIImage(named: "searchSelected")?.withRenderingMode(.alwaysOriginal)
        static let selectedHeart = UIImage(named: "heartSelected")?.withRenderingMode(.alwaysOriginal)
        static let selectedProfile = UIImage(named: "profileSelected")?.withRenderingMode(.alwaysOriginal)
    }
    
    /// Question
    struct QuestionImages {
        
        /// Person
        struct Persons {
            static let q_left = UIImage(named: "q-left")?.withRenderingMode(.alwaysOriginal)
            static let q_center = UIImage(named: "q-center")?.withRenderingMode(.alwaysOriginal)
            static let q_right = UIImage(named: "q-right")?.withRenderingMode(.alwaysOriginal)
        }
    }
}
