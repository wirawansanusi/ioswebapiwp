//
//  FavoriteVC_FetchProducts.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FavoriteViewController: JSONRequestDelegate {
    
    func fetchProduct(productCoreData: Products, index: Int) {
        
        let request = JSONRequest(delegate: self, URL: GLOBAL_VALUES.FETCH.PRODUCT.URL(productCoreData.id))
        request.run()
        
        /*
        let urlRequest = NSURLRequest(URL: GLOBAL_VALUES.FETCH.PRODUCT.URL(productCoreData.id))
        let session = NSURLSession.sharedSession()
        session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                
                var json: AnyObject?
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                } catch _ {
                    json = nil
                }
                
                if let metadata = json as? [String: AnyObject] {
                    if let productData = metadata["posts"] as? [String: AnyObject] {
                        productCoreData.title = productData["title"] as! String
                        let thumbnailURLString = productData["thumbnail"] as! String
                        productCoreData.thumbnailURL = NSURL(string: thumbnailURLString)!
                        if let tagsData = productData["tags"] as? [[String: AnyObject]] {
                            let tagData = tagsData.first!
                            productCoreData.price = tagData["title"] as! String
                        }
                        
                        self.fetchProductDetail(productCoreData, productData: productData)
                            
                        // Reassign new product data value
                        self.products[index] = productCoreData
                        self.filteredProducts = self.products
                        self.collectionViewShouldAnimate = true
                        self.refreshCollectionView()
                    }
                }
            }
        }.resume()
        */
    }
    
    func fetchProductDetail(productCoreData: Products, productData: [String: AnyObject]) {
        
        var weight = productCoreData.weight
        var warranty = productCoreData.warranty
        var additional = [String]()
        
        if let weightsData = productData["taxonomy_berat"] as? [[String: AnyObject]] {
            for weightData in weightsData {
                weight = weightData["title"] as? String
            }
        }
        if let warrantiesData = productData["taxonomy_garansi"] as? [[String: AnyObject]] {
            for warrantyData in warrantiesData {
                warranty = warrantyData["title"] as? String
            }
        }
        if let additionalsData = productData["taxonomy_paket-pengiriman"] as? [[String: AnyObject]] {
            for additionalData in additionalsData {
                additional.append((additionalData["title"] as? String)!)
            }
        }
        if additional.count == 0 {
            additional = productCoreData.additional
        }
        
        // Reassign the properties value
        productCoreData.weight = weight
        productCoreData.warranty = warranty
        productCoreData.additional = additional
    }
    
    func JSONRequestDataTaskOnSuccess(request: JSONRequest, JSONObject: AnyObject) {
        /*
        if let metadata = JSONObject as? [String: AnyObject] {
            if let productData = metadata["posts"] as? [String: AnyObject] {
                productCoreData.title = productData["title"] as! String
                let thumbnailURLString = productData["thumbnail"] as! String
                productCoreData.thumbnailURL = NSURL(string: thumbnailURLString)!
                if let tagsData = productData["tags"] as? [[String: AnyObject]] {
                    let tagData = tagsData.first!
                    productCoreData.price = tagData["title"] as! String
                }
                
                self.fetchProductDetail(productCoreData, productData: productData)
                
                // Reassign new product data value
                self.products[index] = productCoreData
                self.filteredProducts = self.products
                self.collectionViewShouldAnimate = true
                self.refreshCollectionView()
            }
        }
        */
    }
    
    func JSONRequestDataTaskOnFailed(request: JSONRequest, errorMessage: String) {
        // Do nothing here..
    }
}