//
//  TLAViewTweetController.h
//  Tweet Like
//
//  Created by JOSH HENDERSHOT on 8/14/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLAViewTweetController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *viewTweetTextBox;
@property (nonatomic) NSDictionary * tweet;


@property(nonatomic)NSString * aString;
@end
