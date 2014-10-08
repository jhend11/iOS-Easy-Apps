//
//  AppDelegate.swift
//  JokesOnU
//
//  Created by Heidi Proske on 10/7/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

import UIKit

let PARSE_APP_ID = "ZZeIo4aXvQCbv0k5S4ukcoXC3gh10ky6M7rET6Gl"
let PARSE_CLIENT_ID = "ICAMb93iGqrZkEcpY3CXjJemyHQbOx9IZGaxuJbF"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        Parse.setApplicationId(PARSE_APP_ID, clientKey:PARSE_CLIENT_ID)
        
        PFUser.enableAutomaticUser() // without having to create a login
 
        
        return true
    }

}

