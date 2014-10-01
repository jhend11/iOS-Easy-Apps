//
//  InstaTableViewCell.swift
//  Tokens
//
//  Created by JOSH HENDERSHOT on 10/1/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit

class InstaTableViewCell: UITableViewCell {

    @IBOutlet weak var instaView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
