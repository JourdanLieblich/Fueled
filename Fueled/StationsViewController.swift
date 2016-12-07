//
//  StationsViewController.swift
//  Fueled
//
//  Created by Jourdan Lieblich on 12/4/16.
//  Copyright © 2016 Jourdan Lieblich. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class StationsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate  = self
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        let home = CLLocationCoordinate2DMake(37.364807, -120.426507)
        
        let location = CLLocationCoordinate2DMake(37.331756, -120.468581)
        
        let span = MKCoordinateSpanMake(0.2, 0.2)
        
        let region = MKCoordinateRegion(center: home, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Chevron"
        
        
        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: - Location Delegate Methods
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("Errors: " + error.localizedDescription)
    }
    
}

