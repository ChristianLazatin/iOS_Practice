//
//  MeetupManager.h
//  CoreLocation
//
//  Created by Christian Ramir Lazain on 5/21/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "MeetupManagerDelegate.h"
#import "MeetupCommunicatorDelegate.h"

@class MeetupCommunicator;

@interface MeetupManager : NSObject

@property (strong, nonatomic) MeetupCommunicator *communicator;
@property (strong, nonatomic) id<MeetupManagerDelegate> delegate;

- (void)fetchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end
