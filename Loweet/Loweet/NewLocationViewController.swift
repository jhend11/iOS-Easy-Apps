//
//  NewLocationViewController.swift
//  Loweet
//
//  Created by JOSH HENDERSHOT on 9/15/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class NewLocationViewController: UIViewController,CLLocationManagerDelegate {

    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    var currentCoordinate:CLLocationCoordinate2D!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
            locationManager.requestWhenInUseAuthorization()
//            CLLocationManager.locationServicesEnabled()
        }
    
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        

        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        for location in locations {
            
            currentCoordinate = (location as CLLocation).coordinate
            println(currentCoordinate.longitude)
        }
    }
    
    @IBAction func saveNewLocation() {
        
        LocationData.mainData().addLocation([
            "latitude" : self.currentCoordinate.latitude,
            "longitude" : self.currentCoordinate.longitude,
            "tweet" : self.tweetTextView.text
            ])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
