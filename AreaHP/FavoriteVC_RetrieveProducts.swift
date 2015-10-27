//
//  FavoriteVC_RetrieveProducts.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MagicalRecord

extension FavoriteViewController {
    
    func retrieveProducts() {
        
        var products = [Products]()
        let productsData = CDProduct.MR_findAllSortedBy("title", ascending: true) as! [CDProduct]
        
        if productsData.count > 0 {
            for productData in productsData {
                let id_number = productData.id!
                let id = Int(id_number)
                let title = productData.title!
                let category = productData.category!
                let thumbnailURL_string = productData.thumbnailURL!
                let thumbnailURL = NSURL(string: thumbnailURL_string)!
                let thumbnailImage_data = productData.thumbnailImage!
                let thumbnailImage = UIImage(data: thumbnailImage_data)
                let price = productData.price!
                
                let product = Products(id: id, title: title, category: category, price: price, thumbnailURL: thumbnailURL)
                product.thumbnailImage = thumbnailImage
                product.weight = productData.weight
                product.warranty = productData.warranty
                product.additional.append(productData.additional!)
                products.append(product)
            }
            
            self.products = products
            for index in 0..<self.products.count {
                self.fetchProduct(self.products[index], index: index)
            }
    
            self.refreshCollectionView()
            self.collectionView.reloadData()
            self.hideReloadView()
            
        } else {
            
            self.showReloadView()
        }
    }
}