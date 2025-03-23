//
//  CCCSessionUnknowContentView.h
// AppleProjectKit
//
//  Created by chris on 15/3/9.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCSessionUnknowContentView.h"
#import "M80AttributedLabel+AppleProjectKit.h"
#import "UIViewNimKit.h"
#import "BBBMessageModel.h"
#import "AppleProjectKit.h"
#import "NSString+AppleProjectKit.h"
#import "CCCGlobalMacro.h"


@interface CCCSessionUnknowContentView()

@property (nonatomic,strong) UILabel *label;

@end

@implementation CCCSessionUnknowContentView

-(instancetype)initSessionMessageContentView
{
    if (self = [super initSessionMessageContentView]) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.backgroundColor = [UIColor clearColor];
        _label.userInteractionEnabled = NO;
        [self addSubview:_label];
    }
    return self;
}

- (void)refresh:(BBBMessageModel *)data{
    [super refresh:data];
    NSString *text = @"";
//    NSString *text = @"未知类型消息".nim_localized;
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];

    self.label.textColor = setting.textColor;
    self.label.font = setting.font;
    [self.label setText:text];
    [self.label sizeToFit];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _label.nim_centerX = self.nim_width  * .5f;
    _label.nim_centerY = self.nim_height * .5f;
}

@end
