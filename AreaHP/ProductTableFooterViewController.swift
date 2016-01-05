//
//  ProductTableFooterViewController.swift
//  AreaHP
//
//  Created by wirawan sanusi on 1/5/16.
//  Copyright © 2016 Protogres. All rights reserved.
//

import UIKit
import MagicalRecord

protocol ProductTableFooterViewDelegate {
    
    func productCellHasFinishedPerformingCoreData(controller: ProductTableFooterViewController)
}

class ProductTableFooterViewController: UIViewController {

    @IBOutlet weak var productBtn: UIButton!
    
    var product: Products?
    var thumbnailURL: NSURL?
    var isFavorite = false
    var coreDataDelegate: ProductTableFooterViewDelegate?
    
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, product: Products) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.product = product
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkFavorite()
    }
    
    @IBAction func didPressProductBtn(sender: AnyObject) {
        
        if isFavorite {
            removeProductFromFavorite()
        } else {
            addProductIntoFavorite()
        }
    }
    
    func removeProductFromFavorite() {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let product = CDProduct.MR_findFirstByAttribute("id", withValue: self.product!.id, inContext: localContext)
            product.MR_deleteEntityInContext(localContext)
            
            }) { (contextDidSave: Bool, error: NSError!) -> Void in
                
                //print("Context did save : \(contextDidSave)")
                self.coreDataDelegate?.productCellHasFinishedPerformingCoreData(self)
        }
    }
    
    func addProductIntoFavorite() {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let product = CDProduct.MR_createEntityInContext(localContext)
            product.id = self.product!.id
            product.title = self.product!.title
            product.category = self.product!.category
            product.price = self.product!.price
            product.thumbnailURL = self.product!.thumbnailURL.absoluteString
            product.thumbnailImage = UIImagePNGRepresentation(self.product!.thumbnailImage!)
            product.weight = self.product!.weight
            product.warranty = self.product!.warranty
            product.additional = self.product!.additional
            
            }) { (contextDidSave: Bool, error: NSError!) -> Void in
                
                //print("Context did save : \(contextDidSave)")
                self.coreDataDelegate?.productCellHasFinishedPerformingCoreData(self)
        }
    }
    
    func checkFavorite() {
        
        let product = CDProduct.MR_findFirstByAttribute("id", withValue: self.product!.id)
        if product == nil {
            self.isFavorite = false
            self.productBtn.backgroundColor = GLOBAL_VALUES.COLOR.PRIMARY
            self.productBtn.setTitle("Tambahkan ke dalam favorit", forState: .Normal)
        } else {
            self.isFavorite = true
            self.productBtn.backgroundColor = GLOBAL_VALUES.COLOR.WARNING
            self.productBtn.setTitle("Hapus dalam daftar favorit", forState: .Normal)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
