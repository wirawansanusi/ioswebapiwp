//
//  JSONRequest.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/13/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import AFNetworking

protocol JSONRequestDataTaskDelegate {
    func JSONRequestDataTaskOnSuccess(request: JSONRequest, JSONObject: AnyObject)
    func JSONRequestDataTaskOnFailed(request: JSONRequest, errorMessage: String)
}

protocol JSONRequestDownloadTaskDelegate {
    func JSONRequestDownloadTaskOnSuccess(request: JSONRequest, response: NSURL)
    func JSONRequestDownloadTaskOnFailed(request: JSONRequest, errorMessage: String)
}

class JSONRequest {
    
    var manager: AFURLSessionManager
    var dataTaskDelegate: JSONRequestDataTaskDelegate?
    var downloadTaskDelegate: JSONRequestDownloadTaskDelegate?
    
    init () {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.manager = AFURLSessionManager(sessionConfiguration: sessionConfig)
    }
    
    func dataTask(URL: NSURL) {
        let request = NSURLRequest(URL: URL)
        manager.dataTaskWithRequest(request, completionHandler: dataTaskCompletion).resume()
    }
    
    func dataTaskCompletion(response: NSURLResponse, responseObject: AnyObject?, status: NSError?) {
        if let error = status {
            self.dataTaskDelegate?.JSONRequestDataTaskOnFailed(self, errorMessage: error.localizedDescription)
        } else {
            self.dataTaskDelegate?.JSONRequestDataTaskOnSuccess(self, JSONObject: responseObject!)
        }
    }
    
    func downloadTask(URL: NSURL) {
        let request = NSURLRequest(URL: URL)
        manager.downloadTaskWithRequest(request, progress: nil, destination: downloadTaskDest, completionHandler: downloadTaskCompletion).resume()
    }
    
    func downloadTaskDest(url: NSURL, urlResponse: NSURLResponse) -> NSURL {
        print(url.absoluteString)
        print(urlResponse.URL?.absoluteString)
        
        return url
    }
    
    func downloadTaskCompletion(urlResponse: NSURLResponse, filePath: NSURL?, status: NSError?) {
        if let error = status {
            self.downloadTaskDelegate?.JSONRequestDownloadTaskOnFailed(self, errorMessage: error.localizedDescription)
        } else {
            self.downloadTaskDelegate?.JSONRequestDownloadTaskOnSuccess(self, response: filePath!)
        }
    }
}
