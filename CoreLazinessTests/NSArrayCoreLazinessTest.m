//
//  NSArray.m
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSArrayCoreLazinessTest.h"
#import <OCMock/OCMock.h>
#import "NSArray+CoreLaziness.h"

@implementation NSArrayCoreLazinessTest

- (void)setUp {
    [super setUp];

    _testArray = [[NSArray alloc] initWithObjects:@"First object", @"Second object", nil];
}


- (void)testEachObjectInBlock {
    [_testArray wsEachObjectInBlock:^(id object) {
        STAssertTrue([_testArray containsObject:object], @"Array did not contain passed object: %@", object);
    }];
}


- (void)testEachIndexedObjectInBlock {
    [_testArray wsEachObjectWithIndexInBlock:^(id object, NSInteger index) {
        STAssertTrue(index == [_testArray indexOfObject:object], @"Object's index did not match with index parameter");
    }];
}


- (void)tearDown {
    [_testArray release];
    [super tearDown];
}

@end
