//
//  SecondViewController.swift
//  Tokens
//
//  Created by JOSH HENDERSHOT on 10/1/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let API_URL = "https://api.instagram.com/v1/"
    let CLIENT_ID = "aae8e389ddcb4a348b263963f95639eb"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func instaConnect(sender: AnyObject) {
        
        let AUTH_URL = "https://instagram.com/oauth/authorize/?client_id=" + CLIENT_ID + "&redirect_uri=Rtokens://tokens.com&response_type=token"
        
        UIApplication.sharedApplication().openURL(NSURL(string: AUTH_URL))
    }
    @IBAction func myFeed(sender: AnyObject) {
        instaRequest("/users/self/feed", parameter: "count=5")
        
    }
    @IBAction func findWaldo(sender: AnyObject) {
        instaRequest("users/search", parameter: "q=waldo")
    }
    func instaRequest(endpoint: String, parameter: String) {
        
        var request = NSURLRequest(URL: NSURL(string: API_URL + endpoint + "?access_token=" + FS_TOKEN + "&" + parameter))
        
        println(request.URL.absoluteString)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            var resultInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as [String:AnyObject]
            println(resultInfo)
            
            var igTVC = self.storyboard!.instantiateViewControllerWithIdentifier("instaTVC") as InstaTableViewController
            igTVC.items = resultInfo["data"]! as [AnyObject]
            self.presentViewController(igTVC, animated: true, completion: nil)
        }
    }
    
    
    
}

