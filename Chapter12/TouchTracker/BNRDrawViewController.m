//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Christian Ramir Lazain on 5/5/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
