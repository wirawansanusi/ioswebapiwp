//
//  CategoryVC_TableView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource, TableFooterDelegate {
    
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
        
        return currentCategories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return configureCellForRowAtIndexPath(indexPath)
    }
    
    func configureCellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
        
        let category = currentCategories[indexPath.row]
        cell.textLabel?.text = category.title
        cellHeight = cell.bounds.height
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Animation for deselect the selected row
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let category = currentCategories[indexPath.row]
        let id = category.id
        let subCategory = categoryList!.getSubCategories(id)
        if subCategory.count > 0 {
            reloadTableView(subCategory)
            parentId = id
            
        } else {
            selectCategory(id)
            closeSideDrawer()
        }
    }
    
    func reloadTableView(subCategory: [Categories]) {
        currentCategories = subCategory
        refreshTableView()
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if parentId != 0 {
            tableFooterViewController = TableFooterViewController()
            tableFooterViewController?.delegate = self
            return tableFooterViewController?.view
        }
        
        let view = UIView()
        view.frame = CGRect(origin: CGPointZero, size: CGSizeZero)
        return view
    }
    
    func tableFooterButtonDidPressed(controller: TableFooterViewController) {
        let id = categoryList!.getParentId()
        let categories = categoryList!.getSubCategories(id)
        parentId = id
        reloadTableView(categories)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if parentId != 0 {
            return cellHeight
        }
        return 0
    }
    
    func selectCategory(id: Int) {
        print("Category ID : \(id) has been selected!")
    }
}
