/*
 * Copyright (c) 2011, Eimantas Vaiciunas
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the Walking Smarts nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL EIMANTAS VAICIUNAS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NSDictionaryWSCoreLazinessTest.h"
#import "NSDictionary+WSCoreLaziness.h"

@implementation NSDictionaryWSCoreLazinessTest

- (void)setUp {
    [super setUp];
    
    NSMutableDictionary *tmpDict = [NSMutableDictionary dictionary];
    [tmpDict setValue:@"A simple string" forKey:@"NSString"];
    [tmpDict setValue:@"42" forKey:@"NSStringInteger"];
    [tmpDict setValue:@"3.1415926" forKey:@"NSStringFloat"];
    [tmpDict setValue:@"Y" forKey:@"NSStringBool"];
    [tmpDict setValue:@42 forKey:@"Integer"];
    [tmpDict setValue:@3.1415926f forKey:@"Float"];
    [tmpDict setValue:@YES forKey:@"Bool"];
    [tmpDict setValue:[NSData dataWithBytes:"foobar" length:6] forKey:@"NSData"];
    
    _testDictionary = tmpDict;
    
    NSMutableArray *objects = [NSMutableArray arrayWithObjects:
                               @1,
                               @3,
                               @5,
                               @2,
                               nil];
    NSArray *keys = @[@"one", @"three", @"five", @"two"];
    
    _sortedDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}


- (void)testValuesSortedUsingDescriptors {
    NSMutableArray *objects = [NSMutableArray arrayWithArray:[_sortedDictionary allValues]];
    NSSortDescriptor *valueSD = [[NSSortDescriptor alloc] initWithKey:@"description" ascending:YES];
    [objects sortUsingDescriptors:@[valueSD]];
    
    NSArray *sortedValues = [_sortedDictionary ws_sortedValuesUsingDescriptors:@[valueSD]];
    
    STAssertEqualObjects(objects, sortedValues, @"The arrays are not equal: %@ vs %@", objects, sortedValues);
}


- (void)testKeysSortedUsingDescriptors {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"description" ascending:YES];
    NSArray *sortedKeys = [_sortedDictionary ws_sortedKeysUsingDescriptors:@[sortDescriptor]];
    [@[@"five", @"one", @"three", @"two"] isEqualToArray:sortedKeys];

}


- (void)testValuesWithMissingSelectors {
    STAssertTrue(0 == [_testDictionary ws_integerValueForKey:@"NSData"], @"Values were not equal (%d).", [_testDictionary ws_integerValueForKey:@"NSData"]);
    STAssertTrue(0.0f == [_testDictionary ws_floatValueForKey:@"NSData"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"NSData"]);
    STAssertTrue([[_testDictionary ws_stringValueForKey:@"NSData"] hasPrefix:@"<"], @"Values did not match (%@)", [_testDictionary ws_stringValueForKey:@"NSData"]);
}


- (void)testIntegerValueForKey {
    STAssertTrue(0 == [_testDictionary ws_integerValueForKey:@"NSString"], @"Values were not equal (%d).", [_testDictionary ws_integerValueForKey:@"NSString"]);
    STAssertTrue(42 == [_testDictionary ws_integerValueForKey:@"NSStringInteger"], @"Values were not equal (%d).", [_testDictionary ws_integerValueForKey:@"Integer"]);
    STAssertTrue(3 == [_testDictionary ws_integerValueForKey:@"NSStringFloat"], @"Values were not equal.", [_testDictionary ws_integerValueForKey:@"Float"]);
    STAssertTrue(42 == [_testDictionary ws_integerValueForKey:@"Integer"], @"Values were not equal (%d).", [_testDictionary ws_integerValueForKey:@"Integer"]);
    STAssertTrue(3 == [_testDictionary ws_integerValueForKey:@"Float"], @"Values were not equal.", [_testDictionary ws_integerValueForKey:@"Float"]);
    STAssertTrue(1 == [_testDictionary ws_integerValueForKey:@"Bool"], @"Values were not equal.", [_testDictionary ws_integerValueForKey:@"Bool"]);
}


- (void)testFloatValueForKey {
    STAssertTrue(0.0f == [_testDictionary ws_floatValueForKey:@"NSString"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"NSString"]);
    STAssertTrue(42.0f == [_testDictionary ws_floatValueForKey:@"NSStringInteger"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"Integer"]);
    STAssertTrue(3.1415926f == [_testDictionary ws_floatValueForKey:@"NSStringFloat"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"Float"]);
    STAssertTrue(42.0f == [_testDictionary ws_floatValueForKey:@"Integer"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"Integer"]);
    STAssertTrue(3.1415926f == [_testDictionary ws_floatValueForKey:@"Float"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"Float"]);
    STAssertTrue(1.0f == [_testDictionary ws_floatValueForKey:@"Bool"], @"Values were not equal (%f).", [_testDictionary ws_floatValueForKey:@"Bool"]);    
}


- (void)testStringValueForKey {
    STAssertEqualObjects(@"A simple string", [_testDictionary ws_stringValueForKey:@"NSString"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"NSString"]);
    STAssertEqualObjects(@"42", [_testDictionary ws_stringValueForKey:@"NSStringInteger"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"NSStringInteger"]);
    STAssertEqualObjects(@"3.1415926", [_testDictionary ws_stringValueForKey:@"NSStringFloat"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"NSStringFloat"]);
    STAssertEqualObjects(@"Y", [_testDictionary ws_stringValueForKey:@"NSStringBool"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"NSStringBool"]);
    STAssertEqualObjects(@"42", [_testDictionary ws_stringValueForKey:@"Integer"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"Integer"]);
    STAssertEqualObjects(@"3.141593", [_testDictionary ws_stringValueForKey:@"Float"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"Float"]);
    STAssertEqualObjects(@"1", [_testDictionary ws_stringValueForKey:@"Bool"], @"Strings were not equal (%@).", [_testDictionary ws_stringValueForKey:@"Bool"]);
}


- (void)tearDown {
    [super tearDown];
}

@end
