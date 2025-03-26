
#import <Foundation/Foundation.h>
typedef struct {
    Byte sculpt;
    Byte *apply;
    unsigned int physicsLab;
    bool depressedSoil;
	int depressed;
	int blocChange;
	int gestureFrom;
} GelWidowData;

NSString *StringFromGelWidowData(GelWidowData *data);


//: icon_session_time_bg
GelWidowData str_tableMediaRefugeeName = (GelWidowData){85, (Byte []){60, 54, 58, 59, 10, 38, 48, 38, 38, 60, 58, 59, 10, 33, 60, 56, 48, 10, 55, 50, 170}, 20, false, 149, 225, 185};


//: {8,20,8,20}
GelWidowData str_personalityValue = (GelWidowData){184, (Byte []){195, 128, 148, 138, 136, 148, 128, 148, 138, 136, 197, 200}, 11, false, 250, 115, 4};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TingTextView.m
//  NIM
//
//  Created by chris on 2017/7/17.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionRedPacketTipContentView.h"
#import "TingTextView.h"
//: #import "NTESRedPacketTipAttachment.h"
#import "LightNameAttachment.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NTESCustomAttachmentDefines.h"
#import "NTESCustomAttachmentDefines.h"

//: @interface NTESSessionRedPacketTipContentView()<M80AttributedLabelDelegate>
@interface TingTextView()<DisableShowInput>

//: @end
@end

//: @implementation NTESSessionRedPacketTipContentView
@implementation TingTextView

//: - (instancetype)initSessionMessageContentView
- (instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _label.font = [UIFont systemFontOfSize:10];
        _label.font = [UIFont systemFontOfSize:10];
        //: _label.textColor = [UIColor whiteColor];;
        _label.textColor = [UIColor whiteColor];;

        //: _label.backgroundColor = [UIColor clearColor];
        _label.backgroundColor = [UIColor clearColor];
        //: _label.numberOfLines = 0;
        _label.numberOfLines = 0;
        //: _label.M80delegate = self;
        _label.M80delegate = self;
        //: _label.underLineForLink = NO;
        _label.underLineForLink = NO;
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
    //: [self.label setText:nil];
    [self.label setText:nil];
    //: if ([attachment respondsToSelector:@selector(formatedMessage)]) {
    if ([attachment respondsToSelector:@selector(orientationBubble)]) {
        //: NSString *formatedMessage = attachment.formatedMessage;
        NSString *formatedMessage = attachment.orientationBubble;
        //: [self.label appendText:formatedMessage];
        [self.label mixInText:formatedMessage];
        //: NSRange range = [formatedMessage rangeOfString:@"红包".ntes_localized];
        NSRange range = [formatedMessage rangeOfString:@"红包".language];
        //: if (range.location != NSNotFound)
        if (range.location != NSNotFound)
        {
            //由于还有个 icon , 需要将 range 往后挪一个位置
//            range = NSMakeRange(range.location+1, range.length);
//            [self.label addCustomLink:model forRange:range linkColor:UIColorFromRGB(0x238efa)];
        }
    }
}




//: - (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
- (UIImage *)administrator:(UIControlState)state language:(BOOL)outgoing
{
    //: UIImage *image = [UIImage imageNamed:@"icon_session_time_bg"];
    UIImage *image = [UIImage imageNamed:StringFromGelWidowData(&str_tableMediaRefugeeName)];
    //: UIEdgeInsets insets = UIEdgeInsetsFromString(@"{8,20,8,20}");
    UIEdgeInsets insets = UIEdgeInsetsFromString(StringFromGelWidowData(&str_personalityValue));
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


//: #pragma mark - M80AttributedLabelDelegate
#pragma mark - DisableShowInput
//: - (void)m80AttributedLabel:(M80AttributedLabel *)label
- (void)success:(MessageEnableTextView *)label
             //: clickedOnLink:(id)linkData
             touch:(id)linkData
{
    //: if ([self.delegate respondsToSelector:@selector(onCatchEvent:)]) {
    if ([self.delegate respondsToSelector:@selector(birthplaces:)]) {
        //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
        MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
        //: event.eventName = NTESShowRedPacketDetailEvent;
        event.eventName = k_userText;
        //: event.messageModel = self.model;
        event.messageModel = self.model;
        //: event.data = self;
        event.data = self;
        //: [self.delegate onCatchEvent:event];
        [self.delegate birthplaces:event];
    }
}


//: @end
@end

Byte *GelWidowDataToByte(GelWidowData *data) {
    if (data->depressedSoil) return data->apply;
    for (int i = 0; i < data->physicsLab; i++) {
        data->apply[i] ^= data->sculpt;
    }
    data->apply[data->physicsLab] = 0;
    data->depressedSoil = true;
	if (data->physicsLab >= 3) {
		data->depressed = data->apply[0];
		data->blocChange = data->apply[1];
		data->gestureFrom = data->apply[2];
	}
    return data->apply;
}

NSString *StringFromGelWidowData(GelWidowData *data) {
    return [NSString stringWithUTF8String:(char *)GelWidowDataToByte(data)];
}
