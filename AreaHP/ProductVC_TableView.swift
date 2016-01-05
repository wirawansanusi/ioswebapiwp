//
//  ProductVC_TableView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductViewController: UITableViewDelegate, UITableViewDataSource, ProductTableFooterViewDelegate {
    
    func initTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.styleTableView()
        
        // Uses for dynamic sizing cell's size
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return configureCellForRowAtIndexPath(indexPath)
    }
    
    func configureCellForRowAtIndexPath(indexPath: NSIndexPath) -> ProductCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath) as! ProductCell
        let product = self.product
        
        cell.titleLabel.text = product.title
        cell.titleLabel.sizeToFit()
        cell.categoryLabel.text = product.category
        if let image = product.thumbnailImage {
            cell.thumbnailImageView.image = image
        }
        cell.weightLabel.text = self.product.weight!
        cell.warrantyLabel.text = self.product.warranty!
        cell.additionalLabel.text = self.product.additional!
        cell.additionalLabel.sizeToFit()
        cell.priceLabel.text = product.price
        
        /*
        // Used for Core Data querying
        cell.id = self.product.id
        cell.thumbnailURL = self.product.thumbnailURL
        cell.coreDataDelegate = self
        cell.checkFavorite()
        */
        
        return cell
    }
    
    /*
    func productCellHasFinishedPerformingCoreData(controller: ProductCell) {
        
        self.tableView.reloadData()
    }
    */
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 50.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        productTableFooterViewController = ProductTableFooterViewController(nibName: "ProductTableFooterViewController", bundle: nil, product: self.product)
        productTableFooterViewController?.coreDataDelegate = self
        
        return productTableFooterViewController?.view
    }
    
    func productCellHasFinishedPerformingCoreData(controller: ProductTableFooterViewController) {
        
        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.None)
    }
}