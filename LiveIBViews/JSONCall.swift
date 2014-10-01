//
//  JSONCall.swift
//  LiveIBViews
//
//  Created by JOSH HENDERSHOT on 9/26/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class JSONCall: NSObject,NSURLConnectionDelegate {
    
    lazy var data = NSMutableData()
    
   
    
    func startConnection(){
        let urlPath: String = "http://blockchain.info/stats?format=json"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
    }

}
