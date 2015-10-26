//
//  ProductListVC_ReloadView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/24/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController: ReloadViewDelegate {
    
    func initReloadView() {
        
        self.reloadView.delegate = self
    }
    
    func reloadViewdidPressURLSessionButton(controller: ReloadView) {
        
        self.fetchProducts()
    }
    
    func reloadViewShouldPresentView(controller: ReloadView) {
        
        self.collectionView.alpha = 0
    }
    
    func reloadViewShouldHideView(controller: ReloadView) {
        
        self.collectionView.alpha = 1.0
    }
}
