//
//  CategoryVC_Style.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController {
    
    func styleTableView() {
        
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func animateTableView(){
        
        let defaultTopInset = self.tableView.contentInset.top
        self.tableView.contentInset.top = 100.0
        self.tableView.alpha = 0.0
        self.tableView.tableHeaderView?.alpha = 0.0
        UIView.animateWithDuration(0.7) { () -> Void in
            self.tableView.contentInset.top = defaultTopInset
            self.tableView.alpha = 1.0
            self.tableView.tableHeaderView?.alpha = 1.0
            
        }
    }
}
