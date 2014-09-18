//
//  MapLocationsViewController.swift
//  Loweet
//
//  Created by JOSH HENDERSHOT on 9/15/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import MapKit

class MapLocationsViewController: UIViewController  {

    @IBOutlet weak var locationsMapView: MKMapView!
    
    var geo = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nc = NSNotificationCenter.defaultCenter()

        nc.addObserverForName("tweetLocationsUpdated", object: nil, queue: .mainQueue()) { (notification:NSNotification!) -> Void in
            
            self.markUpTheMap()
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func markUpTheMap() {
        
        self.locationsMapView.removeAnnotations(self.locationsMapView.annotations)
        
        for location in LocationData.mainData().tweetLocations {
            
            var marker = Marker()
            
            var coordinate = CLLocationCoordinate2D(latitude:location["latitude"]! as CLLocationDegrees, longitude: location["longitude"]! as CLLocationDegrees)
            
            marker.setCoordinate(coordinate)
            
            self.locationsMapView.addAnnotation(marker)
        }
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
