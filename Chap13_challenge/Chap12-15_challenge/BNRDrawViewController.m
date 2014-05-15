//
//  BNRDrawViewController.m
//  Chap12-15_challenge
//
//  Created by Christian Ramir Lazain on 5/15/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController ()

@end

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
