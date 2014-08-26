//
//  STDYViewController.m
//  studyCards
//
//  Created by JOSH HENDERSHOT on 8/2/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "STDYViewController.h"
#import "STDYTableViewController.h"

@interface STDYViewController ()

@end

@implementation STDYViewController
{
    UIButton *study;
    UIButton *quiz;
    UIButton * testReview;
    UIButton * resumeQuiz;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel * headerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    
    headerView.backgroundColor = [UIColor colorWithRed:0.220f green:0.251f blue:0.278f alpha:1.0f];
    headerView.text = @"EA Part One";
    headerView.textColor = [UIColor colorWithRed:0.388f green:0.808f blue:0.514f alpha:1.0f];
    headerView.textAlignment = NSTextAlignmentCenter;
    headerView.font = [UIFont fontWithName:@"Copperplate-Bold" size:30];
    [self.view addSubview:headerView];

    [self.navigationController setNavigationBarHidden:YES];

    
    
    study = [UIButton buttonWithType:UIButtonTypeCustom];
    study.frame = CGRectMake(200.0, 120, 80.0, 80);
    [study setBackgroundImage:[UIImage imageNamed:@"placeholder_40x40"] forState:UIControlStateNormal];
    [study addTarget:self action:@selector(studyButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:study];
    
    
    quiz = [UIButton buttonWithType:UIButtonTypeCustom];
    quiz.frame = CGRectMake(60, 120, 80, 80);
    [quiz setBackgroundImage:[UIImage imageNamed:@"placeholder_40x40"] forState:UIControlStateNormal];
    [quiz addTarget:self action:@selector(quizButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quiz];
    
    testReview = [UIButton buttonWithType:UIButtonTypeCustom];
    testReview.frame = CGRectMake(60, 360, 80, 80);
    [testReview setBackgroundImage:[UIImage imageNamed:@"placeholder_40x40"] forState:UIControlStateNormal];
    [testReview addTarget:self action:@selector(testReviewButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testReview];
    
    resumeQuiz = [UIButton buttonWithType:UIButtonTypeCustom];
    resumeQuiz.frame = CGRectMake(200, 360, 80, 80);
    [resumeQuiz setBackgroundImage:[UIImage imageNamed:@"placeholder_40x40"] forState:UIControlStateNormal];
    [resumeQuiz addTarget:self action:@selector(resumeQuizButtonWasClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resumeQuiz];
    
    
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
}

-(void)studyButtonWasClicked
{
    STDYTableViewController * studyButton = [[STDYTableViewController alloc]init];
    studyButton.view.backgroundColor = [UIColor whiteColor];
    studyButton.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;


    [self.navigationController presentViewController:studyButton animated:YES completion:nil];
}

-(void)quizButtonWasClicked
{
    STDYTableViewController * studyButton = [[STDYTableViewController alloc]init];
    
    studyButton.view.backgroundColor = [UIColor whiteColor];
    studyButton.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self.navigationController presentViewController:studyButton animated:YES completion:nil];
}

-(void)testReviewButtonWasClicked
{
    STDYTableViewController * studyButton = [[STDYTableViewController alloc]init];
    studyButton.view.backgroundColor = [UIColor whiteColor];
    studyButton.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    NSLog(@"test review button was clicked");

    [self.navigationController presentViewController:studyButton animated:YES completion:nil];
}

-(void)resumeQuizButtonWasClicked
{
    STDYTableViewController * studyButton = [[STDYTableViewController alloc]init];
    studyButton.view.backgroundColor = [UIColor whiteColor];
    studyButton.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    NSLog(@"resume button was clicked");
    [self.navigationController presentViewController:studyButton animated:YES completion:nil];
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
-(BOOL)prefersStatusBarHidden
{
  return YES;
}

@end
