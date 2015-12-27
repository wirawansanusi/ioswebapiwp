//
//  ProductListVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var reloadView: ReloadView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Products]()
    var filteredProducts = [Products]()
    var selectedProduct: Products?
    
    // Used to get products by category id
    var categoryId: Int!
    
    // Used to perform an animation once after the data has been loaded
    var collectionViewShouldAnimate = false
    
    // Used to add the search bar into the table view header
    var searchController: UISearchController?
    
    // Once token
    var token: dispatch_once_t = 0
    
    var request: JSONRequest?

    override func viewDidLoad() {
        super.viewDidLoad()

        initJSONRequest()
        initReloadView()
        fetchProducts()
        initCollectionView()
        styleSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if collectionViewShouldAnimate {
            animateCollectionView()
            collectionViewShouldAnimate = false
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
    }
}
