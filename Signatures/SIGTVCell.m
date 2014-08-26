//
//  SIGTVCell.m
//  Signatures
//
//  Created by JOSH HENDERSHOT on 8/13/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "SIGTVCell.h"

@implementation SIGTVCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
