//
//  FirstViewController.swift
//  Tokens
//
//  Created by JOSH HENDERSHOT on 10/1/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController {
    
    let API_URL = "https://api.foursquare.com/v2/"
    let CLIENT_ID = "C0XU1AR5ND045T5HYY0RWFE4113343ERVL2RSMWHPPCUAQXS"
    var token: String = "" {
        willSet(newToken) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func foursquareConnect(sender: AnyObject) {
        
        let AUTH_URL = "https://foursquare.com/oauth2/authenticate?client_id=" + CLIENT_ID + "&response_type=token&redirect_uri=tokens://tokens.com"
        
        UIApplication.sharedApplication().openURL(NSURL(string: AUTH_URL))
    }
    
    @IBAction func findLocations(sender: AnyObject) {
        foursquareRequest("venues/search", parameter: "near=Buckhead,GA") { (resultInfo) -> [AnyObject] in
            
            return resultInfo["response"]! as [AnyObject]
        }
    }
    
    @IBAction func findWaldo(sender: AnyObject) {
        foursquareRequest("users/search", parameter: "name=Waldo") { (resultInfo) -> [AnyObject] in
            
            return resultInfo["response"]!["results"]! as [AnyObject]

        }
    }
    
    
    func foursquareRequest(endpoint: String, parameter: String, completion: (resultInfo:[String:AnyObject]!) -> [AnyObject]) {
        
        var request = NSURLRequest(URL: NSURL(string: API_URL + endpoint + "?oauth_token=" + FS_TOKEN + "&v=20141001&" + parameter))
        
        println(request.URL.absoluteString)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            var resultInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as [String:AnyObject]
            
            println(resultInfo)
            
            completion(resultInfo: resultInfo)
            
            var fsTVC = self.storyboard!.instantiateViewControllerWithIdentifier("foursquareTVC") as FSTableViewController
            
            fsTVC.items = completion(resultInfo: resultInfo)
            
            self.presentViewController(fsTVC, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

