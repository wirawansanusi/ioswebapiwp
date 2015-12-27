//
//  CategoryVC_ReloadView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/24/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController: ReloadViewDelegate {
    
    func initReloadView() {
        
        self.reloadView.delegate = self
    }
    
    func reloadViewdidPressURLSessionButton(controller: ReloadView) {
        
        self.fetchCategories()
    }
    
    func reloadViewShouldPresentView(controller: ReloadView) {
        
        self.searchContainer.alpha = 0
        self.tableView.alpha = 0
    }
    
    func reloadViewShouldHideView(controller: ReloadView) {
        
        self.searchContainer.alpha = 1.0
        self.tableView.alpha = 1.0
    }
}
