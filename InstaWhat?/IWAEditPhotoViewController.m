//
//  IWAEditPhotoViewController.m
//  InstaWhat?
//
//  Created by JOSH HENDERSHOT on 8/25/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "IWAEditPhotoViewController.h"
#import "IWAFilterViewController.h"
#import <Parse/Parse.h>
@interface IWAEditPhotoViewController ()<UITextViewDelegate>

@end

@implementation IWAEditPhotoViewController
{
    UIView * captionHolder;
    UIImageView * imageView1;
    UITextView * postTextField;
    UITextView * captionView;
   
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        
        captionHolder = [[UIView alloc]initWithFrame:CGRectMake(0,310,320,[UIScreen mainScreen].bounds.size.height - 310)];
        captionHolder.backgroundColor = [UIColor lightGrayColor];
        captionHolder.layer.borderWidth = 10;
        captionHolder.layer.borderColor = [UIColor whiteColor].CGColor;
        [self.view addSubview:captionHolder];
        
        captionView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, 280, captionHolder.frame.size.height - 70)];
        captionView.delegate = self;
        [captionHolder addSubview:captionView];
        
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(20, captionHolder.frame.size.height - 60, 280, 40)];
        submitButton.backgroundColor = [UIColor orangeColor];
        [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
        [submitButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [submitButton addTarget:self action:@selector(submitPost) forControlEvents:UIControlEventTouchUpInside];
        
        [captionHolder addSubview:submitButton];
        
        
        
    }
    return self;
}
-(void)textViewDidBeginEditing:(UITextView*)textView
{
    [UIView animateWithDuration: 0.2 animations:^{
        captionHolder.center = CGPointMake(captionHolder.center.x, captionHolder.center.y - 216);
    }];
}
-(void)setImageView2:(UIImageView *)imageView2
{
}

-(void)setEditImage:(UIImage *)editImage
{
    _editImage = editImage;
    imageView1.image = editImage;
}
-(void)submitPost
{
    PFObject * face = [PFObject objectWithClassName:@"Faces"];
    [face setObject:captionView.text forKey:@"text"];
    NSData * data = UIImagePNGRepresentation(imageView1.image);
    PFFile * file = [PFFile fileWithData:data];
    [face setObject:file forKey:@"image"];
    [face saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:@"faceSaved" object:nil];
    }];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
//    NSString * postInfo = [[NSString alloc]init];
//    if (postTextField.text == nil) {
//        NSLog(@"emptyString");
//    } else {
//        postInfo = postTextField.text;
//        NSLog(@"%@", postInfo);
//        
//        postTextField.text = @"";
//        [postTextField resignFirstResponder];
//    }
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
