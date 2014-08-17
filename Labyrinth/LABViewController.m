//
//  LABViewController.m
//  Labyrinth
//
//  Created by JOSH HENDERSHOT on 8/14/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "LABViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "LABGraphView.h"

@interface LABViewController ()

@end

@implementation LABViewController
{
    CMMotionManager * motionManager;
    UIDynamicAnimator * animator;
    UIGravityBehavior * gravityBehavior;
    UICollisionBehavior * collisionBehavior;
    UIDynamicItemBehavior * wallBehavior;
    UIDynamicItemBehavior * wallBehavior2;
    UIDynamicItemBehavior * wallBehavior3;
    UIDynamicItemBehavior * wallBehavior4;

    

    
    float xRotation;
    float yRotation;
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
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    gravityBehavior = [[UIGravityBehavior alloc]init];
    [animator addBehavior:gravityBehavior];
    
    collisionBehavior = [[UICollisionBehavior alloc]init];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    
    wallBehavior = [[UIDynamicItemBehavior alloc]init];
    wallBehavior.density = 10000000;
    [animator addBehavior:wallBehavior];
    
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
    
    UIView * ball = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    ball.center = self.view.center;
    ball.layer.cornerRadius = 20;
    ball.layer.borderWidth = 1;
    ball.backgroundColor = [UIColor redColor];
    [self.view addSubview:ball];
    [gravityBehavior addItem:ball];
    [collisionBehavior addItem:ball];
    
    
    UIView * wall = [[UIView alloc]initWithFrame:CGRectMake(20, 0, 50, 200)];
    wall.backgroundColor = [UIColor lightGrayColor];
    wall.layer.cornerRadius = 20;
    wall.layer.borderWidth = 1;
    [self.view addSubview:wall];
    [wallBehavior addItem:wall];
    [collisionBehavior addItem:wall];
    
    UIView * wall2 = [[UIView alloc]initWithFrame:CGRectMake(120, 160, 40, 140)];
    wall2.layer.cornerRadius = 20;
    wall2.layer.borderWidth = 1;
    wall2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:wall2];
    [wallBehavior addItem:wall2];
    [collisionBehavior addItem:wall2];


    
    UIView * wall3 = [[UIView alloc]initWithFrame:CGRectMake(440, 0, 40, 170)];
    wall3.layer.cornerRadius = 20;
    wall3.layer.borderWidth = 1;
    wall3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:wall3];
    [wallBehavior addItem:wall3];
    [collisionBehavior addItem:wall3];


    
    UIView * wall4 = [[UIView alloc]initWithFrame:CGRectMake(220, 0, 60, 200)];
    wall4.layer.cornerRadius = 20;
    wall4.layer.borderWidth = 1;
    wall4.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:wall4];
    [wallBehavior addItem:wall4];
    [collisionBehavior addItem:wall4];


    
    UIView * wall5 = [[UIView alloc]initWithFrame:CGRectMake(340, 180, 40, 150)];
    wall5.layer.cornerRadius = 20;
    wall5.layer.borderWidth = 1;
    wall5.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:wall5];
    [wallBehavior addItem:wall5];
    [collisionBehavior addItem:wall5];

    UIView * wall6 = [[UIView alloc]initWithFrame:CGRectMake(495, 0, 50, 50)];
    wall6.backgroundColor = [UIColor lightGrayColor];
    wall6.layer.cornerRadius = 25;
    wall6.layer.borderWidth = 1;
    [self.view addSubview:wall6];
    [wallBehavior addItem:wall6];
    [collisionBehavior addItem:wall6];

    
//    LABGraphView * graphView = [[LABGraphView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
//    [self.view addSubview:graphView];
    
    motionManager = [[CMMotionManager alloc]init];
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        NSLog(@"x %f y %f z %f", motion.rotationRate.x, motion.rotationRate.y,motion.rotationRate.z);
        
        
        xRotation -= motion.rotationRate.x / 30;
        yRotation += motion.rotationRate.y / 30;
        [self updateGravity];
//        if (graphView.xPlots.count > self.view.frame.size.height / 10)
//        {
//            [graphView.xPlots removeObjectAtIndex:0];
//        }
//        
//        [graphView.xPlots addObject:@(motion.rotationRate.x * 200)];
//        [graphView setNeedsDisplay];
    }];
    
}
-(void)updateGravity
{
    gravityBehavior.gravityDirection = CGVectorMake(xRotation, yRotation);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    xRotation = yRotation = 0;
    [self updateGravity];
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
-(BOOL)prefersStatusBarHidden{return YES;}
@end
