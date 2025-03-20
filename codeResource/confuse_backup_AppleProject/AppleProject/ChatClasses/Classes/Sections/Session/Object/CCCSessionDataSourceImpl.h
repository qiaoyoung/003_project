//
//  NIMSessionTableData.h
// AppleProjectKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCSessionConfigurateProtocol.h"
#import "CCCSessionPrivateProtocol.h"
#import "CCCSessionConfig.h"

@interface CCCSessionDataSourceImpl : NSObject<NIMSessionDataSource>

- (instancetype)initWithSession:(NIMSession *)session
                         config:(id<CCCSessionConfig>)sessionConfig;

@end
