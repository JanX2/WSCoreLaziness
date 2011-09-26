//
//  CoreLaziness.h
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-25.
//  Copyright 2011 Walking Smarts. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WSIterationBlock)(id);
typedef void (^WSIndexedIterationBlock)(id, NSInteger);

@interface NSArray (CoreLaziness)

- (void)wsEachObjectInBlock:(WSIterationBlock)block;
- (void)wsEachObjectWithIndexInBlock:(WSIndexedIterationBlock)block;

@end
