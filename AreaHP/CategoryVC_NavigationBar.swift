//
//  CategoryVC_NavigationBar.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController {
    
    func initNavigationBar() {
        
        let container = CGRect(origin: CGPointZero, size: CGSize(width: 200.0, height: 33.0))
        let imageLogo = UIImage(named: "Logo")
        let titleView = UIImageView(image: imageLogo)
        
        titleView.contentMode = .Center
        titleView.frame = container
        
        navigationItem.titleView = titleView
    }
}
