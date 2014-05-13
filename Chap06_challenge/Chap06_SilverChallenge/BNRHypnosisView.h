//
//  BNRHypnonsisView.h
//  Chap03_Challenge
//
//  Created by Christian Ramir Lazain on 5/9/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRHypnonsisView : UIView

@property (strong, nonatomic) UIColor *circleColor;

- (UIColor*)randomizeColor:(int)i;
//- (void)setCircleColor:(UIColor *)circleColor;

@end
