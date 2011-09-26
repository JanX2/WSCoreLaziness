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
typedef BOOL (^WSSelectionBlock)(id);

@interface NSArray (CoreLaziness)

- (void)wsEachObjectInBlock:(WSIterationBlock)block;
- (void)wsEachObjectWithIndexInBlock:(WSIndexedIterationBlock)block;
- (id)wsSelectObjectPassingBlock:(WSSelectionBlock)block;

@end
