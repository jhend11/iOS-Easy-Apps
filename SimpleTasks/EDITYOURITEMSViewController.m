//
//  EDITYOURITEMSViewController.m
//  SimpleTasks
//
//  Created by JOSH HENDERSHOT on 8/1/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "EDITYOURITEMSViewController.h"

@interface EDITYOURITEMSViewController ()<UITextFieldDelegate>

@end

@implementation EDITYOURITEMSViewController
{
    UITextField * search;
    
    UIButton * saveGroup;
    UIButton * cancel;
    UISlider * slide;
    NSSet * allObjects;
    
    float priority;
}

//Homework :
//- be able to add new items to a group (use edititemviewcontroller)
//- save groups after a new item is added
//- delete items
//- move uitextfield on edititemviewcontroller based on priority drag (see screenshots below)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        self.view.backgroundColor = [UIColor colorWithRed:0.941f green:0.384f blue:0.125f alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
//    UITouch * touch = [touch allObjects][0];
//    CGPoint location = [touch locationInView:self.view];
    
    
//    priority = location.y / SCREEN_HEIGHT * 60;
//    
//    float priorityHue = priority/360;
    
//    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    
    
    slide = [[UISlider alloc]initWithFrame:CGRectMake(60, 200, 200, 400)];
//    slide.maximumValue = priority;

    [self->slide removeConstraints:self.view.constraints];
    self->slide.translatesAutoresizingMaskIntoConstraints = YES;
    self->slide.transform = CGAffineTransformMakeRotation(M_PI_2);

    [self.view addSubview:slide];
    
    
    
    
    search = [[UITextField alloc] initWithFrame:CGRectMake(20, 100,220, 45.0)];
    search.backgroundColor = [UIColor clearColor];
    search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    search.autocapitalizationType = UITextAutocorrectionTypeNo;
    
    UIColor *color = [UIColor whiteColor];
    search.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"Item"attributes:@{NSForegroundColorAttributeName:color}];
    
    search.textColor = [UIColor clearColor];
    search.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    search.leftView= paddingView;
    search.delegate = self;
    //    [search addTarget:self action:@selector(touches) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:search];
    
        
    
    
    
    UIView * fieldBar = [[UIView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH - 40, 1)];
    fieldBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:fieldBar];
    
    [search becomeFirstResponder];
    
    
}

-(void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    UITextField * itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    itemNameField.text = self.itemInfo[@"name"];
    itemNameField.delegate = self;
}

-(void)saveItemButtonWasClicked
{
    [self.items addObject:[@{
                             @"name":search.text,
                             @"priority":[NSNumber numberWithFloat:priority]
                             }mutableCopy]];
    
    self.itemInfo[@"name"] = search.text;
    self.itemInfo[@"name"] = @20;
    
    NSLog(@"save items");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //could also use:
    
    //   [self cancelButtonWasClicked];
    
}
-(void)cancelButtonWasClicked
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    self.itemInfo[@"name"] = textField.text;
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self changeColorWithTouches:touches];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeColorWithTouches:touches];
    
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)changeColorWithTouches:(NSSet*)touches
{
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self.view];
    
    
    priority = location.y / SCREEN_HEIGHT * 60;
    
    float priorityHue = priority/360;
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    
    NSLog(@"y = %f", priority);
}
//-(void)saveGroupData
//{
//    NSData * groupData = [NSKeyedArchiver archivedDataWithRootObject:self.itemInfo];
//
//    [groupData writeToFile:[self groupFilePath] atomically:YES];
//
//}
//-(NSMutableArray*)loadGroupData
//{
//    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
//}
//-(NSString*)groupFilePath
//{
//    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
//
//    NSString * path = documentDirectories[0];
//
//    return [path stringByAppendingString:@"items.data"];
//}
@end
