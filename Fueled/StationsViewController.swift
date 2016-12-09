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

class StationsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Chevron", "Arco", "Valero", "Chevron", "Valero"]
    let chevronPrices = [2.90 , 3.04 , 3.10]
    let arcoPrices = [2.20 , 2.40 , 2.50]
    let valeroPrices = [2.06 , 2.27 , 2.51]
    let chevron2Prices = [2.37 , 2.53 , 2.75]
    let valero2Prices = [3.01 , 3.17 , 3.33]
    
    //let dic: [String:list] = ["Chevron":chevron1Prices, "Arco", "Valero", "Chevron", "Valero"]
    
    @IBOutlet weak var stationsTable: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: "cell")
        
        var tablePrice = [0.0, 0.0, 0.0]
        
        switch list[indexPath.row] {
        case "Chevron":
            tablePrice = chevronPrices
        case "Arco":
            tablePrice = arcoPrices
        case "Valero":
            tablePrice = valeroPrices
        default:
            break
        }
        
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = String(format: "Reguler: %0.2f Super: %0.2f Premium: %0.2f", tablePrice[0], tablePrice[1], tablePrice[2])
        
        
        return(cell)
    }
    
    
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
        annotation.subtitle = "Regular: $2.90 - Midgrade: $3.04 - Premium: $3.10"
        
        mapView.addAnnotation(annotation)
        
        let location2 = CLLocationCoordinate2DMake(37.318691, -120.468867)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Arco"
        annotation2.subtitle = "Regular: $2.20 - Midgrade: $2.40 - Premium: $2.50"
        
        mapView.addAnnotation(annotation2)
        
        let location3 = CLLocationCoordinate2DMake(37.319533, -120.487246)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "Valero"
        annotation3.subtitle = "Regular: $2.06 - Midgrade: $2.27 - Premium: $2.51"
        
        mapView.addAnnotation(annotation3)
        
        let location4 = CLLocationCoordinate2DMake(37.319533, -120.487246)
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = location4
        annotation4.title = "Chevron"
        annotation4.subtitle = "Regular: $2.37 - Midgrade: $2.53 - Premium: $2.75"
        
        mapView.addAnnotation(annotation4)
        
        let location5 = CLLocationCoordinate2DMake(37.315549, -120.469056)
        
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = location5
        annotation5.title = "Valero"
        annotation5.subtitle = "Regular: $3.01 - Midgrade: $3.17 - Premium: $3.33"
        
        mapView.addAnnotation(annotation5)
        
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

