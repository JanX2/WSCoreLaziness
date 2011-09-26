//
//  NSMutableArray+CoreLaziness.m
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+CoreLaziness.h"

#import "NSArray+CoreLaziness.h"

@implementation NSMutableArray (CoreLaziness)

- (id)wsMapEachObjectUsingBlock:(WSMappingBlock)block {
    NSMutableArray *copy = [[self copy] autorelease];
    [copy wsEachObjectUsingBlock:^(id object) {
        id newObject = block(object);
        [self replaceObjectAtIndex: [self indexOfObject:object]
                        withObject: newObject];
    }];
    return self;
}

@end
