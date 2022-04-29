//
//  ShopViewModel.swift
//  YoloFood
//
//  Created by Didar Bakhitzhanov on 29.04.2022.
//

import Foundation
import UIKit

struct CompanyList {
    var id: Int
    var title: String
    var image: String
}

protocol CompanyViewModelOutput {
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func heightForRowAt() -> CGFloat
    func numberOfRowsInSection() -> Int
    func numberOfSection() -> Int
}

private protocol CompanyViewModelInput {
    var shopLists: [CompanyList] { get set }
}

typealias CompanyViewModelProtocol = CompanyViewModelOutput

final class CompanyViewModel: CompanyViewModelProtocol, CompanyViewModelInput {
    
    // MARK: - Internal Vals
    fileprivate var shopLists: [CompanyList] = [
        CompanyList(id: 0, title: "HealthFood", image: "healthFood")
    ]
//    fileprivate var shopLists: [ShopList] = [
//        ShopList(id: 0, title: "HealthFood", image: "healthFood"),
//        ShopList(id: 1, title: "Около 700 калорий\n Донер", image: "4"),
//        ShopList(id: 2, title: "салат с малосольной\n семгой", image: "2"),
//        ShopList(id: 3, title: "ПП-салата", image: "3")
//    ]
}

extension CompanyViewModel {
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.description(), for: indexPath) as! CompanyTableViewCell
        cell.configure(data: shopLists[indexPath.row])
        return cell
    }
    
    func heightForRowAt() -> CGFloat {
        return UIScreen.main.bounds.height / 4
    }
    
    func numberOfRowsInSection() -> Int {
        return shopLists.count
    }
    
    func numberOfSection() -> Int {
        return 1
    }
}
