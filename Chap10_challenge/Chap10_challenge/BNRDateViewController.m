//
//  BNRDateViewController.m
//  Chap10_challenge
//
//  Created by Christian Ramir Lazain on 5/14/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRDateViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@interface BNRDateViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRDateViewController

- (IBAction)changeDate:(id)sender
{
    BNRItem *item = self.item;
    item.dateCreated = self.datePicker.date;
    NSLog(@"Date Changed!");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%@",self.item);
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
