
#import <Foundation/Foundation.h>
typedef struct {
    Byte significanceIncreasing;
    Byte *weaponRefuge;
    unsigned int tightenCamera;
    bool battle;
	int orationThreadKey;
	int depressedBottom;
	int angling;
} CartData;

NSString *StringFromCartData(CartData *data);


//: NTESChatroomTextContentView
CartData str_tuckMediaData = (CartData){222, (Byte []){144, 138, 155, 141, 157, 182, 191, 170, 172, 177, 177, 179, 138, 187, 166, 170, 157, 177, 176, 170, 187, 176, 170, 136, 183, 187, 169, 101}, 27, false, 52, 13, 88};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NameTeam.m
//  NIM
//
//  Created by chris on 16/1/13.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESChatroomTextContentConfig.h"
#import "NameTeam.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"

//: @interface NTESChatroomTextContentConfig()
@interface NameTeam()

//: @property (nonatomic, strong) M80AttributedLabel *label;
@property (nonatomic, strong) MessageEnableTextView *label;

//: @end
@end

//: @implementation NTESChatroomTextContentConfig
@implementation NameTeam

//: - (instancetype)init{
- (instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {

    }
    //: return self;
    return self;
}

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NSString *text = message.text;
    NSString *text = message.text;
    //: [self.label nim_setText:text];
    [self.label showName:text];
    //: CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    //: CGFloat bubbleLeftToContent = 15;
    CGFloat bubbleLeftToContent = 15;
    //: CGFloat contentRightToBubble = 0;
    CGFloat contentRightToBubble = 0;
    //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    //: return [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
    return [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"NTESChatroomTextContentView";
    return StringFromCartData(&str_tuckMediaData);
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return UIEdgeInsetsMake(20,15,10,0);
    return UIEdgeInsetsMake(20,15,10,0);
}

//: - (M80AttributedLabel *)label
- (MessageEnableTextView *)label
{
    //: if (!_label) {
    if (!_label) {
        //: _label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _label.font = [UIFont systemFontOfSize:16];
        _label.font = [UIFont systemFontOfSize:16];
    }
    //: return _label;
    return _label;
}

//: - (BOOL)enableBackgroundBubbleView:(NIMMessage *)message
- (BOOL)backgrounded:(NIMMessage *)message
{
    //: return NO;
    return NO;
}

//: @end
@end

Byte *CartDataToByte(CartData *data) {
    if (data->battle) return data->weaponRefuge;
    for (int i = 0; i < data->tightenCamera; i++) {
        data->weaponRefuge[i] ^= data->significanceIncreasing;
    }
    data->weaponRefuge[data->tightenCamera] = 0;
    data->battle = true;
	if (data->tightenCamera >= 3) {
		data->orationThreadKey = data->weaponRefuge[0];
		data->depressedBottom = data->weaponRefuge[1];
		data->angling = data->weaponRefuge[2];
	}
    return data->weaponRefuge;
}

NSString *StringFromCartData(CartData *data) {
    return [NSString stringWithUTF8String:(char *)CartDataToByte(data)];
}
