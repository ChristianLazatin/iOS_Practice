//
//  MainViewController.m
//  mvc
//
//  Created by Christian Ramir Lazain on 5/19/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "MainViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "LevelViewController.h"

@implementation MainViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"MVC";
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    //load plist into an array
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data2" ofType:@"plist"]];
    
    int biggestNumber = 0;
    
    for (NSDictionary *i in array) {
        if ([[i objectForKey:@"category"] integerValue] > biggestNumber) {
            biggestNumber = [[i objectForKey:@"category"] integerValue];
        }
    }
    return biggestNumber + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Letters";
    }
    if(indexPath.row == 1){
        cell.textLabel.text = @"Color";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"Food";
    }
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LevelViewController *detailViewController = [[LevelViewController alloc] init];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data2" ofType:@"plist"]];
    
    int index = indexPath.row;
        
    for (int i = 0; i < [array count]; i++) {
        NSDictionary *dict = [array objectAtIndex:i];
        if (index == [[dict objectForKey:@"category"] integerValue]) {
            [[BNRItemStore sharedStore] createItem:i];
        }
    }
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //remove the created item to clear the list
    if ([[[BNRItemStore sharedStore] allItems] count] >= 3) {
        for (int i = 0; i < [[[BNRItemStore sharedStore] allItems] count]; i++) {
            NSArray *items = [[BNRItemStore sharedStore] allItems];
            BNRItem *item = items[i];
            [[BNRItemStore sharedStore] removeItem:item];
        }
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[0];
        [[BNRItemStore sharedStore] removeItem:item];
    }
    
    [self.tableView reloadData];
}

@end
