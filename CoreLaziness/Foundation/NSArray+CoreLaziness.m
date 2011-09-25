//
//  CoreLaziness.m
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-25.
//  Copyright 2011 Walking Smarts. All rights reserved.
//

#import "NSArray+CoreLaziness.h"

@implementation NSArray (CoreLaziness)

- (void)wsEachObjectWithBlock:(WSIterationBlock)block {
    for (id obj in self) {
        block(obj);
    }
}

@end
