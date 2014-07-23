//
//  MFCRootViewController.m
//  My First Code App
//
//  Created by JOSH HENDERSHOT on 7/22/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "MFCRootViewController.h"

@interface MFCRootViewController () <UITextFieldDelegate>

// declare private properties & methods


@end

@implementation MFCRootViewController
{
    UILabel * someLabel;
    
    
    
    UITextField *usernameField;
    UITextField *passwordField;
    UITextField *emailField;
    UITextField *phoneField;
    

    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSLog(@"init");
        
        self.view.backgroundColor = [UIColor greenColor];
    }
    return self;
}


    
-(void)dismissKeyboard {
    [passwordField resignFirstResponder];
    [usernameField resignFirstResponder];
    [phoneField resignFirstResponder];
    [emailField resignFirstResponder];
}

- (void)viewDidLoad
{
 
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;

    
    
    
    
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 30.0, screenWidth - 20.0, 50.0)];
    usernameField.backgroundColor = [UIColor whiteColor];
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameField.autocapitalizationType = UITextAutocorrectionTypeNo;
    usernameField.placeholder = @" username";
    usernameField.delegate = self;
    usernameField.font = [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:30];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    usernameField.leftView= paddingView;
    
    usernameField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:usernameField];
    
    
   
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 100, screenWidth - 20.0, 50.0)];
    passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.autocapitalizationType = UITextAutocorrectionTypeNo;
    passwordField.secureTextEntry = YES;
    passwordField.placeholder = @" password";
    passwordField.delegate = self;
    passwordField.font = [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:30];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    passwordField.leftView= paddingView;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:passwordField];
    
  
    emailField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 170, screenWidth - 20.0, 50.0)];
    emailField.backgroundColor = [UIColor whiteColor];
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailField.autocapitalizationType = UITextAutocorrectionTypeNo;
    emailField.placeholder = @" e-mizzle";
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    emailField.delegate = self;
    emailField.font = [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:30];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    emailField.leftView= paddingView;
    
    emailField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:emailField];
    
    phoneField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 240, screenWidth - 20.0, 50.0)];
    phoneField.backgroundColor = [UIColor whiteColor];
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    phoneField.autocapitalizationType = UITextAutocorrectionTypeNo;
    phoneField.placeholder = @" Phone #";
    phoneField.keyboardType = UIKeyboardTypePhonePad;
    phoneField.delegate = self;
    phoneField.font = [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:30];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    phoneField.leftView= paddingView;
    
    phoneField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:phoneField];
    
    

    
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake( 10.0, screenHeight- 60.0,screenWidth -  20.0, 50.0)];
    
    
    [loginButton setTitle: @"Login" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor blueColor];
    loginButton.layer.cornerRadius = 10.0;
    [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    loginButton.titleLabel.font = [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:30];

    [self.view addSubview:loginButton];
    
    UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake( 10.0, screenHeight- 120.0,screenWidth -  20.0, 50.0)];
    
    [resetButton setTitle: @"Reset" forState:UIControlStateNormal];
    resetButton.backgroundColor = [UIColor blueColor];
    resetButton.layer.cornerRadius = 10.0;
    [resetButton addTarget:self action:@selector(resetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    resetButton.titleLabel.font = [UIFont fontWithName:@"IowanOldStyle-BoldItalic" size:30];
    [self.view addSubview:resetButton];
  
    
    UIButton * blueButton = [[UIButton alloc] initWithFrame:CGRectMake(15.0, screenHeight - 240.0, 50.0, 50.0)];
    blueButton.backgroundColor = [UIColor blueColor];
    blueButton.layer.cornerRadius = 25.0;
    [blueButton addTarget:self action:@selector(blueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blueButton];
    
    UIButton * redButton = [[UIButton alloc] initWithFrame:CGRectMake(75.0, screenHeight - 240.0, 50.0, 50.0)];
    redButton.backgroundColor = [UIColor redColor];
    redButton.layer.cornerRadius = 25.0;
    [redButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    
    UIButton * yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(135.0, screenHeight - 240.0, 50.0, 50.0)];
    yellowButton.backgroundColor = [UIColor yellowColor];
    yellowButton.layer.cornerRadius = 25.0;
    [yellowButton addTarget:self action:@selector(yellowButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellowButton];
    
    UIButton * orangeButton = [[UIButton alloc] initWithFrame:CGRectMake(195.0, screenHeight - 240.0, 50.0, 50.0)];
    orangeButton.backgroundColor = [UIColor orangeColor];
    orangeButton.layer.cornerRadius = 25.0;
    [orangeButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orangeButton];
    
    UIButton * purpleButton = [[UIButton alloc] initWithFrame:CGRectMake(255.0, screenHeight - 240.0, 50.0, 50.0)];
    purpleButton.backgroundColor = [UIColor purpleColor];
    purpleButton.layer.cornerRadius = 25.0;
    [purpleButton addTarget:self action:@selector(purpleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:purpleButton];

    
    
    
    NSLog(@"view did load");
}


- (void)blueButtonClicked
{
    NSLog(@"blueButton was clicked");
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)redButtonClicked
{
    NSLog(@"redButton was clicked");
    self.view.backgroundColor = [UIColor redColor];
}

- (void)yellowButtonClicked
{
    NSLog(@"yellowButton was clicked");
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)orangeButtonClicked
{
    NSLog(@"orangeButton was clicked");
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)purpleButtonClicked
{
    NSLog(@"purpleButton was clicked");
    self.view.backgroundColor = [UIColor purpleColor];
}
- (void)resetButtonClicked
{
    NSLog(@"resetButton was clicked");
    self.view.backgroundColor = [UIColor greenColor];

    usernameField.text =@"";
    passwordField.text =@"";
    emailField.text =@"";
    phoneField.text =@"";
   
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Textfield should return");
    
    [textField resignFirstResponder];
    
    
    return YES;
}


- (void)loginButtonClicked
{
    NSLog(@"Button was clicked");
    
    NSArray * textFields = @[usernameField, passwordField, emailField, phoneField];
    
    UITextField* text1 = textFields[0];
    UITextField* text2 = textFields[1];
    UITextField* text3 = textFields[2];
    UITextField* text4 = textFields[3];
    
 /*
    if ([text1.text isEqualToString:@""]
        && [text2.text isEqualToString:@""]
        && [text3.text isEqualToString:@""]
        && [text4.text isEqualToString:@""])
    {
        UIAlertView * noFieldAlert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Please put a username, password, e-mizzle & phone #!" delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
        [noFieldAlert show];

    }
  */
    
    BOOL text1Empty = [text1.text isEqualToString:@""];
    BOOL text2Empty = [text2.text isEqualToString:@""];
    BOOL text3Empty = [text3.text isEqualToString:@""];
    BOOL text4Empty = [text4.text isEqualToString:@""];
    
    NSString* msg = nil;
    
    if (text1Empty)
    {
        
        msg = @"Please ensure all fields are filled in!";
    }
    else if (text2Empty)
    {
        msg = @"Uhoh text2 is empty!";

    }
    else if (text3Empty)
    {
        msg = @"Uhoh text3 is empty!";
    }
    else if (text4Empty)
    {
        msg = @"Uhoh text4 is empty!";
    }
    
    
    // Finally, IF there is an error, then our 'msg' variable will not be nil
    // so we must show the alert!
    if (msg)
    {
        UIAlertView * noFieldAlert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:msg delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
        [noFieldAlert show];
    }


}




//-----------------------------NOTES-------------------------------

+ (void)classMethod // can only be called on a class
{
    
}

- (void)instanceMethod // can only be called on a method
{
    
}

- (BOOL)cleanToilet: (NSString*)tool
{   //clean toilet
    //if toilet is clean
    return YES;
    //if toilet is not clean
    return NO;
}

-(void)doSomething
{
    [self cleanToilet:@"plunger"];
}
// -------------------------------NOTES-------------------------------

@end
