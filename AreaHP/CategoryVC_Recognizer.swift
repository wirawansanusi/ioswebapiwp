//
//  CategoryVC_Recognizer.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/28/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

extension CategoryViewController {
    
    func initRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("didPressSidenavLogo:"))
        sidenavLogo.addGestureRecognizer(recognizer)
    }
}
