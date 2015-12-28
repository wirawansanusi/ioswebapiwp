//
//  DrawerVC_Main.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/17/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MMDrawerController

class DrawerViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.performSegueWithIdentifier("showDrawerController", sender: self)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let centerView = storyboard.instantiateViewControllerWithIdentifier("CENTER_VIEW")
        let sideView = storyboard.instantiateViewControllerWithIdentifier("SIDE_VIEW2")
        
        if segue.identifier == "showDrawerController" {
            let destination = segue.destinationViewController as! WSDrawerController
            destination.centerViewController = centerView
            destination.leftDrawerViewController = sideView
            
            destination.showsShadow = false
            destination.openDrawerGestureModeMask = [MMOpenDrawerGestureMode.PanningCenterView]
            destination.closeDrawerGestureModeMask = [MMCloseDrawerGestureMode.TapCenterView]
        }
    }

}
