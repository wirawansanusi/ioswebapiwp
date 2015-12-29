//
//  FeaturedVC_FetchProducts.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/28/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FeaturedViewController: JSONRequestDataTaskDelegate {
    
    func initJSONRequest(url: NSURL) {
        request = JSONRequest()
        request?.dataTaskDelegate = self
        request!.dataTask(url)
    }
    
    func JSONRequestDataTaskOnSuccess(request: JSONRequest, JSONObject: AnyObject) {
        var products = [Products]()
        if let _ = categoryId {
            products = parseProductListJSONRequest(JSONObject)
        } else {
            products = parseFeaturedJSONRequest(JSONObject)
        }
        
        self.products = products
        self.collectionViewShouldAnimate = true
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.reloadView.hideReloadView()
        })
        self.refreshCollectionView()
        self.collectionView.setContentOffset(CGPointZero, animated:true)
    }
    
    func JSONRequestDataTaskOnFailed(request: JSONRequest, errorMessage: String) {
        self.reloadView.showReloadView(errorMessage)
    }
    
    func parseProductListJSONRequest(JSONObject: AnyObject) -> [Products] {
        
        var products = [Products]()
        if let metadata = JSONObject as? [String: AnyObject] {
            var category: String?
            if metadata["category"] != nil {
                let categoryData = metadata["category"] as! [String: AnyObject]
                category = categoryData["title"] as? String
            }
            if let productsData = metadata["posts"] as? [[String: AnyObject]] {
                for productData in productsData {
                    let id = productData["id"] as! Int
                    let title = productData["title"] as! String
                    let thumbnailURL_string = productData["thumbnail"] as! String
                    let thumbnailURL = NSURL(string: thumbnailURL_string)!
                    var price: String?
                    if let tagsData = productData["tags"] as? [[String: AnyObject]] {
                        let tagData = tagsData.first!
                        price = tagData["title"] as? String
                    }
                    
                    let product = Products(id: id, title: title, category: category!, price: price!, thumbnailURL: thumbnailURL)
                    let productWithDetail = self.fetchProductDetail(product, productData: productData)
                    
                    products.append(productWithDetail)
                }
            }
        }
        collectionTypeIsFeatured = false
        return products
    }
    
    func fetchProductDetail(product: Products, productData: [String: AnyObject]) -> Products {
        
        var weight = "-"
        var warranty = "-"
        var additional = [String]()
        
        if let weightsData = productData["taxonomy_berat"] as? [[String: AnyObject]] {
            for weightData in weightsData {
                weight = weightData["title"] as! String
            }
        }
        if let warrantiesData = productData["taxonomy_garansi"] as? [[String: AnyObject]] {
            for warrantyData in warrantiesData {
                warranty = warrantyData["title"] as! String
            }
        }
        if let additionalsData = productData["taxonomy_paket-pengiriman"] as? [[String: AnyObject]] {
            for additionalData in additionalsData {
                additional.append((additionalData["title"] as? String)!)
            }
        }
        if additional.count == 0 {
            additional.append("-")
        }
        
        product.detail(weight, warranty: warranty, additional: additional)
        
        return product
    }
    
    func parseFeaturedJSONRequest(JSONObject: AnyObject) -> [Products] {
        
        var products = [Products]()
        if let metadata = JSONObject as? [String: AnyObject] {
            if let categoriesData = metadata["categories"] as? [[String: AnyObject]] {
                for categoryData in categoriesData {
                    let id = categoryData["id"] as! Int
                    let title = categoryData["title"] as! String
                    let category = title
                    let thumbnailURL_string = categoryData["thumbnail"] as! String
                    let thumbnailURL = NSURL(string: thumbnailURL_string)!
                    let price = "-"
                    
                    let product = Products(id: id, title: title, category: category, price: price, thumbnailURL: thumbnailURL)
                    
                    products.append(product)
                }
            }
        }
        collectionTypeIsFeatured = true
        return products
    }
}

