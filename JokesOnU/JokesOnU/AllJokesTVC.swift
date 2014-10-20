//
//  AllJokesTVC.swift
//  JokesOnU
//
//  Created by Heidi Proske on 10/7/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

import UIKit

class AllJokesTVC: UITableViewController {
    
    var jokesArray: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor.magentaColor()
        
        self.refreshData()
        
        NSNotificationCenter.defaultCenter().addObserverForName("jokeSaved", object: nil, queue: NSOperationQueue.mainQueue()) { (notification: NSNotification!) -> Void in
            self.refreshData()
        }
    }
    
    func refreshData() {
        
        var query = PFQuery(className: "Jokes")
        //        query.whereKey("owner", equalTo: PFUser.currentUser())
        query.orderByAscending("text")
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if (error != nil) {
                print("error \(error.userInfo)")
            }
            // Implicit use of 'self' in closure; use 'self.' to make capture semantics explicit
            print("Previously we had \(self.jokesArray.count) jokes");
            
            self.jokesArray = objects as [PFObject]
            print("Now we have \(self.jokesArray.count) jokes");
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("jokeCell", forIndexPath: indexPath) as JokeCell
        cell.selectionStyle = .None
        let joke = jokesArray[indexPath.row] as PFObject
        cell.jokeLabel?.text = joke["text"] as? String
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("someone clicked joke # \(indexPath.row):\(jokesArray[indexPath.row])")
        
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor.greenColor()
        likesJoke(indexPath.row)
    }
    
    func likesJoke(arrayIndex: Int) {
        updateActivity("like", arrayIndex: arrayIndex)
    }
    
    func hatesJoke(arrayIndex: Int) {
        updateActivity("hate", arrayIndex: arrayIndex)
    }
    
    private func updateActivity(activityType: String, arrayIndex: Int) {
        
        let activityObj = PFObject(className: "Activity")
        activityObj.setObject(activityType, forKey: "type")
        activityObj.setObject(PFUser.currentUser(), forKey: "user")
        activityObj.setObject(jokesArray[arrayIndex], forKey: "jokes")
        activityObj.saveInBackground()
    }
}
