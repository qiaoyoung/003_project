// __DEBUG__
// __CLOSE_PRINT__
//
//  UserExtensionHelper.h
// Indicator
//
//  Created by amao on 4/25/16.
//  Copyright © 2016 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSString (NIMKitExtension)
@interface NSString (DisableLineExtension)
//: - (NSDictionary *)nimkit_jsonDict;
- (NSDictionary *)last;
//: @end
@end


//: @interface NSDictionary (NIMKitExtension)
@interface NSDictionary (DisableLineExtension)
//: - (NSString *)nimkit_jsonString;
- (NSString *)tingName;
//: @end
@end
