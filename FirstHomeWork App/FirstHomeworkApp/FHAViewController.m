//
//  FHAViewController.m
//  FirstHomeworkApp
//
//  Created by JOSH HENDERSHOT on 7/21/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "FHAViewController.h"

@interface FHAViewController ()

@end

@implementation FHAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)loginButtonClicked:(id)sender
{
    NSString * username = self.usernameTextField.text;
    
    NSLog(@"username = %@", username);
    
    NSString * password = self.passwordTextField.text;
    
    NSLog(@"password = %@", password);
    
    
    if ([self.usernameTextField.text isEqualToString:@"" ]&& [self.passwordTextField.text isEqualToString:@""])
    {
        UIAlertView * noFieldAlert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Please put a username & password in" delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
        [noFieldAlert show];
    }
    else if ([self.usernameTextField.text isEqualToString:@""])
    {
        UIAlertView * noUsernameAlert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Please put a username in" delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
    else if ([self.passwordTextField.text isEqualToString:@""])
    {
        UIAlertView * noPasswordAlert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Please put a password in" delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
        [noPasswordAlert show];
    }
    
}

- (IBAction)resetButtonWasClicked:(id)sender
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.passwordTextField.text = @"";
    self.usernameTextField.text =@"";
}

- (IBAction)colorButton1WasClicked:(id)sender
{
    self.view.backgroundColor = [UIColor purpleColor];

}

- (IBAction)colorButton2WasClicked:(id)sender
{
    self.view.backgroundColor = [UIColor yellowColor];
}

- (IBAction)colorButton3WasClicked:(id)sender
{
    self.view.backgroundColor = [UIColor redColor];
}


@end
