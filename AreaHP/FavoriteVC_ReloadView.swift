//
//  FavoriteVC_ReloadView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FavoriteViewController {
    
    func showReloadView() {
        
        self.reloadView.alpha = 1.0
        self.collectionView.alpha = 0
    }
    
    func hideReloadView() {
        
        self.reloadView.alpha = 0
        self.animateCollectionView()
    }
}
