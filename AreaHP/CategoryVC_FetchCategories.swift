//
//  CategoryVC_FetchCategories.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController: JSONRequestDataTaskDelegate {
    
    func initJSONRequest() {
        
        request = JSONRequest()
        request!.dataTaskDelegate = self
    }
    
    func fetchCategories() {
        
        request!.dataTask(GLOBAL_VALUES.FETCH.CATEGORIES.URL())
    }
    
    func JSONRequestDataTaskOnSuccess(request: JSONRequest, JSONObject: AnyObject) {
        var categories = [Categories]()
        if let metadata = JSONObject as? [String: AnyObject] {
            if let categoriesData = metadata["categories"] as? [[String: AnyObject]] {
                for categoryData in categoriesData {
                    let id = categoryData["id"] as! Int
                    let title = categoryData["title"] as! String
                    let slug = categoryData["slug"] as! String
                    let parentId = categoryData["parent"] as! Int
                    let totalProduct = categoryData["post_count"] as! Int
                    
                    let category = Categories(id: id, title: title, slug: slug, parentId: parentId, totalProduct: totalProduct)
                    categories.append(category)
                }
                categoryList = CategoryList(categories: categories)
                currentCategories = categoryList!.currentCategories
                tableViewShouldAnimate = true
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.reloadView.hideReloadView()
                })
                refreshTableView()
            }
        }
    }
    
    func JSONRequestDataTaskOnFailed(request: JSONRequest, errorMessage: String) {
        self.reloadView.showReloadView(errorMessage)
    }
}
