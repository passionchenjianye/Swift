//
//  MapViewController.swift
//  FoodPin
//
//  Created by Tony on 12/24/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {
            placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if placemarks != nil && placemarks.count > 0  {
                let placemarks = placemarks[0] as CLPlacemark
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                annotation.coordinate = placemarks.location.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        })
    }
}
