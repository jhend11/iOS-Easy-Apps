//
//  ROMViewController.m
//  Letdown
//
//  Created by JOSH HENDERSHOT on 8/14/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "ROMViewController.h"
#import "AVFoundation/AVAudioPlayer.h"

@interface ROMViewController ()

@end

@implementation ROMViewController
{
    UIButton* button;
    UIButton* button1;
    UIButton* button2;
    UIButton* button3;

    NSString * answer;
    
    AVAudioPlayer *audioPlayer;
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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    button = [[UIButton alloc]initWithFrame:CGRectMake(260, 460, 40, 40)];
    button.backgroundColor = [UIColor redColor];
    button.layer.cornerRadius = 20;
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button1 = [[UIButton alloc]initWithFrame:CGRectMake(180, 460, 40, 40)];
    button1.backgroundColor = [UIColor redColor];
    button1.layer.cornerRadius = 20;
    [button1 addTarget:self action:@selector(buttonPressed1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 460, 40, 40)];
    button2.backgroundColor = [UIColor redColor];
    button2.layer.cornerRadius = 20;
    [button2 addTarget:self action:@selector(buttonPressed2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    button3 = [[UIButton alloc]initWithFrame:CGRectMake(20, 460, 40, 40)];
    button3.backgroundColor = [UIColor redColor];
    button3.layer.cornerRadius = 20;
    [button3 addTarget:self action:@selector(buttonPressed3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttonPressed
{
    
    NSString * file = [[NSBundle mainBundle] pathForResource:@"everything2" ofType:@"mp3"];
    
    NSData * fileData = [NSData dataWithContentsOfFile:file];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    [audioPlayer play];
    
}
-(void)buttonPressed1
{
    
}
-(void)buttonPressed2
{
    
}
-(void)buttonPressed3
{
    
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

@end
