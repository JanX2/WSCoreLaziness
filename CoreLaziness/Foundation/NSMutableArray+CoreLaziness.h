//
//  NSMutableArray+CoreLaziness.h
//  CoreLaziness
//
//  Created by Eimantas Vaičiūnas on 2011-09-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^WSMappingBlock)(id);

@interface NSMutableArray (CoreLaziness)

- (id)wsMapEachObjectInBlock:(WSMappingBlock)block;

@end
