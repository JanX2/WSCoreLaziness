#import "NSDictionary+CoreLaziness.h"

@implementation NSDictionary (CoreLaziness)

- (NSInteger)integerValueForKey:(NSString *)key {
    id obj = [self valueForKey:key];
    if ([obj respondsToSelector:@selector(integerValue)]) {
        return [obj integerValue];        
    } else {
        return 0;
    }
}


- (CGFloat)floatValueForKey:(NSString *)key {
    id obj = [self valueForKey:key];
    if ([obj respondsToSelector:@selector(floatValue)]) {
        return (CGFloat)[obj floatValue];
    } else {
        return 0.0f;
    }
}


- (NSString *)stringValueForKey:(NSString *)key {
    id obj = [self valueForKey:key];
    if ([obj respondsToSelector:@selector(strngValue)]) {
        return [obj stringValue];
    } else {
        return [obj description];
    }
}

@end
