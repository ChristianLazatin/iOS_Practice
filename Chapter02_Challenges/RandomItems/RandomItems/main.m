//
//  main.m
//  RandomItems
//
//  Created by Christian Ramir Lazain on 4/28/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //This program adds a container for the items
        
        //Initialize a container which is a subclass of item
        BNRContainer *plasticBag = [BNRContainer randomItem];
        plasticBag.bag = [[NSMutableArray alloc] init];
    
        //Put the new items to the container
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [plasticBag.bag addObject:item];
        }
        
        //Display the items on the container
        for (BNRItem *i in plasticBag.bag){
            NSLog(@"%@", i);
        }
        
        //Clean up
        plasticBag.bag = nil;
        
    }
    return 0;
}

