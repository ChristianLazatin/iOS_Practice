//
//  main.m
//  Chap02_silver
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
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        //Uncomment for the bug; asking for the 11th element of the 10 element array
        //[items objectAtIndex:11];
        
        for (id item in items) {
            NSLog(@"%@", item);
        }
        
        //Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}

