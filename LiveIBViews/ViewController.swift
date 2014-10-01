//
//  ViewController.swift
//  LiveIBViews
//
//  Created by JOSH HENDERSHOT on 9/26/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {
    
    lazy var data = NSMutableData()
    var json: JSONCall!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        json?.startConnection()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       println(json?.data)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
