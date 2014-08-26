//
//  IWAEditPhotoViewController.h
//  InstaWhat?
//
//  Created by JOSH HENDERSHOT on 8/25/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWAEditPhotoViewController : UIViewController
@property (nonatomic) UIImage *  editImage;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end
