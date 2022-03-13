//
//  QuestionListViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import UIKit

final class QuestionListViewController: BaseViewController {
    
    // MARK: - Properties
    private let customNavigation = CustomNavBar(leftIcon: nil,
                                                title: "Идеальный график",
                                                rightIcon: "close")
    
    private let personCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    private let accessButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Подтвердить", font: Fonts.medium(size: 18.0), color: .white)
        btn.backgroundColor = .lightGray
        btn.isEnabled = false
        btn.layer.cornerRadius = 8.0
        return btn
    }()
    
    // MARK: - Factory
    private let factory = QuestionListFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureCollectionView()
    }
    
}

extension QuestionListViewController: ConfigureView {
    
    func setView() {
        
        [customNavigation, accessButton, personCollectionView].forEach {
            view.addSubview($0)
        }
        
        customNavigation.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        accessButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(48.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(52.0)
        }
        
        personCollectionView.snp.makeConstraints {
            $0.top.equalTo(customNavigation.safeAreaLayoutGuide.snp.bottom).offset(32.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(accessButton.safeAreaLayoutGuide.snp.top).inset(-32.0)
        }
        
        configureView()
    }
    
    func configureView() {
        customNavigation.delegate = self
    }
    
    private func configureCollectionView() {
        personCollectionView.delegate = self
        personCollectionView.dataSource = self
        personCollectionView.isPagingEnabled = true 
        personCollectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: PersonCollectionViewCell.description())
    }
}

// MARK: - NavigationBarDelegate
extension QuestionListViewController: CustomNavBarProtocol {
    
    func tappedLeftIconNavBar() {
        
    }
    
    func tappedRightIconNavBar() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - CollectionViewDelegate & DataSource
extension QuestionListViewController: CollectionViewDelegateProtocol {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.description(), for: indexPath) as! PersonCollectionViewCell
        cell.configure(data: factory.makePersonItems()[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height - 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return factory.makePersonItems().count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        changeStyleButtonIfNeeded(text: factory.makePersonItems()[indexPath.row].title)
    }
    
    private func changeStyleButtonIfNeeded(text: String) {
        UIView.animate(withDuration: 0.4) { [unowned self] in
            accessButton.setTitle(text, font: Fonts.medium(size: 18.0), color: .white)
            accessButton.backgroundColor = .green
            accessButton.isEnabled = true 
        }
    }
    
}
