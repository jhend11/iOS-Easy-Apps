//
//  JokesApiRequest.swift
//  JokesOnU
//
//  Created by Heidi Proske on 10/7/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

import UIKit

let API_URL = "http://api.icndb.com/jokes/"

class JokesApiRequest: NSObject {
    
    override init() {
    }
    
    class func newJoke(endpoint: String, parameters: String, completion: ((joke: Joke) -> Void)?) {
        
        let urlString = API_URL + endpoint + "?" + parameters
        println("About to make request to \(urlString)")
        let request = NSURLRequest(URL: NSURL(string: urlString))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if error != nil {
                println(error.userInfo)
            }
            
            var jsonError: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as [String:AnyObject]
            
            //println("Got back JSON data \(json)")
            
            if let errorInfo = jsonError {
                println("Whoops, have an error when trying to serialize JSON \(errorInfo.userInfo)")
                return
            }
            
            if let jsonJoke = json["value"]! as? [String:AnyObject] {
                var newJoke = Joke()
                if let jokeHtml = jsonJoke["joke"] as? NSString {
                    var jokeText = jokeHtml.stringByReplacingOccurrencesOfString("&amp;", withString: "&")
                    println("Downloaded new joke \(jokeText)")
                    newJoke.jokeText = jokeHtml//.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                }
                
                if let jokeId = jsonJoke["id"] as? NSNumber {
                    println("Downloaded new joke with id \(jokeId)")
                    newJoke.id = jokeId
                }
                
                if let jokeCategories = jsonJoke["categories"]! as? [String] {
                    println("Downloaded new joke with categories \(jokeCategories)")
                    newJoke.categories = jokeCategories
                }
                
                if let c = completion {
                    c(joke: newJoke)
                }
                
            }
        }
    }
    
}
