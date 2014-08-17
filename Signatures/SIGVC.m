//
//  SIGVC.m
//  Signatures
//
//  Created by JOSH HENDERSHOT on 8/13/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "SIGVC.h"
#import "SIGTVC.h"
#import "SIGView.h"

@interface SIGVC ()

@end

@implementation SIGVC
{
    UIButton * saveButton;
    UIButton * cancelButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.scribbles = [@[]mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    saveButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 290, 150, 100, 50)];
    saveButton.backgroundColor = [UIColor colorWithRed:0.165f green:0.992f blue:0.569f alpha:1.0f];
    [saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    saveButton.layer.cornerRadius = 15;
    [self.view addSubview:saveButton];
    
    cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 130, 150, 100, 50)];
    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton setTitle:@"CANCEL" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    cancelButton.layer.cornerRadius = 15;
    [self.view addSubview:cancelButton];
    
    SIGView * drawVC = [[SIGView alloc]init];
    drawVC.frame = CGRectMake(0, 0, 320, 140);
    drawVC.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:drawVC];
    
    SIGTVC * tVC = [[SIGTVC alloc]init];
    tVC.tableView.frame = CGRectMake(0, 200, 320, 368);
    [self.view addSubview:tVC.tableView];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)saveButtonClicked
{
 
}
-(void)cancelButtonClicked
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{ return YES;}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
