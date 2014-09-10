//
//  ViewController.swift
//  txt4u
//
//  Created by JOSH HENDERSHOT on 9/10/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var friend: PFUser!
    var conversation: [PFObject]!
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var formHolder: UIView!
    @IBOutlet weak var messageView: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        conversation = defaults.arrayForKey(friend.username) as [PFObject]?
        
        var messageQuery = PFQuery(className: "Message")
        messageQuery.whereKey("sender", equalTo: PFUser.currentUser())
        messageQuery.findObjectsInBackgroundWithBlock { (messages:[AnyObject]!, error:NSError!) -> Void in
            
            self.conversation = messages as [PFObject]
            
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMessage(sender: AnyObject) {
        
    }

}

