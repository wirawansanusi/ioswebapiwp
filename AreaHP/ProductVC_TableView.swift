//
//  ProductVC_TableView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductViewController: UITableViewDelegate, UITableViewDataSource, ProductCellDelegate {
    
    func initTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.styleTableView()
        
        // Uses for dynamic sizing cell's size
        self.tableView.estimatedRowHeight = 150.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
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
        var additional = ""
        if self.product.additional.count > 0 {
            for index in 0..<self.product.additional.count {
                if index == 0 {
                    additional += String(format: "\(self.product.additional[index])")
                } else {
                    additional += String(format: "\n\(self.product.additional[index])")
                }
            }
        }
        cell.additionalLabel.text = additional
        cell.priceLabel.text = product.price
        
        // Used for Core Data querying
        cell.id = self.product.id
        cell.thumbnailURL = self.product.thumbnailURL
        cell.coreDataDelegate = self
        cell.checkFavorite()
        
        return cell
    }
    
    func ProductCellHasFinishedPerformingCoreData(controller: ProductCell) {
        
        self.tableView.reloadData()
    }
}