//
//  BNRItem.m
//  mvc
//
//  Created by Christian Ramir Lazain on 4/28/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars];
    return descriptionString;
}

@end
