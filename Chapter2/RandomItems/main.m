//
//  main.m
//  RandomItems
//
//  Created by Christian Ramir Lazain on 4/28/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
       //Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        /*for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }*/
        
        //For container
        BNRItem *backpack = [[BNRItem alloc] init];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        for (id item in items) {
            NSLog(@"%@", item);
        }
        
        //Destroy the mutable array object
        NSLog(@"Setting items to nil..");
        items = nil;
    }
    return 0;
}

