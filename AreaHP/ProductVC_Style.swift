//
//  ProductVC_Style.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ProductViewController {
    
    func styleTableView() {
        
        self.tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
}
