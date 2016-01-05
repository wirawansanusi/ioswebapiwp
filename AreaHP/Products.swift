//
//  Products.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class Products {
    
    var id: Int
    var title: String
    var category: String
    var price: String
    var thumbnailURL: NSURL
    var thumbnailImage: UIImage?
    
    // Product Detail Information
    var weight: String?
    var warranty: String?
    var additional: String?
    
    init(id: Int, title: String, category: String, price: String, thumbnailURL: NSURL) {
        self.id = id
        self.title = title
        self.category = category
        self.price = price
        self.thumbnailURL = thumbnailURL
    }
    
    func detail(weight: String, warranty: String, additional: String) {
        self.weight = weight
        self.warranty = warranty
        self.additional = additional
    }
}
