//
//  FeaturedVC_Notification+SVProgressHUD.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/29/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import SVProgressHUD

extension FeaturedViewController {
    
    func initNotificationCenter() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("didReceivedNotificationFromSideDrawer:"), name: "NavigateCategoryIdEvent", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("didReceivedNotificationFromSideDrawer:"), name: "NavigateFeaturedEvent", object: nil)
    }
    
    func didReceivedNotificationFromSideDrawer(notification: NSNotification) {
        
        if notification.name == "NavigateCategoryIdEvent" {
            let userInfo = notification.userInfo!
            categoryId = userInfo["id"] as? Int
            initJSONRequest(GLOBAL_VALUES.FETCH.PRODUCTS.URL(categoryId!))
        } else if notification.name == "NavigateFeaturedEvent" {
            categoryId = nil
            initJSONRequest(GLOBAL_VALUES.FETCH.FEATURED.URL())
        }
    }
    
    func willSendNotificationFromCenter() {
        let id = selectedProduct!.id
        let userInfo = ["id": id]
        showProgressHUD()
        NSNotificationCenter.defaultCenter().postNotificationName("NavigateCategoryIdEvent", object: self, userInfo: userInfo)
    }
    
    func showProgressHUD() {
        SVProgressHUD.show()
    }
    
    func dismissProgressHUD() {
        SVProgressHUD.dismiss()
    }
}
