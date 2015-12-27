//
//  ContactVC_Annotation.swift
//  AreaHP
//
//  Created by wirawan sanusi on 12/14/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MapKit

extension ContactViewController {
    
    func addAnnotationForDirection() {
        
        let locationAnnotation = Annotation(title: "AreaHP",
            locationName: "Mangga Dua Mall Lt.3 no.12B, Jl. Mangga Dua Raya, Jakarta Pusat",
            discipline: "Store",
            coordinate: CLLocationCoordinate2D(latitude: -6.136808, longitude: 106.824064))
        
        self.annotation = locationAnnotation
    }
}
