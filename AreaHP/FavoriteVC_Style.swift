//
//  FavoriteVC_Style.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FavoriteViewController {
    
    func styleSearchBar() {
        
        self.searchController?.searchBar.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.searchController?.searchBar.barTintColor = UIColor.groupTableViewBackgroundColor()
        self.searchController?.searchBar.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        self.searchController?.searchBar.layer.borderWidth = 1.0
    }
    
    func animateCollectionView() {
        
        let defaultTopInset = self.collectionView.contentInset.top
        self.collectionView.contentInset.top = 100.0
        self.collectionView.alpha = 0.0
        UIView.animateWithDuration(0.7) { () -> Void in
            self.collectionView.contentInset.top = defaultTopInset
            self.collectionView.alpha = 1.0
            
        }
    }
}