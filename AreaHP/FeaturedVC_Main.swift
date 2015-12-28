//
//  FeaturedVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/24/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var reloadView: ReloadView!
    
    var categoryId: Int?
    var request: JSONRequest?
    var products = [Products]()
    // Used to perform an animation once after the data has been loaded
    var collectionViewShouldAnimate = false
    var collectionTypeIsFeatured = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftMenuButton()
        setupCenter()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if collectionViewShouldAnimate {
            animateCollectionView()
            collectionViewShouldAnimate = false
        }
    }
    
    func setupCenter() {
        initNotificationCenter()
        initReloadView()
        initJSONRequest(GLOBAL_VALUES.FETCH.FEATURED.URL())
        initCollectionView()
    }
}
