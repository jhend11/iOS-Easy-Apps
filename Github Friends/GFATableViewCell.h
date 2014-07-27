//
//  GFATableViewCell.h
//  Github Friends
//
//  Created by JOSH HENDERSHOT on 7/24/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UINavigationControllerDelegate;
@interface GFATableViewCell : UITableViewCell
@property (nonatomic) NSDictionary * friendInfo;
@property (nonatomic) UIWebView * url;
@property (retain, nonatomic) IBOutlet UIButton *profileArrow;
@property (nonatomic) UINavigationController * navigationController;
//@property (nonatomic, weak) id<UINavigationControllerDelegate> delegate;



@end
