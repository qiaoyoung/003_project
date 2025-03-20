// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionLayout.h
// Indicator
//
//  Created by chris on 2016/11/8.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionConfigurator.h"
#import "MessageDoingIcon.h"
//: #import "UserSessionPrivateProtocol.h"
#import "UserSessionPrivateProtocol.h"

//: @interface CCCSessionLayoutImpl : NSObject<NIMSessionLayout>
@interface InformationImpl : NSObject<ShouldLayout>

//: @property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITableView *tableView;

//: @property (nonatomic,strong) AAAInputView *inputView;
@property (nonatomic,strong) ClueView *inputView;

//: - (instancetype)initWithSession:(NIMSession *)session
- (instancetype)initWithFind:(NIMSession *)session
                         //: config:(id<CCCSessionConfig>)sessionConfig;
                         rangeNumber:(id<FromConfig>)sessionConfig;

//: @end
@end
