//
//  CategoryVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Categories]?
    var currentCategories = [Categories]()
    var filteredCategories = [Categories]()
    var selectedCategory: Categories?
    
    // Used to check category hierarchy
    // nil -> root Category
    var parentId: Int?
    
    // Used to perform an animation once after the data has been loaded
    var tableViewShouldAnimate = false
    
    // Used to add the search bar into the table view header
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNavigationBar()
        self.initTableView()
        if self.parentId == nil {
            self.fetchCategories()
        } else {
            self.fetchSubCategories()
        }
        self.initSearchController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if self.tableViewShouldAnimate {
            self.animateTableView()
            self.tableViewShouldAnimate = false
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        self.dismissSearchController()
    }
}
