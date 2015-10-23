//
//  CategoryVC_SearchBar.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func initSearchController() {
        
        self.searchController = UISearchController(searchResultsController: nil)
        
        self.searchController?.searchResultsUpdater = self
        self.searchController?.hidesNavigationBarDuringPresentation = false
        self.searchController?.dimsBackgroundDuringPresentation = false
        self.searchController?.searchBar.placeholder = "Cari Kategori"
        self.searchController?.searchBar.sizeToFit()
        self.searchController?.searchBar.delegate = self
        self.styleSearchBar()
        
        self.tableView.tableHeaderView = searchController?.searchBar
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let filteredCategories = self.categories!.filter { (category: Categories) -> Bool in
            
            let keyword = searchController.searchBar.text!
            let keywordCount = keyword.characters.count
            let matchedString = category.title.rangeOfString(searchController.searchBar.text!, options: .CaseInsensitiveSearch)
            
            return (matchedString != nil || keywordCount == 0)
        }
        self.filteredCategories = filteredCategories
        
        tableView.reloadData()
    }
    
    func dismissSearchController() {
        
        searchController?.active = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
}
