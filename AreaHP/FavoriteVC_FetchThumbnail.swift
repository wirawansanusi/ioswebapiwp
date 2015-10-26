//
//  FavoriteVC_FetchThumbnail.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension FavoriteViewController {
    
    func fetchThumbnail(product: Products) {
        
        let urlRequest = NSURLRequest(URL: product.thumbnailURL)
        let session = NSURLSession.sharedSession()
        session.downloadTaskWithRequest(urlRequest) { (urlRequest: NSURL?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                
                if let url = urlRequest {
                    let imageData = NSData(contentsOfURL: url)
                    let image = UIImage(data: imageData!)
                    
                    product.thumbnailImage = image
                    self.refreshCollectionView()
                }
            }
        }.resume()
    }
}
