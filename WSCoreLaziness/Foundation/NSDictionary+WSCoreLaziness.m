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

#import "NSDictionary+WSCoreLaziness.h"

@implementation NSDictionary (WSCoreLaziness)

- (void)ws_enumerateKeysAndValuesUsingBlock:(void (^)(NSString *, id))block {
    for (NSString *key in self) {
        block(key, [self valueForKey:key]);
    }
}


- (NSArray *)ws_sortedKeysUsingDescriptors:(NSArray *)sortDescriptors {
    NSMutableArray *keys = [NSMutableArray arrayWithArray:[self allKeys]];
    [keys sortUsingDescriptors:sortDescriptors];
    return [NSArray arrayWithArray:keys];
}


- (NSArray *)ws_sortedValuesUsingDescriptors:(NSArray *)sortDescriptors {
    NSMutableArray *values = [NSMutableArray arrayWithArray:[self allValues]];
    [values sortUsingDescriptors:sortDescriptors];
    return [NSArray arrayWithArray:values];
}


- (NSInteger)ws_integerValueForKey:(NSString *)key {
    id obj = [self valueForKey:key];
    if ([obj respondsToSelector:@selector(integerValue)]) {
        return [obj integerValue];        
    } else {
        return 0;
    }
}


- (CGFloat)ws_floatValueForKey:(NSString *)key {
    id obj = [self valueForKey:key];
    if ([obj respondsToSelector:@selector(floatValue)]) {
        return (CGFloat)[obj floatValue];
    } else {
        return 0.0f;
    }
}


- (NSString *)ws_stringValueForKey:(NSString *)key {
    id obj = [self valueForKey:key];
    if ([obj respondsToSelector:@selector(strngValue)]) {
        return [obj stringValue];
    } else {
        return [obj description];
    }
}

@end
