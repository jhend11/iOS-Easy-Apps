//
//  Marker.swift
//  Loweet
//
//  Created by JOSH HENDERSHOT on 9/15/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import MapKit

class Marker: NSObject, MKAnnotation {
    
    var hiddenCoordinate: CLLocationCoordinate2D!
    
    var coordinate: CLLocationCoordinate2D { get {return self.hiddenCoordinate}}
    
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        self.hiddenCoordinate = newCoordinate
    }
   
}
