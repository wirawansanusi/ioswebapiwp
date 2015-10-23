//
//  ProductListVC_SearchBar.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController: UISearchResultsUpdating, UISearchBarDelegate {
 
    func initSearchController() -> UISearchController {
        
        self.searchController = UISearchController(searchResultsController: nil)
        
        self.searchController?.searchResultsUpdater = self
        self.searchController?.hidesNavigationBarDuringPresentation = false
        self.searchController?.dimsBackgroundDuringPresentation = false
        self.searchController?.searchBar.placeholder = "Cari Produk"
        self.searchController?.searchBar.sizeToFit()
        self.searchController?.searchBar.delegate = self
        self.styleSearchBar()
        
        return self.searchController!
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let filteredProducts = self.products.filter { (product: Products) -> Bool in
            
            let keyword = searchController.searchBar.text!
            let keywordCount = keyword.characters.count
            let matchedString = product.title.rangeOfString(searchController.searchBar.text!, options: .CaseInsensitiveSearch)
            
            return (matchedString != nil || keywordCount == 0)
        }
        self.filteredProducts = filteredProducts
        
        self.collectionView.reloadData()
    }
    
    func dismissSearchController() {
        
        self.searchController?.active = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
    
        searchBar.resignFirstResponder()
    }
}
