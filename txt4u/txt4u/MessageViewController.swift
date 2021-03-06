//
//  ViewController.swift
//  txt4u
//
//  Created by JOSH HENDERSHOT on 9/10/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

// remove lines in the tableview
// make two different bubble colors for messages per user
// have tableview automatically start scrolled to bottom
// show timestamp below message (created at in Parse hint hint)
//

class MessageViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var friend: PFUser! {
        willSet(user) {
            //            println("inside willset\(user)")
            
        }
        didSet(user) {
            //            println("inside didset\(user)")
            
        }
    }
    var conversation: [PFObject] = []
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var formHolder: UIView!
    @IBOutlet weak var messageView: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        messageView.delegate = self
        
        var nc = NSNotificationCenter.defaultCenter()
        nc.addObserverForName("newMessage", object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification:NSNotification!) -> Void in
            
            // update conversation and reload tableview
            var messageQuery = PFQuery(className: "Message")
            messageQuery.whereKey("receiver", equalTo: PFUser.currentUser())
            messageQuery.whereKey("sender", equalTo: self.friend)
            messageQuery.limit = 1
            messageQuery.orderByDescending("createdAt")
            
            //            messageQuery.whereKey("content", equalTo: notificaton)
            
            messageQuery.findObjectsInBackgroundWithBlock { (messages:[AnyObject]!, error:NSError!) -> Void in
                
                if messages.count > 0 {
                    self.conversation += messages as [PFObject]
                    
                    let indexPath = NSIndexPath(forRow: self.conversation.count - 1, inSection: 0)
                    
                    self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
                    self.tableView.reloadData()

                }
                
            }
            
        })
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //        conversation = defaults.arrayForKey(friend.username) as [PFObject]?
        var possibleRelations = [PFUser.currentUser().username + friend.username, friend.username + PFUser.currentUser().username]
        
        var messageQuery = PFQuery(className: "Message")
        messageQuery.whereKey("relation", containedIn: possibleRelations)
        messageQuery.orderByAscending("createdAt")
        messageQuery.findObjectsInBackgroundWithBlock { (messages:[AnyObject]!, error:NSError!) -> Void in
            
            if messages.count > 0 {
                self.conversation = messages as [PFObject]
                
                let indexPath = NSIndexPath(forRow: self.conversation.count - 1, inSection: 0)
                
                self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
                self.tableView.reloadData()

            }
            
        }
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        var type = UIView(frame: CGRectMake(0, 0, SCREEN_WIDTH, 10))
        
        formHolder.frame.origin.y = type.frame.size.height
        
        messageView.inputAccessoryView = type
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        formHolder.frame.origin.y = SCREEN_HEIGHT - 60
        self.sendMessage(textField)
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        
        messageView.resignFirstResponder()
        
        var message = PFObject(className: "Message")
        message["sender"] = PFUser.currentUser()
        message["receiver"] = friend
        message["content"] = messageView.text
        message["relation"] = PFUser.currentUser().username + friend.username
        message["read"] = false
        
        
        
        
        formHolder.frame.origin.y = SCREEN_HEIGHT - formHolder.frame.size.height
        
        
        conversation.append(message)
        message.saveInBackground()
        messageView.text = ""
        
        var deviceQuery = PFInstallation.query()
        deviceQuery.whereKey("user", equalTo:friend)
        
        
        var data = NSDictionary (objects: [self.messageView.text,self.friend,"Increment"], forKeys: ["alert","sender","badge"])
        
        var push = PFPush()
        push.setQuery(deviceQuery)
        push.setData(data)
        push.sendPushInBackground()
        tableView.reloadData()

        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as MessageCell
        
        cell.messageInfo = conversation[indexPath.row]
        
        
        return cell
    }
    
}

