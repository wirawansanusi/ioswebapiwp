//
//  ProductCell.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MagicalRecord

protocol ProductCellDelegate {
    
    func productCellHasFinishedPerformingCoreData(controller: ProductCell)
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var warrantyLabel: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var id: Int?
    var thumbnailURL: NSURL?
    var isFavorite = false
    var coreDataDelegate: ProductCellDelegate?
    
    func checkFavorite() {
        
        let product = CDProduct.MR_findFirstByAttribute("id", withValue: self.id!)
        if product == nil {
            self.isFavorite = false
            self.favoriteButton.backgroundColor = GLOBAL_VALUES.COLOR.PRIMARY
            self.favoriteButton.setTitle("Tambahkan ke dalam favorit", forState: .Normal)
        } else {
            self.isFavorite = true
            self.favoriteButton.backgroundColor = GLOBAL_VALUES.COLOR.WARNING
            self.favoriteButton.setTitle("Hapus dalam daftar favorit", forState: .Normal)
        }
    }
    
    @IBAction func appendIntoFavorite(sender: AnyObject) {
        
        if isFavorite {
            removeProductFromFavorite()
        } else {
            addProductIntoFavorite()
        }
        
    }
    
    func removeProductFromFavorite() {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let product = CDProduct.MR_findFirstByAttribute("id", withValue: self.id, inContext: localContext)
            product.MR_deleteEntityInContext(localContext)
            
            }) { (contextDidSave: Bool, error: NSError!) -> Void in
                
                //print("Context did save : \(contextDidSave)")
                self.coreDataDelegate?.productCellHasFinishedPerformingCoreData(self)
        }
    }
    
    func addProductIntoFavorite() {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let product = CDProduct.MR_createEntityInContext(localContext)
            product.id = self.id
            product.title = self.titleLabel.text
            product.category = self.categoryLabel.text
            product.price = self.priceLabel.text
            product.thumbnailURL = self.thumbnailURL!.absoluteString
            product.thumbnailImage = UIImagePNGRepresentation(self.thumbnailImageView.image!)
            product.weight = self.weightLabel.text
            product.warranty = self.warrantyLabel.text
            product.additional = self.additionalLabel.text
            
            }) { (contextDidSave: Bool, error: NSError!) -> Void in
                
                //print("Context did save : \(contextDidSave)")
                self.coreDataDelegate?.productCellHasFinishedPerformingCoreData(self)
        }
    }
}
