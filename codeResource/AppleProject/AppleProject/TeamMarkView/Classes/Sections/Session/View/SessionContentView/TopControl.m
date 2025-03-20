// __DEBUG__
// __CLOSE_PRINT__
//
//  TopControl.h
// Indicator
//
//  Created by chris on 15/3/9.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionUnknowContentView.h"
#import "TopControl.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"

//: @interface CCCSessionUnknowContentView()
@interface TopControl()

//: @property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UILabel *label;

//: @end
@end

//: @implementation CCCSessionUnknowContentView
@implementation TopControl

//: -(instancetype)initSessionMessageContentView
-(instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.backgroundColor = [UIColor clearColor];
        _label.backgroundColor = [UIColor clearColor];
        //: _label.userInteractionEnabled = NO;
        _label.userInteractionEnabled = NO;
        //: [self addSubview:_label];
        [self addSubview:_label];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data{
- (void)video:(AccumulationCenter *)data{
    //: [super refresh:data];
    [super video:data];
    //: NSString *text = @"";
    NSString *text = @"";
//    NSString *text = @"未知类型消息".nim_localized;
    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    CenterShould *setting = [[Indicator reach].config info:data.message];

    //: self.label.textColor = setting.textColor;
    self.label.textColor = setting.textColor;
    //: self.label.font = setting.font;
    self.label.font = setting.font;
    //: [self.label setText:text];
    [self.label setText:text];
    //: [self.label sizeToFit];
    [self.label sizeToFit];
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _label.nim_centerX = self.nim_width * .5f;
    _label.nim_centerX = self.nim_width * .5f;
    //: _label.nim_centerY = self.nim_height * .5f;
    _label.nim_centerY = self.nim_height * .5f;
}

//: @end
@end
