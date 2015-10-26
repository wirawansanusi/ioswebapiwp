//
//  ReloadView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/24/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

protocol ReloadViewDelegate {
    
    func reloadViewdidPressURLSessionButton(controller: ReloadView)
    func reloadViewShouldPresentView(controller: ReloadView)
    func reloadViewShouldHideView(controller: ReloadView)
}

class ReloadView: UIView {
    
    var delegate: ReloadViewDelegate?
    
    @IBOutlet weak var reloadLabel: UILabel!
    @IBOutlet weak var reloadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var reloadButton: UIButton!
    
    @IBAction func reloadURLSession(sender: AnyObject) {
        
        self.reloadButton.alpha = 0
        self.reloadIndicator.alpha = 1.0
        self.reloadIndicator.startAnimating()
        self.delegate?.reloadViewdidPressURLSessionButton(self)
    }
    
    func showReloadView(message: String) {
        
        self.alpha = 1.0
        self.reloadButton.alpha = 1.0
        self.reloadIndicator.alpha = 0
        self.reloadIndicator.stopAnimating()
        self.reloadLabel.text = message
        
        self.delegate?.reloadViewShouldPresentView(self)
    }
    
    func hideReloadView() {
        
        self.alpha = 0
        self.reloadButton.alpha = 0
        self.reloadIndicator.alpha = 0
        self.reloadLabel.text = ""
        
        self.delegate?.reloadViewShouldHideView(self)
    }
}
