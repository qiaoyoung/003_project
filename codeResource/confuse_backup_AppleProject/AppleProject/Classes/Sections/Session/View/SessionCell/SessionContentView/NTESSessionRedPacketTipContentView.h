//
//  NTESSessionRedPacketTipContentView.h
//  NIM
//
//  Created by chris on 2017/7/17.
//  Copyright © 2017年 Netease. All rights reserved.
//


#import "CCCSessionMessageContentView.h"
#import "M80AttributedLabel.h"

static NSString *const NTESShowRedPacketDetailEvent = @"NTESShowRedPacketDetailEvent";


@interface NTESSessionRedPacketTipContentView : CCCSessionMessageContentView

@property (nonatomic,strong) M80AttributedLabel *label;

@end
