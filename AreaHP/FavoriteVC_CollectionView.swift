//
//  FavoriteVC_CollectionView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

//
//  ProductListVC_CollectionView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func initCollectionView() {
        
        self.collectionView!.registerNib(UINib(nibName: "ProductListCell", bundle: nil), forCellWithReuseIdentifier: "productListCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func refreshCollectionView() {
        
        self.collectionView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: false)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return configureCellForRowAtIndexPath(indexPath)
    }
    
    func configureCellForRowAtIndexPath(indexPath: NSIndexPath) -> ProductListCell {
        
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("productListCell", forIndexPath: indexPath) as! ProductListCell
        let product = products[indexPath.row]
        
        if let image = product.thumbnailImage {
            cell.thumbnailImage.image = image
        } else {
            print("missing")
        }
        cell.titleLabel.text = product.title
        cell.titleLabel.sizeToFit()
        cell.priceLabel.text = product.price
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // Animation for deselect the selected item
        self.collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        selectedProduct = self.products[indexPath.row]
        self.performSegueWithIdentifier("showProductViewController", sender: self)
    }
    
    /*
    UICOLLECTION VIEW FLOW LAYOUT
    */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenWidth = UIScreen.mainScreen().bounds.width - 30.0
        // For section insets, please refer to the storyboard
        
        return CGSize(width: screenWidth / 2.0, height: 220)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10.0, left: 2.5, bottom: 10.0, right: 2.5)
    }
}