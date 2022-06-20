//
//  SearchViewController.swift
//  YoloFood
//
//  Created by Tanirbergen Kaldybay on 21.02.2022.
//

import UIKit

struct FilteredSearchData {
    var title: String?
    var image: String?
}

final class SearchViewController: BaseViewController, UISearchBarDelegate {
    
    // MARK: UI Elements:
    
    fileprivate lazy var search: UISearchController = {
        $0.searchBar.delegate = self
        return $0
    }(UISearchController())
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchViewControllerCell")
        return tableView
    }()
    
    let data: [FilteredSearchData] = [FilteredSearchData(title: "Health Food", image: "123"), FilteredSearchData(title: "Feetnes food", image: "feetnes")]
    
    var filteredData: [FilteredSearchData]!
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        configureUI()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? data : data.filter {
            $0.title?.range(of: searchText, options: .caseInsensitive) != nil
        }
        
        tableView.reloadData()
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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        makeConstraints()
    }
    
    func makeConstraints() {
        
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SearchViewControllerCell", for: indexPath)
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        let marginguide = cell.contentView.layoutMarginsGuide
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.topAnchor.constraint(equalTo: marginguide.topAnchor).isActive = true
        cell.imageView?.leadingAnchor.constraint(equalTo: marginguide.leadingAnchor).isActive = true
        cell.imageView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cell.imageView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cell.imageView?.image = UIImage(named: filteredData[indexPath.row].image ?? "123")
        cell.textLabel?.text = filteredData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailSearchViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
