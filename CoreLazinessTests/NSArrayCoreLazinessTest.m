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
    
    id firstMock = [OCMockObject mockForClass:[NSString class]];
    [[firstMock expect] length];
    id secondMock = [OCMockObject mockForClass:[NSData class]];
    [[secondMock expect] length];

    _testArray = [[NSArray alloc] initWithObjects:firstMock, secondMock, nil];
}

- (void)testEachObjectWithBlock {
    [_testArray wsEachObjectWithBlock:^(id object) {
        [object length];
    }];
    
    for (id object in _testArray) {
        [object verify];
    }
}

- (void)tearDown {
    [_testArray release];
    [super tearDown];
}

@end
