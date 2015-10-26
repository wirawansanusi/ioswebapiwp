//
//  ProductListVC_FetchProducts.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController {
    
    func fetchProducts() {
        
        let urlRequest = NSURLRequest(URL: GLOBAL_VALUES.FETCH.PRODUCTS.URL(self.categoryId))
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
                
                var products = [Products]()
                if let metadata = json as? [String: AnyObject] {
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
            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.reloadView.showReloadView((error?.userInfo[NSLocalizedDescriptionKey])! as! String)
                })
            }
        }.resume()
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
}
