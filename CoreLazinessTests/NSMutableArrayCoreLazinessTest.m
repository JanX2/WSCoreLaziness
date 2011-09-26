//
//  NSMutableArrayCoreLazinessTest.m
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArrayCoreLazinessTest.h"
#import "NSMutableArray+CoreLaziness.h"

@implementation NSMutableArrayCoreLazinessTest

- (void)setUp {
    [super setUp];
    
    _testArray = [[NSMutableArray alloc] init];
    [_testArray addObject:@"First object"];
    [_testArray addObject:@"Second object"];
}


- (void)testMapEachObjectInBlock {
    [_testArray wsMapEachObjectInBlock:(id)^(id object) {
        return [object stringByAppendingString:@"!"];
    }];
    
    STAssertTrue([[_testArray objectAtIndex:0] hasSuffix:@"!"], @"First object was not modified in block.");
    STAssertTrue([[_testArray objectAtIndex:1] hasSuffix:@"!"], @"Second object was not modified in block.");
}


- (void)tearDown {
    [_testArray release];
    [super tearDown];
}

@end
