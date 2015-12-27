//
//  ContactVC_Style.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/23/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension ContactViewController {
    
    func styleTableView() {
        
        self.tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func styleIntroTextView() {
        
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 1.5
        let attributes = [NSParagraphStyleAttributeName : style]
        introTextView.attributedText = NSAttributedString(string: GLOBAL_VALUES.CONTACT.INTRO.TEXT, attributes:attributes)
        introTextView.font = UIFont.systemFontOfSize(14.0)
    }
}
