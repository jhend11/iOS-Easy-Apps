//
//  GFAViewController2222222.m
//  Github Friends
//
//  Created by JOSH HENDERSHOT on 7/28/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "GFAViewController2222222.h"

@interface GFAViewController2222222 ()

@end

@implementation GFAViewController2222222



UIWebView * webView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        webView = [[UIWebView alloc]initWithFrame:self.view.frame];
        
        [self.view  addSubview:webView];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://gist.github.com/%@",self.friendInfo[@"login"]]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
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

@end
