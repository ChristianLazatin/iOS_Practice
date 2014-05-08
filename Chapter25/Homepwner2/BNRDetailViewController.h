//
//  BNRAppDelegate.m
//  Homepwner
//
//  Created by Christian Ramir Lazain on 5/2/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController <UIViewControllerRestoration>

@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);

- (instancetype)initForNewItem:(BOOL)isNew;

@end
