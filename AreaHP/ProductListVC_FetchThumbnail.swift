//
//  ProductListVC_FetchThumbnail.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/20/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductListViewController{
    
    func fetchThumbnail(product: Products) {
        
        let urlRequest = NSURLRequest(URL: product.thumbnailURL)
        request?.manager.downloadTaskWithRequest(urlRequest, progress: nil, destination: { (url: NSURL, response: NSURLResponse) -> NSURL in
            var documentDirectory: NSURL?
            do {
                documentDirectory = try NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false)
            } catch _ {
                //
            }
            return documentDirectory!.URLByAppendingPathComponent(response.suggestedFilename!)
            
            }, completionHandler: { (response: NSURLResponse, filePath: NSURL?, error: NSError?) -> Void in
            if error == nil {
                let imageData = NSData(contentsOfURL: filePath!)
                let image = UIImage(data: imageData!)
                
                product.thumbnailImage = image
                self.refreshCollectionView()
            }
        }).resume()
    }
}