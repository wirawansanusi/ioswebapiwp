//
//  FeaturedVC_SideDrawer.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/24/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MMDrawerController

extension FeaturedViewController {
    
    func setupLeftMenuButton() {
        let leftDrawerButton = MMDrawerBarButtonItem(target: self, action: "leftDrawerButtonPress:")
        navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: true)
    }
    
    func leftDrawerButtonPress(leftDrawerButtonPress: AnyObject) {
        mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
}