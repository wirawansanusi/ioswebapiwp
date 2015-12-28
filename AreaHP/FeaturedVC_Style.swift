//
//  FeaturedVC_Style.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/28/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FeaturedViewController {
    
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
