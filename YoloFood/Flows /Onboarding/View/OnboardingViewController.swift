//
//  ViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 16.02.2022.
//

import UIKit

final class OnboardingViewController: BaseViewController {
    
    // MARK: - Properties
    private var onboardingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    // MARK: - Coordinator Delegate
    var delegate: OnboardingCoordinator?
    
    private let pageControl: CustomPageController = {
        let pc = CustomPageController()
        pc.currentPage = 0
        pc.otherDotColor = .lightGray
        pc.currentDotWidth = 20
        pc.otherDotWidth = 10
        pc.dotHeight = 10
        pc.cornerRadius = 5
        pc.dotSpace = 24
        pc.currentDotColor = .green
        pc.numberOfPages = 3
        return pc
    }()
    
    private let button: CustomButton = {
        let btn = CustomButton(btnType: .system,
                               font: .bold,
                               btnText: Strings.Onboarding.btnTitle,
                               textColor: .white,
                               btnColor: .green,
                               fontSize: 18.0)
        btn.addTarget(self, action: #selector(handleShowMainFlow), for: .touchUpInside)
        btn.alpha = 0
        return btn
    }()
    
    private let facade = OnboardingFacade()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension OnboardingViewController {
    
    private func setUI() {
        [onboardingCollectionView, pageControl, button].forEach {
            view.addSubview($0)
        }
        
        onboardingCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(32.0)
            $0.height.equalTo(view.frame.size.height / 1.6)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(onboardingCollectionView.safeAreaLayoutGuide.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20.0)
            $0.width.equalTo(view.frame.size.width)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(pageControl.safeAreaLayoutGuide.snp.bottom).offset(32.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(48.0)
        }
        
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        [OnboardingCollectionViewCell.self].forEach {
            onboardingCollectionView.register($0.self, forCellWithReuseIdentifier: $0.description())
        }
    }
    
}

typealias OnboardingCollectionViewDelegate = UICollectionViewDelegateFlowLayout & UICollectionViewDataSource

// MARK: - CollectionView Delegate & DataSources
extension OnboardingViewController: OnboardingCollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.description(), for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(data: facade.setOnboardingItems()[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facade.setOnboardingItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.x / view.frame.width
        pageControl.currentPage = Int(scroll)
        facade.showButtonIfNeeded(page: pageControl.currentPage, btn: button)
    }
    
}

// MARK: - Flow Methods
extension OnboardingViewController {
    
    @objc private func handleShowMainFlow() {
        print(#function)
        delegate?.showTabBarFlow()
    }
}
