//
//  AppDelegate.swift
//  Loweet
//
//  Created by JOSH HENDERSHOT on 9/15/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import Swifter
import Social
import Accounts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var swifter: Swifter!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (success:Bool, error:NSError!) -> Void in
            
            if success {
                let twitterAccounts = accountStore.accountsWithAccountType(accountType)
                println(twitterAccounts)
                
                for tAccount in twitterAccounts {
                    
                    let tA = tAccount as ACAccount
                    
                    println(tA.username) // Joalbright
                    println(tA.accountDescription) // @Joalbright
                    println(tA.identifier) // token
                    
                    
                }
                
//                let twitterAccount = twitterAccounts[0] as ACAccount
//                self.swifter = Swifter(account: twitterAccount)
//                
//                self.swifter.postStatusUpdate("I'm posting from an app I built with the new Swifter frameworks", inReplyToStatusID: nil, lat: nil, long: nil, placeID: nil, displayCoordinates: false, trimUser: true, success: { (status) -> Void in
//                    
//                    }, failure: { (error) -> Void in
//                        
//                })
                
                //                self.swifter.getStatusesHomeTimelineWithCount(5, sinceID: nil, maxID: nil, trimUser: true, contributorDetails: true, includeEntities: true, success: { (statuses) -> Void in
                //                    println(statuses)
                //
                //                }, failure: { (error) -> Void in
                //                    
                //                })
                
                
                
            }
            
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

