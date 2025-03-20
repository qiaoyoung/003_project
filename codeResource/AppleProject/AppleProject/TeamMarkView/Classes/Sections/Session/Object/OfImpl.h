// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionInteractor.h
// Indicator
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "UserSessionPrivateProtocol.h"
#import "UserSessionPrivateProtocol.h"
//: #import "UserSessionConfigurateProtocol.h"
#import "UserSessionConfigurateProtocol.h"

//: @interface CCCSessionInteractorImpl : NSObject<NIMSessionInteractor,NIMSessionLayoutDelegate>
@interface OfImpl : NSObject<WriterSContentSumeractor,ShowHideFrom>

//: - (instancetype)initWithSession:(NIMSession *)session
- (instancetype)initWithParameter:(NIMSession *)session
                         //: config:(id<CCCSessionConfig>)sessionConfig;
                         next:(id<FromConfig>)sessionConfig;

//: @property(nonatomic,weak) id<NIMSessionInteractorDelegate> delegate;
@property(nonatomic,weak) id<InputSignalTable> delegate;

//: @property(nonatomic,strong) id<NIMSessionDataSource> dataSource;
@property(nonatomic,strong) id<ContentOffSource> dataSource;

//: @property(nonatomic,strong) id<NIMSessionLayout> layout;
@property(nonatomic,strong) id<ShouldLayout> layout;

//: @end
@end
