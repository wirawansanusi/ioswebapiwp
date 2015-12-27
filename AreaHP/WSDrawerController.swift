//
//  WSDrawerController.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/27/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MMDrawerController

class WSDrawerController: MMDrawerController {
    
    var shadowLayer: CALayer?
    
    override func openDrawerSide(drawerSide: MMDrawerSide, animated: Bool, velocity: CGFloat, animationOptions options: UIViewAnimationOptions, completion: ((Bool) -> Void)!) {
        
        super.openDrawerSide(drawerSide, animated: animated, velocity: velocity, animationOptions: options, completion: completion)
        addShadowIntoCenterView()
    }
    
    override func closeDrawerAnimated(animated: Bool, velocity: CGFloat, animationOptions options: UIViewAnimationOptions, completion: ((Bool) -> Void)!) {
        
        super.closeDrawerAnimated(animated, velocity: velocity, animationOptions: options, completion: completion)
        removeShadowFromCenterView()
    }
    
    func addShadowIntoCenterView() {
        
        shadowLayer = CALayer()
        shadowLayer!.backgroundColor = UIColor.blackColor().CGColor
        shadowLayer!.opacity = 0.5
        shadowLayer!.frame = centerViewController.view.frame
        centerViewController.view.layer.addSublayer(shadowLayer!)
    }
    
    func removeShadowFromCenterView() {
        
        if let layer = shadowLayer {
            layer.removeFromSuperlayer()
        }
    }
}
