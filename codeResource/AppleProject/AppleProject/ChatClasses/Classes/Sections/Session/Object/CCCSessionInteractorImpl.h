//
//  NIMSessionInteractor.h
// AppleProjectKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCSessionPrivateProtocol.h"
#import "CCCSessionConfigurateProtocol.h"

@interface CCCSessionInteractorImpl : NSObject<NIMSessionInteractor,NIMSessionLayoutDelegate>

- (instancetype)initWithSession:(NIMSession *)session
                         config:(id<CCCSessionConfig>)sessionConfig;

@property(nonatomic,weak) id<NIMSessionInteractorDelegate> delegate;

@property(nonatomic,strong) id<NIMSessionDataSource> dataSource;

@property(nonatomic,strong) id<NIMSessionLayout>     layout;

@end
