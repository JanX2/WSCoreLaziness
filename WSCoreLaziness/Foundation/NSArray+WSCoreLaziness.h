/**
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

#import <Foundation/Foundation.h>

typedef void (^WSIterationBlock)(id);
typedef void (^WSIndexedIterationBlock)(id, NSInteger);
typedef BOOL (^WSSelectionBlock)(id);

@interface NSArray (WSCoreLaziness)

- (void)ws_eachObjectUsingBlock:(WSIterationBlock)block;
- (void)ws_eachObjectWithIndexUsingBlock:(WSIndexedIterationBlock)block;
- (id)ws_selectObjectUsingBlock:(WSSelectionBlock)block;

- (NSInteger)ws_integerValueAtIndex:(NSInteger)integer;
- (CGFloat)ws_floatValueAtIndex:(NSInteger)integer;
- (NSString *)ws_stringValueAtIndex:(NSInteger)integer;

@end
