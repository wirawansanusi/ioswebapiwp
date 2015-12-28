//
//  FeaturedVC_ReloadView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/28/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FeaturedViewController: ReloadViewDelegate {
    
    func initReloadView() {
        
        self.reloadView.delegate = self
    }
    
    func reloadViewdidPressURLSessionButton(controller: ReloadView) {
        
        self.setupCenter()
    }
    
    func reloadViewShouldPresentView(controller: ReloadView) {
        
        self.collectionView.alpha = 0
    }
    
    func reloadViewShouldHideView(controller: ReloadView) {
        
        self.collectionView.alpha = 1.0
    }
}
