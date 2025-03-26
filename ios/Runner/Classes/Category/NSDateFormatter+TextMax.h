// __DEBUG__
// __CLOSE_PRINT__
//
//  NSDateFormatter+KIDateFormatter.h
//  Kitalker
//
//  Created by chen on 12-8-23.
//
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSDateFormatter (KIAdditions)
@interface NSDateFormatter (TextMax)

//: + (NSString *)dateStringWithFormat:(NSString *)format date:(NSDate *)date;
+ (NSString *)publicationColor:(NSString *)format viewBy:(NSDate *)date;

//: - (NSString *)weekday:(NSDate *)date;
- (NSString *)tip:(NSDate *)date;

//: - (NSString *)day:(NSDate *)date;
- (NSString *)model:(NSDate *)date;

//: - (NSString *)month:(NSDate *)date;
- (NSString *)imageOrInput:(NSDate *)date;

//: - (NSString *)year:(NSDate *)date;
- (NSString *)solarDay:(NSDate *)date;

//: - (NSString *)dateStringWithFormat:(NSString *)format date:(NSDate *)date;
- (NSString *)showDate:(NSString *)format date:(NSDate *)date;

//: @end
@end