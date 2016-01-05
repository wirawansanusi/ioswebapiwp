//
//  Annotation.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/22/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MapKit
import Contacts
import AddressBook

class Annotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    func mapItem() -> MKMapItem {
        
        var addressDict: [String: String]?
        if #available(iOS 9.0, *) {
            addressDict = [CNPostalAddressStreetKey: subtitle!]
        } else {
            // Fallback on earlier versions
            addressDict = [String(kABPersonAddressStreetKey): subtitle!]
        }
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}