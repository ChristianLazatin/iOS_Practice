//
//  BNRItemViewController.m
//  Chap08_Challenges
//
//  Created by Christian Ramir Lazain on 5/12/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRItemViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
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
    //return [[[BNRItemStore sharedStore] allItems] count];
    if (section == 0) {
        return [[[BNRItemStore sharedStore] cheapItems] count];
    } else {
        return [[[BNRItemStore sharedStore] expesiveItems] count] + 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                    forIndexPath:indexPath];
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    
    //NSArray *cheapItems = [[BNRItemStore sharedStore] cheapItems];
    //BNRItem *item = cheapItems[indexPath.row];
    
    if (indexPath.row == [[[BNRItemStore sharedStore] expesiveItems] count] && indexPath.section == 1) {
        cell.textLabel.text = @"No more items";
        return cell;
    }
    
    //This is the Bronze Challenge: segregate the <50 items from the >50 items
    if (indexPath.section == 0) {
        //Gold Challenge: Change font size
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 20.0 ];
        cell.textLabel.font  = myFont;
        NSArray *cheapItems = [[BNRItemStore sharedStore] cheapItems];
        BNRItem *item = cheapItems[indexPath.row];
        cell.textLabel.text = [item description];
        return cell;
    }
    
    if (indexPath.section == 1) {
        //Gold Challenge: Change font size
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 20.0 ];
        cell.textLabel.font  = myFont;
        NSArray *expensiveItems = [[BNRItemStore sharedStore] expesiveItems];
        BNRItem *item = expensiveItems[indexPath.row];
        cell.textLabel.text = [item description];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2 ;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Cheap Items";

        return @"Expensive Items";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Gold Challenge: Change the row height
    if (indexPath.row != [[[BNRItemStore sharedStore] expesiveItems] count]) {
        return 44;
    }
    return 60;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    //Gold Challenge: Display the image
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    logo.backgroundColor = [UIColor clearColor];
    logo.opaque = NO;
    logo.image = [UIImage imageNamed:@"logo.png"];
    self.tableView.backgroundView = logo;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
}

@end
