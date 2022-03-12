//
//  StoriesView.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import Foundation
import UIKit

final class StoriesView: UIView {
    
    private let storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 0)
        return cv
    }()
    
    private let storiesItems: [StoriesItems] = [
        StoriesItems(image: "stories", title: "Как\nбыстро\nпохудеть?"),
        StoriesItems(image: "stories", title: "Новые\nрасписания"),
        StoriesItems(image: "stories", title: "Подпишитесь\nна\nправильное\nпитание")
    ]
    
    var tappedStories: ((Int) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        configureStoriesCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoriesView {
    
    private func setUI() {
        [storiesCollectionView].forEach {
            addSubview($0)
        }
        
        backgroundColor = .white
    }
    
    private func configureStoriesCollectionView() {
        storiesCollectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        storiesCollectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.description())
        storiesCollectionView.showsHorizontalScrollIndicator = false
    }
}

extension StoriesView: CollectionViewDelegateProtocol {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.description(), for: indexPath) as! StoriesCollectionViewCell
        cell.layer.cornerRadius = 12.0
        cell.configure(data: storiesItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.size.height / 7.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tappedStories?(indexPath.row)
    }
}
