//
//  MeetupManagerDelegate.h
//  CoreLocation
//
//  Created by Christian Ramir Lazain on 5/21/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupManagerDelegate <NSObject>

- (void)didReceiveGroups:(NSArray *)groups;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

@end
