//
//  Categories.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class Categories {
    
    var id: Int
    var title: String
    var slug: String
    var parentId: Int
    
    init(id: Int, title: String, slug: String, parentId: Int) {
        
        self.id = id
        self.title = title
        self.slug = slug
        self.parentId = parentId
    }
}
