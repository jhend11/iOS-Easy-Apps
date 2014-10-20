//
//  AppDelegate.swift
//  JokesOnU
//
//  Created by Heidi Proske on 10/7/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

import UIKit

let PARSE_APP_ID = "OVacPcDekaYvtIgrLk7dzrpJOH4IvfCTYNRmsEnL"
let PARSE_CLIENT_ID = "0EdbV7q6aZ3A5m4uEueTs9EIuO8JetoTM0GeNpfp"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        Parse.setApplicationId(PARSE_APP_ID, clientKey:PARSE_CLIENT_ID)
        
        PFUser.enableAutomaticUser() // without having to create a login
 
        
        return true
    }

}

