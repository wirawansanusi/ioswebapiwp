//
//  CategoryVC_FetchCategories.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController {
    
    func fetchCategories() {
        
        let urlRequest = NSURLRequest(URL: GLOBAL_VALUES.FETCH.CATEGORIES.URL())
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.timeoutIntervalForRequest = 10.0
        let session = NSURLSession(configuration: sessionConfig)
        session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                
                var json: AnyObject?
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                } catch _ {
                    json = nil
                }
                
                var categories = [Categories]()
                var currentCategories = [Categories]()
                if let metadata = json as? [String: AnyObject] {
                    if let categoriesData = metadata["categories"] as? [[String: AnyObject]] {
                        for categoryData in categoriesData {
                            let id = categoryData["id"] as! Int
                            let title = categoryData["title"] as! String
                            let slug = categoryData["slug"] as! String
                            let parentId = categoryData["parent"] as! Int
                            
                            let category = Categories(id: id, title: title, slug: slug, parentId: parentId)
                            categories.append(category)
                            if category.parentId == 0 {
                                currentCategories.append(category)
                            }
                        }
                        self.categories = categories
                        self.filteredCategories = categories
                        self.currentCategories = currentCategories
                        self.tableViewShouldAnimate = true
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.reloadView.hideReloadView()
                            self.initSearchController()
                        })
                        self.refreshTableView()
                    }
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.reloadView.showReloadView((error?.userInfo[NSLocalizedDescriptionKey])! as! String)
                })
            }
        }.resume()
    }
    
    func fetchSubCategories() {
        
        var subCategories = [Categories]()
        for category in self.categories! {
            if self.parentId == category.parentId {
                subCategories.append(category)
            }
        }
        self.initSearchController()
        self.filteredCategories = self.categories!
        self.currentCategories = subCategories
        self.tableView.reloadData()
    }
}
