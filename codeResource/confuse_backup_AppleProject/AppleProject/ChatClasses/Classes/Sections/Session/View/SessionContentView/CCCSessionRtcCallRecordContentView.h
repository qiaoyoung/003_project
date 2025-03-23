//
//  CCCSessionRtcCallRecordContentView.h
// AppleProjectKit
//
//  Created by Wenchao Ding on 2020/11/7.
//  Copyright © 2020 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCSessionMessageContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCCSessionRtcCallRecordContentView : CCCSessionMessageContentView

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *icImage;

@end

NS_ASSUME_NONNULL_END
