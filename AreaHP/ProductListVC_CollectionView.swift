//
//  ProductListVC_CollectionView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func initCollectionView() {

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
        
        if let search = searchController {
            if search.active {
                return self.filteredProducts.count
            }
        }
        return self.products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return configureCellForRowAtIndexPath(indexPath)
    }
    
    func configureCellForRowAtIndexPath(indexPath: NSIndexPath) -> ProductListCell {
        
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("productListCell", forIndexPath: indexPath) as! ProductListCell
        
        var product: Products?
        if let search = self.searchController {
            if search.active {
                product = self.filteredProducts[indexPath.row]
            } else {
                product = self.products[indexPath.row]
            }
        }
        
        if let image = product!.thumbnailImage {
            cell.thumbnailImage.image = image
        }
        cell.titleLabel.text = product!.title
        cell.titleLabel.sizeToFit()
        cell.priceLabel.text = product!.price
        cell.priceLabel.sizeToFit()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        var product: Products?
        if let search = searchController {
            if search.active {
                product = self.filteredProducts[indexPath.row]
            } else {
                product = self.products[indexPath.row]
            }
        }
        
        if product!.thumbnailImage == nil {
            self.fetchThumbnail(product!)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // Animation for deselect the selected item
        self.collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        var product = self.products[indexPath.row]
        if let search = searchController {
            if search.active {
                product = self.filteredProducts[indexPath.row]
            }
        }
        
        self.selectedProduct = product
        self.performSegueWithIdentifier("showProductViewController", sender: self)
    }
    
    /*
        UICOLLECTION VIEW FLOW LAYOUT
    */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenWidth = UIScreen.mainScreen().bounds.width - 30.0
        // For section insets, please refer to the storyboard
        
        return CGSize(width: screenWidth / 2.0, height: 200)
    }
    
    /*
        UICOLLECTION REUSABLE VIEW (HEADER)
    */
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var view: UICollectionReusableView?
        if kind == UICollectionElementKindSectionHeader {
            
            view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "productListHeader", forIndexPath: indexPath)
            
            dispatch_once(&self.token, { () -> Void in
                let searchController = self.initSearchController()
                view!.addSubview(searchController.searchBar)
            })
            
            self.searchController?.searchBar.frame = view!.frame
        }
        
        
        return view!
    }
}
