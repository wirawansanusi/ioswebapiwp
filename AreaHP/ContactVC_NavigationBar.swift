//
//  ContactVC_NavigationBar.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/22/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ContactViewController {
    
    func initNavigationBar() {
        
        let container = CGRect(origin: CGPointZero, size: CGSize(width: 200.0, height: 33.0))
        let imageLogo = UIImage(named: "Logo")
        let titleView = UIImageView(image: imageLogo)
        
        titleView.contentMode = .Center
        titleView.frame = container
        
        self.navigationItem.titleView = titleView
    }
}
