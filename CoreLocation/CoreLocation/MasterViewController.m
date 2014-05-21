//
//  MasterViewController.m
//  CoreLocation
//
//  Created by Christian Ramir Lazain on 5/21/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "MasterViewController.h"
#import "ItemCell.h"
#import "Group.h"
#import "MeetupManager.h"
#import "MeetupCommunicator.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MasterViewController () <MeetupManagerDelegate>
{
    NSArray *_groups;
    MeetupManager *_manager;
}

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Meetup";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"ItemCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ItemCell"];
    
    _manager = [[MeetupManager alloc] init];
    
    _manager.communicator = [[MeetupCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    
    _manager.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startFetchingGroups:)
                                                 name:@"kCLAuthorizationStatusAuthorized"
                                               object:nil];
}

- (void)didReceiveGroups:(NSArray *)groups
{
    _groups = groups;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    //[self.tableView reloadData];
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)startFetchingGroups:(NSNotification *)notification
{
    CLLocationDegrees latitude = 40.689223;
    CLLocationDegrees longitude = 74.044455;
    
    CLLocationCoordinate2D yourLocation = CLLocationCoordinate2DMake(latitude, longitude);
    [_manager fetchGroupsAtCoordinate:yourLocation];
    //[_manager fetchGroupsAtCoordinate:self.locationManager.location.coordinate];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"
                                    forIndexPath:indexPath];
    
    // Configure the cell...
    Group *group = _groups[indexPath.row];
    [cell.nameLabel setText:group.name];
    [cell.whoLabel setText:group.who];
    [cell.locationLabel setText:[NSString stringWithFormat:@"%@, %@", group.city, group.country]];
    [cell.descriptionLabel setText:group.description];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

@end
