//
//  TLANewTweetVC.h
//  Tweet Like
//
//  Created by JOSH HENDERSHOT on 8/11/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLANewTweetVC : UIViewController
@property (nonatomic)NSMutableArray * tweets;

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
- (IBAction)saveTweet:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *tweetCancel;
@property (weak, nonatomic) IBOutlet UIView * tweetConfirm;
@property (weak, nonatomic) IBOutlet UIImageView *swipeButton;

@end
