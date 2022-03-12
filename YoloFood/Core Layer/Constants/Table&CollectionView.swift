//
//  Table&CollectionView.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 22.02.2022.
//

import Foundation
import UIKit

typealias CollectionViewDelegateProtocol = UICollectionViewDelegateFlowLayout & UICollectionViewDataSource
typealias TableViewDelegateProtocol = UITableViewDataSource & UITableViewDelegate

protocol ConfigureTableViewCell {
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func configureCell(tableView: UITableView, indexPath: IndexPath) -> CGFloat
}
