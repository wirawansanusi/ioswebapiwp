//
//  ContactVC_ScrollView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/23/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ContactViewController {
    
    func adjustScrollViewContentSize() {
        
        let vertical = self.tableView.frame.origin.y
        let height = self.tableView.frame.height
        
        self.scrollView.contentSize.height = vertical + height + 20
    }
}
