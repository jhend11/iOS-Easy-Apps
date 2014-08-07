//
//  STAGroupViewController.m
//  SimpleTasks
//
//  Created by JOSH HENDERSHOT on 7/30/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "STAGroupViewController.h"
#import "STAGroupsTableViewController.h"


@interface STAGroupViewController ()<UITextFieldDelegate>

@end

@implementation STAGroupViewController
{
    UITextField * search;
    
    UIButton * saveGroup;
    UIButton * cancel;


}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
        self.view.backgroundColor = [UIColor whiteColor];

        
        
        
 

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    
    
    
    search = [[UITextField alloc] initWithFrame:CGRectMake(20, 10,220, 45.0)];
    search.backgroundColor = [UIColor colorWithRed:1.000f green:1.000f blue:1.000f alpha:1.0f];
    search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    search.autocapitalizationType = UITextAutocorrectionTypeNo;
    search.placeholder = @" Add new group";
    search.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    search.leftView= paddingView;
    search.delegate = self;
    
    
    [self.view addSubview:search];
    
    
    saveGroup = [UIButton buttonWithType:UIButtonTypeCustom];
    saveGroup.frame = CGRectMake(60.0, 90, 80.0, 80);
    [saveGroup setBackgroundImage:[UIImage imageNamed:@"group_save.png"] forState:UIControlStateNormal];
    [saveGroup addTarget:self action:@selector(saveGroupButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    saveGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveGroup];
    
    cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(160.0, 90, 80.0, 80);
    [cancel setBackgroundImage:[UIImage imageNamed:@"group_close"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    cancel.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:cancel];
    
    UIView * fieldBar = [[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 1)];
    fieldBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldBar];
    
    [search becomeFirstResponder];


}

-(void)saveGroupButtonWasClicked
{
    
    [self.addNewGroups addObject:[@{
                                    @"name":search.text,
                                    @"items":[@[] mutableCopy]
                                    }mutableCopy]] ;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //could also use:
    
   //   [self cancelButtonWasClicked];

}
-(void)cancelButtonWasClicked
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
