//
//  DetailViewController.m
//  mvc
//
//  Created by Christian Ramir Lazain on 5/19/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"
#import "LevelViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;

@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    NSLog(@"%@", self.item);
    self.navigationItem.title = @"Detail View";
    
    self.nameField.text = item.itemName;
    self.descriptionField.text = item.serialNumber;
    
    
    //Display the right category
    if(item.valueInDollars == 0)
        self.categoryField.text = @"Letter";
    if (item.valueInDollars == 1)
        self.categoryField.text = @"Color";
    if (item.valueInDollars == 2)
        self.categoryField.text = @"Food";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // Clear first responder
    [self.view endEditing:YES];
    // "Save" changes to item
    
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.descriptionField.text;
    item.valueInDollars = [self.categoryField.text intValue];
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
}

@end
