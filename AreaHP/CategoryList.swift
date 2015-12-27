//
//  CategoryList.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/27/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class CategoryList {
    
    var categories: [Categories]
    var currentCategories: [Categories]
    var parentId: Int
    
    init(categories: [Categories]) {
        self.categories = categories
        self.currentCategories = [Categories]() // We need to initialized it first
        self.parentId = -1
        
        self.currentCategories = filterCategories(0)
    }
    
    func filterCategories(id: Int) -> [Categories] {
        var mainCategories = [Categories]()
        for category in categories {
            if category.parentId == id {
                mainCategories.append(category)
            }
        }
        
        return mainCategories
    }
    
    func filterCategories(predicate: String) -> [Categories] {
        let filteredCategories = self.categories.filter { (category: Categories) -> Bool in
            
            let matchedString = category.title.rangeOfString(predicate, options: .CaseInsensitiveSearch)
            
            return (matchedString != nil || predicate.characters.count == 0)
        }
        
        return filteredCategories
    }
    
    func getMainCategories() -> [Categories] {
        return filterCategories(0)
    }
    
    func getCurrentCategories() -> [Categories] {
        return currentCategories
    }
    
    func getCategories() -> [Categories] {
        return categories
    }
    
    func getSubCategories(parentId: Int) -> [Categories] {
        let categories = filterCategories(parentId)
        if categories.count > 0 {
            self.currentCategories = categories
            self.parentId = getGrandParentId(parentId)
        }
        return categories
    }
    
    func getGrandParentId(parentId: Int) -> Int {
        for category in categories {
            if category.id == parentId {
                return category.parentId
            }
        }
        return -1
    }
    
    func getParentId() -> Int {
        return parentId
    }
    
    func getCurrentCategory(index: Int) -> Categories {
        return currentCategories[index]
    }
}