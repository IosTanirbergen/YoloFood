//
//  StoriesViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 25.02.2022.
//

import UIKit

final class StoriesDetailViewController: BaseViewController {
    
    // MARK: - Properties
    private var collectionView: UICollectionView = {
        let cv = UICollectionView()
        return cv
    }()
    
    private var closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(ImagesConstants.NavigationImages.close, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureCollectionView()
    }
}

extension StoriesDetailViewController {
    
    private func setView() {
        [closeButton, collectionView].forEach { view.addSubview($0) }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(closeButton.safeAreaLayoutGuide.snp.bottom).offset(16.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        configureView()
    }
    
    private func configureView() {}
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoriesDetailCollectionViewCell.self, forCellWithReuseIdentifier: StoriesDetailCollectionViewCell.description())
    }
}

extension StoriesDetailViewController: CollectionViewDelegateProtocol {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesDetailCollectionViewCell.description(), for: indexPath) as! StoriesDetailCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}
