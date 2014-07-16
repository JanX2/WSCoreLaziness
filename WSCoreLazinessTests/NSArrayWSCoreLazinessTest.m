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

#import "NSArrayWSCoreLazinessTest.h"
#import <OCMock/OCMock.h>
#import "NSArray+WSCoreLaziness.h"

@implementation NSArrayWSCoreLazinessTest

- (void)setUp {
    [super setUp];
    
    _testArray = [[NSArray alloc] initWithObjects:@"First object", @"Second object", [NSNumber numberWithInt:42], [NSNumber numberWithFloat:3.1415926f], nil];
}


- (void)testArrayIsEmpty {
    _testArray = [[NSArray alloc] init];
    STAssertTrue([_testArray ws_isEmpty], @"Array supposed to be empty, but it was not.");
    
    _testArray = [[NSArray alloc] initWithObjects:@"foo", nil];
    STAssertTrue(![_testArray ws_isEmpty], @"Array supposed to be non-empty, but it was.");
}


- (void)testIntegerValueAtIndex {
    NSInteger i1 = [_testArray ws_integerValueAtIndex:2];
    NSInteger i2 = [_testArray ws_integerValueAtIndex:3];  
    STAssertTrue(i1 == 42, @"Integers were not equal (%d != %d)", i1, 42);
    STAssertTrue(i2 == 3, @"Integers were not equal (%d != %d)", i2, 3);
}


- (void)testFloatValueAtIndex {
    CGFloat f1 = [_testArray ws_floatValueAtIndex:2];
    CGFloat f2 = [_testArray ws_floatValueAtIndex:3];
    STAssertTrue(f1 == 42.0f, @"Floats were not equal (%f != %f", f1, 42.0f);
    STAssertTrue(f2 == 3.1415926f, @"Floats were not equal (%f != %f)", f2, 3.1415926f);
}


- (void)testStringValueAtIndex {
    NSString *str1 = [_testArray ws_stringValueAtIndex:2];
    NSString *str2 = [_testArray ws_stringValueAtIndex:3];
    STAssertEqualObjects(str1, @"42", @"Strings were not equal (%@ != %@)", str1, @"42");
    STAssertEqualObjects(str2, @"3.141593", @"Strings were not equal (%@ != %@", str2, @"3.141593");
}


- (void)testEachIndexedObjectInBlock {
    [_testArray ws_enumerateObjectsWithIndexesUsingBlock:^(id object, NSInteger index) {
        STAssertTrue(index == [_testArray indexOfObject:object], @"Object's index did not match with index parameter");
    }];
}


- (void)testSelectObjectPassingBlockMatchingObject {
    id selectedObject = [_testArray ws_selectObjectUsingBlock:^(id object) {
        return [object hasPrefix:@"Second"];
    }];
    
    STAssertTrue([selectedObject isEqualToString:@"Second object"], @"Selected object did not match the condition");
}


- (void)testSelectObjectPassingBlockMissingObject {
    id selectedObject = [_testArray ws_selectObjectUsingBlock:^(id object) {
        return [[object description] hasPrefix:@"Foo"];
    }];
    
    STAssertNil(selectedObject, @"Selected object was not nil: %@", selectedObject);
}


- (void)tearDown {
    [super tearDown];
}

@end
