//
//  WSNumberTests.m
//  WSCoreLaziness
//
//  Created by Eimantas Vaiciunas on 11/25/11.
//  Copyright (c) 2011 Victor Chandler Worldwide. All rights reserved.
//

#import "WSNumberTests.h"

#import "WSNumber.h"

@implementation WSNumberTests

- (void)testBoolNumber {
    NSNumber *number = WSBoolNumber(YES);
    assertThat(number, equalToBool(YES));
    assertThatChar(*([number objCType]), equalToChar('c'));
}


- (void)testCharNumber {
    NSNumber *number = WSCharNumber('a');
    assertThat(number, equalToChar(97));
    assertThatChar(*([number objCType]), equalToChar('c'));
}


- (void)testDoubleNumber {
    NSNumber *number = WSDoubleNumber(M_PI);
    assertThat(number, equalToDouble(M_PI));
    assertThatChar(*([number objCType]), equalToChar('d'));
}


- (void)testFloatNumber {
    NSNumber *number = WSFloatNumber(M_PI);
    assertThat(number, equalToFloat(M_PI));
    assertThatChar(*([number objCType]), equalToChar('f'));
}


- (void)testIntNumber {
    NSNumber *number = WSIntNumber(3);
    assertThat(number, equalToInt(3));
    assertThatChar(*([number objCType]), equalToChar('i'));
}


- (void)testIntegerNumber {
    NSNumber *number = WSIntegerNumber(3);
    assertThat(number, equalToInteger(3));
    assertThatChar(*([number objCType]), equalToChar('q'));
}


- (void)testLongNumber {
    NSNumber *number = WSLongNumber(2147483647);
    assertThat(number, equalToLong(2147483647));
    assertThatChar(*([number objCType]), equalToChar('q'));
}


- (void)testLongLongNumber {
    NSNumber *number = WSLongLongNumber(9223372036854775807);
    assertThat(number, equalToLongLong(9223372036854775807));
    assertThatChar(*([number objCType]), equalToChar('q'));
}


- (void)testShortNumber {
    NSNumber *number = WSShortNumber(32767);
    assertThat(number, equalToShort(32767));
    assertThatChar(*([number objCType]), equalToChar('s'));
}


- (void)testUnsignedCharNumber {
    NSNumber *number = WSUnsignedCharNumber(255);
    assertThat(number, equalToUnsignedChar(255));
    assertThatChar(*([number objCType]), equalToChar('s'));
}


- (void)testUnsignedIntNumber {
    NSNumber *number = WSUnsignedIntNumber(12345);
    assertThat(number, equalToUnsignedInt(12345));
    assertThatChar(*([number objCType]), equalToChar('q'));
}


- (void)testUnsignedIntegerNumber {
    NSNumber *number = WSUnsignedIntegerNumber(12345);
    assertThat(number, equalToUnsignedInteger(12345));
    assertThatChar(*([number objCType]), equalToChar('q'));
}


- (void)testUnsignedLongNumber {
    NSNumber *number = WSUnsignedIntegerNumber(4294967295);
    assertThat(number, equalToUnsignedInteger(4294967295));
    assertThatChar(*([number objCType]), equalToChar('q'));
}

@end
