//
//  BNRItemStore.m
//  mvc
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
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

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

- (BNRItem *)createItem:(int)i
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data2" ofType:@"plist"]];
    
    BNRItem *item = [[BNRItem alloc] init];
    
    NSDictionary *dictionary = [array objectAtIndex:i];
    item.itemName       = [dictionary objectForKey:@"title"];
    item.serialNumber   = [dictionary objectForKey:@"description"];
    int p               = [[dictionary objectForKey:@"category"] integerValue];
    
    NSNumber *tmp = [[NSNumber alloc] initWithInt:p];
    item.valueInDollars = [tmp intValue];
    
    [self.privateItems addObject:item];
    return item;

}

- (void)removeItem:(BNRItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

@end
