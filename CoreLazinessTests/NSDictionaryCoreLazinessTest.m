/**
 * Copyright (c) 2011, Eimantas Vaičiūnas
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the <organization> nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NSDictionaryCoreLazinessTest.h"
#import "NSDictionary+CoreLaziness.h"

@implementation NSDictionaryCoreLazinessTest

- (void)setUp {
    [super setUp];

    NSMutableDictionary *tmpDict = [NSMutableDictionary dictionary];
    [tmpDict setValue:@"A simple string" forKey:@"NSString"];
    [tmpDict setValue:@"42" forKey:@"NSStringInteger"];
    [tmpDict setValue:@"3.1415926" forKey:@"NSStringFloat"];
    [tmpDict setValue:@"Y" forKey:@"NSStringBool"];
    [tmpDict setValue:[NSNumber numberWithInteger:42] forKey:@"Integer"];
    [tmpDict setValue:[NSNumber numberWithFloat:3.1415926] forKey:@"Float"];
    [tmpDict setValue:[NSNumber numberWithBool:YES] forKey:@"Bool"];
    [tmpDict setValue:[NSData dataWithBytes:"foobar" length:6] forKey:@"NSData"];

    _testDictionary = [tmpDict retain];
}


- (void)testValuesWithMissingSelectors {
    STAssertTrue(0 == [_testDictionary integerValueForKey:@"NSData"], @"Values were not equal (%d).", [_testDictionary integerValueForKey:@"NSData"]);
    STAssertTrue(0.0f == [_testDictionary floatValueForKey:@"NSData"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"NSData"]);
    STAssertTrue([[_testDictionary stringValueForKey:@"NSData"] hasPrefix:@"<"], @"Values did not match (%@)", [_testDictionary stringValueForKey:@"NSData"]);
}


- (void)testIntegerValueForKey {
    STAssertTrue(0 == [_testDictionary integerValueForKey:@"NSString"], @"Values were not equal (%d).", [_testDictionary integerValueForKey:@"NSString"]);
    STAssertTrue(42 == [_testDictionary integerValueForKey:@"NSStringInteger"], @"Values were not equal (%d).", [_testDictionary integerValueForKey:@"Integer"]);
    STAssertTrue(3 == [_testDictionary integerValueForKey:@"NSStringFloat"], @"Values were not equal.", [_testDictionary integerValueForKey:@"Float"]);
    STAssertTrue(42 == [_testDictionary integerValueForKey:@"Integer"], @"Values were not equal (%d).", [_testDictionary integerValueForKey:@"Integer"]);
    STAssertTrue(3 == [_testDictionary integerValueForKey:@"Float"], @"Values were not equal.", [_testDictionary integerValueForKey:@"Float"]);
    STAssertTrue(1 == [_testDictionary integerValueForKey:@"Bool"], @"Values were not equal.", [_testDictionary integerValueForKey:@"Bool"]);
}


- (void)testFloatValueForKey {
    STAssertTrue(0.0f == [_testDictionary floatValueForKey:@"NSString"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"NSString"]);
    STAssertTrue(42.0f == [_testDictionary floatValueForKey:@"NSStringInteger"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"Integer"]);
    STAssertTrue(3.1415926f == [_testDictionary floatValueForKey:@"NSStringFloat"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"Float"]);
    STAssertTrue(42.0f == [_testDictionary floatValueForKey:@"Integer"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"Integer"]);
    STAssertTrue(3.1415926f == [_testDictionary floatValueForKey:@"Float"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"Float"]);
    STAssertTrue(1.0f == [_testDictionary floatValueForKey:@"Bool"], @"Values were not equal (%f).", [_testDictionary floatValueForKey:@"Bool"]);    
}


- (void)testStringValueForKey {
    STAssertEqualObjects(@"A simple string", [_testDictionary stringValueForKey:@"NSString"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"NSString"]);
    STAssertEqualObjects(@"42", [_testDictionary stringValueForKey:@"NSStringInteger"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"NSStringInteger"]);
    STAssertEqualObjects(@"3.1415926", [_testDictionary stringValueForKey:@"NSStringFloat"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"NSStringFloat"]);
    STAssertEqualObjects(@"Y", [_testDictionary stringValueForKey:@"NSStringBool"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"NSStringBool"]);
    STAssertEqualObjects(@"42", [_testDictionary stringValueForKey:@"Integer"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"Integer"]);
    STAssertEqualObjects(@"3.141593", [_testDictionary stringValueForKey:@"Float"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"Float"]);
    STAssertEqualObjects(@"1", [_testDictionary stringValueForKey:@"Bool"], @"Strings were not equal (%@).", [_testDictionary stringValueForKey:@"Bool"]);
}


- (void)tearDown {
    [super tearDown];
}

@end
