//
//  TweetLocationTVC.swift
//  Loweet
//
//  Created by JOSH HENDERSHOT on 9/15/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class TweetLocationTVC: UITableViewCell {

    @IBOutlet weak var locationLabel: UIView!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func editTweetLocation(sender: AnyObject) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
