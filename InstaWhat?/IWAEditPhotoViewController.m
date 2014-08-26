//
//  IWAEditPhotoViewController.m
//  InstaWhat?
//
//  Created by JOSH HENDERSHOT on 8/25/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "IWAEditPhotoViewController.h"
#import "IWAFilterViewController.h"
@interface IWAEditPhotoViewController ()

@end

@implementation IWAEditPhotoViewController
{
    UIImageView * imageView1;
    UITextField * postTextField;
   
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        self.view.backgroundColor = [UIColor whiteColor];
//        UIView * masterView = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        //      UIView * masterView = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        masterView.backgroundColor = [UIColor whiteColor];
//        [self.view addSubview:masterView];
//        
//        imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 320, 320)];
        //      UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-20, SCREEN_HEIGHT / 2)];
//        imageView1.backgroundColor = [UIColor lightGrayColor];
//        [self.view addSubview:imageView1];
//        
//        UIView * minorView = [[ UIView alloc] initWithFrame:CGRectMake(20, 420, 150, 304)];
        //        UIView * minorView = [[ UIView alloc] initWithFrame:CGRectMake(20, (SCREEN_HEIGHT / 2) + 20, SCREEN_WIDTH -40, (SCREEN_HEIGHT / 2) - 20)];
//        minorView.backgroundColor = [UIColor lightGrayColor];
//        [self.view addSubview:minorView];
        
        
//        postTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 440, 50, 200)];
        //        UITextField * postTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, (SCREEN_HEIGHT / 2) + 40, SCREEN_WIDTH - 80, (SCREEN_HEIGHT / 2) - 50)];
//        postTextField.backgroundColor = [UIColor whiteColor];
//        [self.view addSubview:postTextField];
        
//        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 460, 60, 60)];
//        //      UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(40, (SCREEN_HEIGHT / 2) - 50, SCREEN_WIDTH -80, (SCREEN_HEIGHT / 2) - 20)];
//        submitButton.backgroundColor = [UIColor orangeColor];
//        [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
//        [submitButton addTarget:self action:@selector(submitPost) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:submitButton];
        
        
        
        
    }
    return self;
}
-(void)setImageView2:(UIImageView *)imageView2
{
 self.imageView2.backgroundColor = [UIColor lightGrayColor];
}

-(void)setEditImage:(UIImage *)editImage
{
    _editImage = editImage;
    imageView1.image = editImage;
}
-(void)submitPost
{
    NSString * postInfo = [[NSString alloc]init];
    if (postTextField.text == nil) {
        NSLog(@"emptyString");
    } else {
        postInfo = postTextField.text;
        NSLog(@"%@", postInfo);
        
        postTextField.text = @"";
        [postTextField resignFirstResponder];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButtonPressed:(id)sender
{
    [self.textfield resignFirstResponder];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
