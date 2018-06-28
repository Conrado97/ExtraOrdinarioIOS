//
//  SOYELMAPA.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit
import MapKit

class SOYELMAPA: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var ELMAPA:MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ELMAPA.delegate = self
        ELMAPA.showsPointsOfInterest = true
        ELMAPA.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
        }
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations.first!
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500)
        ELMAPA.setRegion(coordinateRegion, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
