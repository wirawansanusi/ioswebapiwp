//
//  FavoriteVC_Segue.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/27/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FavoriteViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showProductViewController" {
            
            let destination = segue.destinationViewController as! ProductViewController
            destination.product = self.selectedProduct
        }
    }
}