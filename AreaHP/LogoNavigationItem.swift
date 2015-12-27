//
//  LogoNavigationItem.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/14/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class LogoNavigationItem: UINavigationItem {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setTitleLogo()
    }
    
    func setTitleLogo() {
        let container = CGRect(origin: CGPointZero, size: CGSize(width: 200.0, height: 33.0))
        let imageLogo = UIImage(named: "Logo")
        let titleView = UIImageView(image: imageLogo)
        
        titleView.contentMode = .Center
        titleView.frame = container
        
        self.titleView = titleView
    }
}
