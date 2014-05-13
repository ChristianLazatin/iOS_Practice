//
//  BNRItemStore.h
//  Chap08_Challenges
//
//  Created by Christian Ramir Lazain on 5/13/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;
@property (nonatomic, readonly, copy) NSArray *cheapItems;
@property (nonatomic, readonly, copy) NSArray *expesiveItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
