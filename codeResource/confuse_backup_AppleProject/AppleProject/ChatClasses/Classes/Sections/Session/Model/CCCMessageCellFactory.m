//
//  CCCMessageCellMaker.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "CCCMessageCellFactory.h"
#import "BBBMessageModel.h"
#import "BBBTimestampModel.h"
#import "CCCSessionAudioContentView.h"
#import "AppleProjectKit.h"
#import "CCCKitAudioCenter.h"
#import "UIViewNimKit.h"

@interface CCCMessageCellFactory()

@end

@implementation CCCMessageCellFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    
}

- (CCCMessageCell *)cellInTable:(UITableView*)tableView
                 forMessageMode:(BBBMessageModel *)model
{
    id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
    NSString *identity = [layoutConfig cellContent:model];
    CCCMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        NSString *clz = @"CCCAdvancedMessageCell";
        [tableView registerClass:NSClassFromString(clz) forCellReuseIdentifier:identity];
        cell = [tableView dequeueReusableCellWithIdentifier:identity];
    }    
    return (CCCMessageCell *)cell;
}

- (CCCSessionTimestampCell *)cellInTable:(UITableView *)tableView
                            forTimeModel:(BBBTimestampModel *)model
{
    NSString *identity = @"time";
    CCCSessionTimestampCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        NSString *clz = @"CCCSessionTimestampCell";
        [tableView registerClass:NSClassFromString(clz) forCellReuseIdentifier:identity];
        cell = [tableView dequeueReusableCellWithIdentifier:identity];
    }
    [cell refreshData:model];
    return (CCCSessionTimestampCell *)cell;
}

@end
