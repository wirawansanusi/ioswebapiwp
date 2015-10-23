//
//  ContactVC_Map.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/22/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit
import MapKit

extension ContactViewController: MKMapViewDelegate {
    
    func initMapLocation() {
        let initialLocation = CLLocation(latitude: -6.136808, longitude: 106.824064)
        centerMapOnLocation(initialLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 200
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        
        self.mapView.setRegion(coordinateRegion, animated: true)
        self.mapView.showsUserLocation = false
        addAnnotation()
    }
    
    func addAnnotation() {
        
        let locationAnnotation = Annotation(title: "AreaHP",
            locationName: "Mangga Dua Mall Lt.3 no.12B, Jl. Mangga Dua Raya, Jakarta Pusat",
            discipline: "Store",
            coordinate: CLLocationCoordinate2D(latitude: -6.136808, longitude: 106.824064))
        
        self.annotation = locationAnnotation
        self.mapView.addAnnotation(locationAnnotation)
        self.mapView.delegate = self
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? Annotation {
            let identifier = "pin"
            var view: MKAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
                
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
            }
            
            view.centerOffset = CGPoint(x: 0, y: -20)
            return view
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Annotation
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMapsWithLaunchOptions(launchOptions)
    }
}