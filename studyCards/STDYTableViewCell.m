//
//  STDYTableViewCell.m
//  studyCards
//
//  Created by JOSH HENDERSHOT on 8/2/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "STDYTableViewCell.h"

@implementation STDYTableViewCell
{
    UIButton * checkboxButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        checkboxButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 10,40, 40.0)];
        [checkboxButton setImage:[UIImage imageNamed:@"checkBox"] forState:UIControlStateNormal];

        [self addSubview:checkboxButton];
        
    }
    return self;
}

- (void)checkBox
    {
        
    if (!_checkbox) {
        [checkboxButton setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        _checkbox = YES;
    }
    
    else if (_checkbox) {
        [checkboxButton setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        _checkbox = NO;
    }
    
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
