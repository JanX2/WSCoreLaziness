//
//  CoreLaziness.h
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-25.
//  Copyright 2011 Walking Smarts. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WSIterationBlock)(id);

@interface NSArray (CoreLaziness)

- (void)wsEachObjectWithBlock:(WSIterationBlock)block;

@end
