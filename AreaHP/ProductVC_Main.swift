//
//  ProductVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/21/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var product: Products!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNavigationBar()
        self.initTableView()
    }
}
