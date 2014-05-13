//
//  BNRItemStore.m
//  Chap08_Challenges
//
//  Created by Christian Ramir Lazain on 5/13/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore;
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}
// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}
// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (NSArray *)cheapItems
{
    NSMutableArray *tempCheap = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.privateItems count]; i++) {
        BNRItem *tmp = self.privateItems[i];
        if (tmp.valueInDollars <= 50) {
            [tempCheap addObject:tmp];
        }
    }
    return tempCheap;
}

- (NSArray *)expesiveItems
{
    NSMutableArray *tempCheap = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.privateItems count]; i++) {
        BNRItem *tmp = self.privateItems[i];
        if (tmp.valueInDollars > 50) {
            [tempCheap addObject:tmp];
        }
    }
    return tempCheap;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end
