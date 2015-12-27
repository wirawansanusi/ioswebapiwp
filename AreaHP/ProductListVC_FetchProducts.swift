//
//  ProductListVC_FetchProducts.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController: JSONRequestDataTaskDelegate {
    
    func initJSONRequest() {
        request = JSONRequest()
        request?.dataTaskDelegate = self
    }
    
    func fetchProducts() {
        request!.dataTask(GLOBAL_VALUES.FETCH.PRODUCTS.URL(self.categoryId))
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
    
    func JSONRequestDataTaskOnSuccess(request: JSONRequest, JSONObject: AnyObject) {
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
                self.products = products
                self.filteredProducts = products
                self.collectionViewShouldAnimate = true
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.reloadView.hideReloadView()
                })
                self.refreshCollectionView()
            }
        }
    }
    
    func JSONRequestDataTaskOnFailed(request: JSONRequest, errorMessage: String) {
        self.reloadView.showReloadView(errorMessage)
    }
}
