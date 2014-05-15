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

+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end
