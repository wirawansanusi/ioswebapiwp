//
//  FeaturedVC_NotificationCenter.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/28/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

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
}
