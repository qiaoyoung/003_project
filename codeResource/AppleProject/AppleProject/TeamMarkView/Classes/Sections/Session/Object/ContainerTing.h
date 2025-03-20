// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionTableData.h
// Indicator
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "UserSessionConfigurateProtocol.h"
#import "UserSessionConfigurateProtocol.h"
//: #import "UserSessionPrivateProtocol.h"
#import "UserSessionPrivateProtocol.h"
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"

//: @interface CCCSessionDataSourceImpl : NSObject<NIMSessionDataSource>
@interface ContainerTing : NSObject<ContentOffSource>

//: - (instancetype)initWithSession:(NIMSession *)session
- (instancetype)initWithSize:(NIMSession *)session
                         //: config:(id<CCCSessionConfig>)sessionConfig;
                         frame:(id<FromConfig>)sessionConfig;

//: @end
@end
