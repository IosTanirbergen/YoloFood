//
//  OnboardingFacade .swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import Foundation
import UIKit

final class OnboardingFacade: NSObject {
    
    // MARK: - Properties
    
    private let onboardingData: [OnboardingItems] = [
        OnboardingItems(image: ImagesConstants.OnboardingImages.first,
                        title: Strings.Onboarding.firstTitle,
                        subTitle: Strings.Onboarding.firstSubTitle),
        OnboardingItems(image: ImagesConstants.OnboardingImages.second,
                        title: Strings.Onboarding.secondTitle,
                        subTitle: Strings.Onboarding.secondSubTitle),
        OnboardingItems(image: ImagesConstants.OnboardingImages.third,
                        title: Strings.Onboarding.thirdTitle,
                        subTitle: Strings.Onboarding.thirdSubTitle)
    ]
    
    func setOnboardingItems() -> [OnboardingItems] {
        return onboardingData
    }
    
    func showButtonIfNeeded(page: Int, btn: UIButton) {
        if page == 1 {
            UIView.animate(withDuration: 0.3) {
                btn.alpha = 1
                btn.layoutIfNeeded()
            }
        }
    }
}
