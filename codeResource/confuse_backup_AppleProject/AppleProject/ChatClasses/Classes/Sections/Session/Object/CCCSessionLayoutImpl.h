//
//  NIMSessionLayout.h
// AppleProjectKit
//
//  Created by chris on 2016/11/8.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import "CCCSessionConfigurator.h"
#import "CCCSessionPrivateProtocol.h"

@interface CCCSessionLayoutImpl : NSObject<NIMSessionLayout>

@property (nonatomic,strong)  UITableView *tableView;

@property (nonatomic,strong)  AAAInputView *inputView;

- (instancetype)initWithSession:(NIMSession *)session
                         config:(id<CCCSessionConfig>)sessionConfig;

@end
