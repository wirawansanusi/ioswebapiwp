//
//  ReloadView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/24/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol ReloadViewDelegate {
    
    func reloadViewdidPressURLSessionButton(controller: ReloadView)
    func reloadViewShouldPresentView(controller: ReloadView)
    func reloadViewShouldHideView(controller: ReloadView)
}

class ReloadView: UIView {
    
    var delegate: ReloadViewDelegate?
    
    @IBOutlet weak var reloadLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    @IBAction func reloadURLSession(sender: AnyObject) {
        
        self.reloadButton.alpha = 0
        SVProgressHUD.show()
        self.delegate?.reloadViewdidPressURLSessionButton(self)
    }
    
    func showReloadView(message: String) {
        
        self.alpha = 1.0
        self.reloadButton.alpha = 1.0
        SVProgressHUD.dismiss()
        self.reloadLabel.text = message
        
        self.delegate?.reloadViewShouldPresentView(self)
    }
    
    func hideReloadView() {
        
        self.alpha = 0
        SVProgressHUD.dismiss()
        self.reloadLabel.text = ""
        
        self.delegate?.reloadViewShouldHideView(self)
    }
}
