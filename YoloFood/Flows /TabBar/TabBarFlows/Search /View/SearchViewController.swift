//
//  SearchViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import UIKit

final class SearchViewController: BaseViewController {
    
// MARK: UI Elements:
    
    fileprivate lazy var search: UISearchController = {
        return $0
    }(UISearchController())

// MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}

// MARK: - ConfigureUI:

extension SearchViewController {
    
    func configureUI() {
        navigationItem.searchController = search
        
        [search].forEach {
            $0.searchBar.placeholder = "Поиск"
            $0.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        }
        
        makeConstraints()
    }
    
    func makeConstraints() {
       
    }
}
