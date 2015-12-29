//
//  FeaturedVC_CollectionView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/28/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func initCollectionView() {
        
        self.collectionView!.registerNib(UINib(nibName: "FeaturedCell", bundle: nil), forCellWithReuseIdentifier: "featuredCell")
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
        
        if collectionTypeIsFeatured {
            // we will display featured list
            return configureFeaturedCellForRowAtIndexPath(indexPath)
        }
        
        // we will display product list
        return configureProductListCellForRowAtIndexPath(indexPath)
    }
    
    func configureProductListCellForRowAtIndexPath(indexPath: NSIndexPath) -> ProductListCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("productListCell", forIndexPath: indexPath) as! ProductListCell
        let product = products[indexPath.row]
        
        configureThumbnailForRowAtIndexPath(cell.thumbnailImage, product: product)
        cell.titleLabel.text = product.title
        cell.titleLabel.sizeToFit()
        cell.priceLabel.text = product.price
        return cell
    }
    
    func configureFeaturedCellForRowAtIndexPath(indexPath: NSIndexPath) -> FeaturedCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("featuredCell", forIndexPath: indexPath) as! FeaturedCell
        let product = products[indexPath.row]
        
        configureThumbnailForRowAtIndexPath(cell.thumbnail, product: product)
        cell.title.text = product.title
        
        return cell
    }
    
    func configureThumbnailForRowAtIndexPath(image: UIImageView, product: Products) {
        
        image.sd_setImageWithURL(product.thumbnailURL, placeholderImage: UIImage(named: "placeholder")) { (image: UIImage!, error: NSError!, cacheType: SDImageCacheType, imageURL: NSURL!) -> Void in
            if let thumbnail = image {
                product.thumbnailImage = thumbnail
            }
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // Animation for deselect the selected item
        self.collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        selectedProduct = products[indexPath.row]
        if collectionTypeIsFeatured {
            willSendNotificationFromCenter()
        } else {
            performSegueWithIdentifier("showProductViewController", sender: self)
        }
    }
    
    /*
    UICOLLECTION VIEW FLOW LAYOUT
    */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if collectionTypeIsFeatured {
            return sizeForFeaturedCell()
        }
        return sizeForProductListCell()
    }
    
    func sizeForFeaturedCell() -> CGSize {
        
        let screenWidth = UIScreen.mainScreen().bounds.width - 35.0
        // For section insets, please refer to the storyboard
        
        return CGSize(width: screenWidth / 3.0, height: 150)
    }
    
    func sizeForProductListCell() -> CGSize {
        
        let screenWidth = UIScreen.mainScreen().bounds.width - 30.0
        // For section insets, please refer to the storyboard
        
        return CGSize(width: screenWidth / 2.0, height: 220)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if collectionTypeIsFeatured {
            return UIEdgeInsets(top: 10.0, left: 0, bottom: 10.0, right: 0)
        }
        return UIEdgeInsets(top: 10.0, left: 2.5, bottom: 10.0, right: 2.5)
    }
}
