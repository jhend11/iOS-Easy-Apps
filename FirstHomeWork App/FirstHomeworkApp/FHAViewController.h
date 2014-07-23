//
//  FHAViewController.h
//  FirstHomeworkApp
//
//  Created by JOSH HENDERSHOT on 7/21/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHAViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)loginButtonClicked:(id)sender;


- (IBAction)resetButtonWasClicked:(id)sender;

- (IBAction)colorButton1WasClicked:(id)sender;


- (IBAction)colorButton2WasClicked:(id)sender;


- (IBAction)colorButton3WasClicked:(id)sender;


@end
