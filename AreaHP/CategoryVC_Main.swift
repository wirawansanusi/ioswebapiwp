//
//  CategoryVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var sidenavLogo: UIImageView!
    @IBOutlet weak var reloadView: ReloadView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchContainer: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var categories: [Categories]?
    var categoryList: CategoryList?
    var currentCategories = [Categories]()
    var selectedCategory: Categories?
    var tableFooterViewController: TableFooterViewController?
    
    // Show error message when NSURLSession has error
    var errorMessage: String?
    
    // Used to check category hierarchy
    // nil -> root Category
    var parentId = 0
    
    // Used to perform an animation once after the data has been loaded
    var tableViewShouldAnimate = false
    
    var request: JSONRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initRecognizer()
        initJSONRequest()
        initReloadView()
        initTableView()
        initSearchBar()
        fetchCategories()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if tableViewShouldAnimate {
            animateTableView()
            tableViewShouldAnimate = false
        }
    }
}
