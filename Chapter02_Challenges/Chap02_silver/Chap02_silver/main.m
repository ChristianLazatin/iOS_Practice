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
        
        //Uncomment to test the init with ItemName and SerialNumber
        //BNRItem *item = [[BNRItem alloc] initWithItemName:@"Pepsi" serialNumber:@"5H3L0"];
        //NSLog(@"%@",item);
        
        for (id item in items) {
            NSLog(@"%@", item);
        }
        
        //Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}

