//
//  CategoryVC_SideDrawer.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/27/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MMDrawerController

extension CategoryViewController {
    
    func closeSideDrawer() {
        dismissSearchBar()
        mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    func didSelectCategory(id: Int) {
        let userInfo = ["id": id]
        NSNotificationCenter.defaultCenter().postNotificationName("NavigateCategoryIdEvent", object: self, userInfo: userInfo)
    }
    
    func didPressSidenavLogo(recognizer: UITapGestureRecognizer) {
        NSNotificationCenter.defaultCenter().postNotificationName("NavigateFeaturedEvent", object: self)
        closeSideDrawer()
    }
}
