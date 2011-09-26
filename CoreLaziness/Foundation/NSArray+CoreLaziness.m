//
//  CoreLaziness.m
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-25.
//  Copyright 2011 Walking Smarts. All rights reserved.
//

#import "NSArray+CoreLaziness.h"

@implementation NSArray (CoreLaziness)

- (void)wsEachObjectUsingBlock:(WSIterationBlock)block {
    for (id obj in self) {
        block(obj);
    }
}


- (void)wsEachObjectWithIndexUsingBlock:(WSIndexedIterationBlock)block {
    for (id obj in self) {
        block(obj, [self indexOfObject:obj]);
    }
}


- (id)wsSelectObjectUsingBlock:(WSSelectionBlock)block {
    for (id obj in self) {
        if (block(obj)) {
            return obj;
        }
    }
    return nil;
}

@end
