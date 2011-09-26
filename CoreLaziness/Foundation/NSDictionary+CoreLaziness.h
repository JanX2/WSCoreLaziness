#import <Foundation/Foundation.h>

@interface NSDictionary (CoreLaziness)

- (NSInteger)integerValueForKey:(NSString *)key;
- (CGFloat)floatValueForKey:(NSString *)key;
- (NSString *)stringValueForKey:(NSString *)key;

@end
