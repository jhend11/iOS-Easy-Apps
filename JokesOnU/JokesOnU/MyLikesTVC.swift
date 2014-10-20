//
//  MyLikesTVC.swift
//  JokesOnU
//
//  Created by JOSH HENDERSHOT on 10/9/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

import UIKit

class MyLikesTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    var query = PFQuery(className: "Activity")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.whereKey("type", equalTo:"like")
        query.includeKey("jokes") // use this to pull the actual data behind the pointer!!
        query.findObjectsInBackgroundWithBlock { (activities, error) -> Void in
            if error != nil {
                println(error.userInfo)

            }
            for activity in activities {
                let jokeValue = activity["jokes"] as PFObject
                let jokeText = jokeValue["text"]
                println(jokeText)
            }
        }
//        query.countObjectsInBackgroundWithBlock { (number, error) -> Void in
//            
//            if error != nil {
//                println(error.userInfo)
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("likesCell", forIndexPath: indexPath) as UITableViewCell


        return cell
    }


}
