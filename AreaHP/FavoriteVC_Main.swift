//
//  FavoriteVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var reloadView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Products]()
    var filteredProducts = [Products]()
    var selectedProduct: Products?
    
    // Used to get products by category id
    var categoryId: Int!
    
    // Used to perform an animation once after the data has been loaded
    var collectionViewShouldAnimate = false
    
    // Used to requery the data inside CDFavorite Core Data
    var viewControllerDidLoad = false
    
    // Used to add the search bar into the table view header
    var searchController: UISearchController?
    
    // Once token
    var token: dispatch_once_t = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveProducts()
        initCollectionView()
        viewControllerDidLoad = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if collectionViewShouldAnimate {
            animateCollectionView()
            collectionViewShouldAnimate = false
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if viewControllerDidLoad {
            retrieveProducts()
        }
    }
}