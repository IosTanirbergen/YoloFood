//
//  Services.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 12.03.2022.
//

import UIKit

class ServicesView: UIView {
    
    // MARK: - Properties
    private let servicesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    private let factory = HomeFactory()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
        configureCollectionView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ServicesView: ConfigureView {
    
    func setView() {
        [servicesCollectionView].forEach {
            addSubview($0)
        }
        
        servicesCollectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4.0)
            $0.leading.trailing.equalToSuperview().inset(8.0)
        }
        
        configureView()
    }
    
    func configureView() {
        backgroundColor = .clear
        servicesCollectionView.backgroundColor = .clear
    }
    
    private func configureCollectionView() {
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        servicesCollectionView.isScrollEnabled = false 
        [ServicesCollectionViewCell.self].forEach {
            servicesCollectionView.register($0.self, forCellWithReuseIdentifier: $0.description())
        }
    }
}

// MARK: - Collection Delegate & DataSources
extension ServicesView: CollectionViewDelegateProtocol {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        configureCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return factory.makeGridMenuItems().count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }
}

// MARK: - Configure CollectionView
extension ServicesView {
    
    private func sizeForItem() -> CGSize {
        let width = (UIScreen.main.bounds.size.width) / 3 - 8.0
        let size: CGSize = CGSize(width: width, height: width + 12.0)
        return size
    }
    
    private func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.description(), for: indexPath) as! ServicesCollectionViewCell
        cell.configure(data: factory.makeGridMenuItems()[indexPath.row])
        return cell
    }
}
