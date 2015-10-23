//
//  CategoryVC_TableView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.styleTableView()
    }
    
    func refreshTableView() {
        
        self.tableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let search = searchController {
            if search.active {
                return self.filteredCategories.count
            }
        }
        return self.currentCategories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return configureCellForRowAtIndexPath(indexPath)
    }
    
    func configureCellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
        
        var category: Categories?
        if let search = searchController {
            if search.active {
                category = self.filteredCategories[indexPath.row]
            } else {
                category = self.currentCategories[indexPath.row]
            }
        }
        cell.textLabel?.text = category!.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animation for deselect the selected row
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var category = self.currentCategories[indexPath.row]
        if let search = searchController {
            if search.active {
                category = self.filteredCategories[indexPath.row]
            }
        }
        
        self.initDestinationViewController(category)
    }
}
