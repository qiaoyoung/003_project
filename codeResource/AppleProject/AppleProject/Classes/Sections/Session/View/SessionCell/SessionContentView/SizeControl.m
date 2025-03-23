
#import <Foundation/Foundation.h>

NSString *StringFromProviderThreadData(Byte *data);


//: icon_session_time_bg
Byte str_imageImmuneData[] = {26, 20, 1, 14, 63, 81, 13, 241, 141, 143, 44, 225, 151, 48, 106, 100, 112, 111, 96, 116, 102, 116, 116, 106, 112, 111, 96, 117, 106, 110, 102, 96, 99, 104, 169};


//: {8,20,8,20}
Byte str_soilName[] = {89, 11, 88, 8, 161, 59, 70, 126, 211, 144, 132, 138, 136, 132, 144, 132, 138, 136, 213, 134};

// __DEBUG__
// __CLOSE_PRINT__
//
//  SizeControl.m
//  NIM
//
//  Created by chris on 2016/11/6.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionTipContentView.h"
#import "SizeControl.h"
//: #import "NTESCustomAttachmentDefines.h"
#import "NTESCustomAttachmentDefines.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"

//: @implementation NTESSessionTipContentView
@implementation SizeControl

//: - (instancetype)initSessionMessageContentView
- (instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.numberOfLines = 0;
        _label.numberOfLines = 0;
        //: [self addSubview:_label];
        [self addSubview:_label];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)model{
- (void)video:(AccumulationCenter *)model{
    //: [super refresh:model];
    [super video:model];
    //: NIMCustomObject *object = (NIMCustomObject *)model.message.messageObject;
    NIMCustomObject *object = (NIMCustomObject *)model.message.messageObject;
    //: id<NTESCustomAttachmentInfo> attachment = (id<NTESCustomAttachmentInfo>)object.attachment;
    id<TingChild> attachment = (id<TingChild>)object.attachment;
    //: if ([attachment respondsToSelector:@selector(formatedMessage)]) {
    if ([attachment respondsToSelector:@selector(orientationBubble)]) {
        //: self.label.text = [attachment formatedMessage];
        self.label.text = [attachment orientationBubble];
    }
    //: self.label.textColor = [UIColor whiteColor];;
    self.label.textColor = [UIColor whiteColor];;
    //: self.label.font = [UIFont systemFontOfSize:10.f];
    self.label.font = [UIFont systemFontOfSize:10.f];

    //: self.bubbleImageView.hidden = NO;
    self.bubbleImageView.hidden = NO;
}

//: - (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
- (UIImage *)administrator:(UIControlState)state language:(BOOL)outgoing
{
    //: UIImage *image = [UIImage imageNamed:@"icon_session_time_bg"];
    UIImage *image = [UIImage imageNamed:StringFromProviderThreadData(str_imageImmuneData)];
    //: UIEdgeInsets insets = UIEdgeInsetsFromString(@"{8,20,8,20}");
    UIEdgeInsets insets = UIEdgeInsetsFromString(StringFromProviderThreadData(str_soilName));
    //: return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat padding = 20.f;
    CGFloat padding = 20.f;
    //: self.label.size = [self.label sizeThatFits:CGSizeMake(self.width - 2 * padding, 1.7976931348623157e+308)];
    self.label.size = [self.label sizeThatFits:CGSizeMake(self.width - 2 * padding, 1.7976931348623157e+308)];
    //: self.label.centerX = self.width * .5f;
    self.label.centerX = self.width * .5f;
    //: self.label.centerY = self.height * .5f;
    self.label.centerY = self.height * .5f;
    //: self.bubbleImageView.frame = CGRectInset(self.label.frame, -8, -4);
    self.bubbleImageView.frame = CGRectInset(self.label.frame, -8, -4);
}


//: @end
@end

Byte * ProviderThreadDataToCache(Byte *data) {
    int indexTitle = data[0];
    int usance = data[1];
    Byte pick = data[2];
    int nature = data[3];
    if (!indexTitle) return data + nature;
    for (int i = nature; i < nature + usance; i++) {
        int value = data[i] - pick;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[nature + usance] = 0;
    return data + nature;
}

NSString *StringFromProviderThreadData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ProviderThreadDataToCache(data)];
}
