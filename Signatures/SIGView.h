//
//  SIGView.h
//  Signatures
//
//  Created by JOSH HENDERSHOT on 8/13/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIGView : UIView
@property (nonatomic) NSMutableArray * scribbles;
@property(nonatomic) NSMutableDictionary * currentScribble;
@property (nonatomic) UIColor * lineColor;
@property (nonatomic) int lineWidth;
@property (nonatomic) UIButton * lineButton;
@property (nonatomic) BOOL scribbleMode;

@end
