//
//  CategoryVC_SideDrawer+SVProgressHUD.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/29/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MMDrawerController
import SVProgressHUD

extension CategoryViewController {
    
    func closeSideDrawer() {
        dismissSearchBar()
        mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    func didSelectCategory(id: Int) {
        let userInfo = ["id": id]
        closeSideDrawer()
        SVProgressHUD.show()
        NSNotificationCenter.defaultCenter().postNotificationName("NavigateCategoryIdEvent", object: self, userInfo: userInfo)
    }
    
    func didPressSidenavLogo(recognizer: UITapGestureRecognizer) {
        closeSideDrawer()
        SVProgressHUD.show()
        NSNotificationCenter.defaultCenter().postNotificationName("NavigateFeaturedEvent", object: self)
    }
}