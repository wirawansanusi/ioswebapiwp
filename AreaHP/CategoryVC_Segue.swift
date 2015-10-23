//
//  CategoryVC_Segue.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController {
    
    func initDestinationViewController(category: Categories) {
        
        var hasSubCategory = false
        for _category in self.categories! {
            if category.id == _category.parentId {
                
                // Since we already know there's a subcategory,
                // break from the looping and continuing the process
                hasSubCategory = true
                break
            }
        }
        
        if hasSubCategory {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let subCategoryVC = storyboard.instantiateViewControllerWithIdentifier("CategoryViewController") as! CategoryViewController
            subCategoryVC.title = category.title
            subCategoryVC.parentId = category.id
            subCategoryVC.categories = self.categories
            showViewController(subCategoryVC, sender: self)
        } else {
            
            // perform segue identifier from storyboard
            self.selectedCategory = category
            performSegueWithIdentifier("showProductListViewController", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showProductListViewController" {
            
            let destination = segue.destinationViewController as! ProductListViewController
            destination.categoryId = self.selectedCategory!.id
            destination.title = self.selectedCategory!.title
        }
    }
}
