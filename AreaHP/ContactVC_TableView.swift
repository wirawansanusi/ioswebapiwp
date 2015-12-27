//
//  ContactVC_TableView.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/23/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MapKit

extension ContactViewController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadTableViewData()
        
        self.styleTableView()
    }
    
    func loadTableViewData() {
        
        self.contacts = [(UIImage, String, NSURL)]()
        let direction = (GLOBAL_VALUES.CONTACT.DIRECTION.IMAGE, GLOBAL_VALUES.CONTACT.DIRECTION.TITLE, GLOBAL_VALUES.CONTACT.DIRECTION.URL)
        let phone = (GLOBAL_VALUES.CONTACT.STORE.IMAGE, GLOBAL_VALUES.CONTACT.STORE.TITLE, GLOBAL_VALUES.CONTACT.STORE.URL)
        let BBM = (GLOBAL_VALUES.CONTACT.BBM.IMAGE, GLOBAL_VALUES.CONTACT.BBM.TITLE, GLOBAL_VALUES.CONTACT.BBM.URL)
        let email = (GLOBAL_VALUES.CONTACT.EMAIL.IMAGE, GLOBAL_VALUES.CONTACT.EMAIL.TITLE, GLOBAL_VALUES.CONTACT.EMAIL.URL)
        let email2 = (GLOBAL_VALUES.CONTACT.EMAIL2.IMAGE, GLOBAL_VALUES.CONTACT.EMAIL2.TITLE, GLOBAL_VALUES.CONTACT.EMAIL2.URL)
        
        contacts.append(direction)
        contacts.append(phone)
        contacts.append(BBM)
        contacts.append(email)
        contacts.append(email2)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return self.configureCellForRowAtIndexPath(indexPath)
    }
    
    func configureCellForRowAtIndexPath(indexPath: NSIndexPath) -> ContactCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! ContactCell
        let (image, title, _) = self.contacts[indexPath.row]
        
        cell.contactIcon.image = image
        cell.contactLabel.text = title
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let (_, _, url) = self.contacts[indexPath.row]
        
        if indexPath.row == 0 {
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            self.annotation!.mapItem().openInMapsWithLaunchOptions(launchOptions)
            
        } else if indexPath.row == 1 {
            self.showAlertFromCallView()
            
        } else {
            if UIApplication.sharedApplication().canOpenURL(url) {
                UIApplication.sharedApplication().openURL(url)
            } else {
                self.showAlertFromOpenUrl()
            }
        }
    }
}
