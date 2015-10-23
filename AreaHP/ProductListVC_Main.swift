//
//  ProductListVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchProducts()
        self.initCollectionView()
        self.styleSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if self.collectionViewShouldAnimate {
            self.animateCollectionView()
            self.collectionViewShouldAnimate = false
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        self.dismissSearchController()
    }
}
