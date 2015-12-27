//
//  CategoryVC_SearchBar.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController: UISearchBarDelegate {
    
    func initSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        currentCategories = categoryList!.filterCategories(searchText)
        reloadTableView(currentCategories)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        currentCategories = categoryList!.getMainCategories()
        reloadTableView(currentCategories)
    }
    
    func dismissSearchBar() {
        searchBar.resignFirstResponder()
    }
}
