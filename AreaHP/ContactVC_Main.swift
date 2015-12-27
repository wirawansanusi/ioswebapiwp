//
//  ContactVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/22/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var introTextView: UITextView!
    
    var annotation: Annotation?
    var contacts = [(UIImage, String, NSURL)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAnnotationForDirection()
        styleIntroTextView()
        initTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}