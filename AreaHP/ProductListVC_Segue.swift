//
//  ProductListVC_Segue.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showProductViewController" {
            
            let destination = segue.destinationViewController as! ProductViewController
            destination.product = self.selectedProduct
        }
    }
}
