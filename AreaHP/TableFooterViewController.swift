//
//  TableFooterViewController.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/27/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

protocol TableFooterDelegate {
    func tableFooterButtonDidPressed(controller: TableFooterViewController)
}

class TableFooterViewController: UIViewController {
    var delegate: TableFooterDelegate?
    @IBOutlet weak var returnBtn: UIButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBorderTop()
    }
    
    @IBAction func buttonDidPressed(sender: AnyObject) {
        delegate?.tableFooterButtonDidPressed(self)
    }
    
    func addBorderTop() {
        
        let upperBorder = CALayer()
        upperBorder.backgroundColor = UIColor.groupTableViewBackgroundColor().CGColor
        upperBorder.frame = CGRect(origin: CGPointZero, size: CGSize(width: view.bounds.width, height: 1.0))
        view.layer.addSublayer(upperBorder)
    }
}
