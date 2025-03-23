
#import <Foundation/Foundation.h>
typedef struct {
    Byte thoughtCredibility;
    Byte *estheticPowder;
    unsigned int relief;
    bool assaultConstrain;
	int rideHerd;
	int tingConsume;
} UserFriendlyData;

NSString *StringFromUserFriendlyData(UserFriendlyData *data);


//: NTESChatroomTextContentView
UserFriendlyData str_dirtyValue = (UserFriendlyData){248, (Byte []){182, 172, 189, 171, 187, 144, 153, 140, 138, 151, 151, 149, 172, 157, 128, 140, 187, 151, 150, 140, 157, 150, 140, 174, 145, 157, 143, 197}, 27, false, 44, 196};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ToInputMark.m
//  NIM
//
//  Created by chris on 2017/8/21.
//  Copyright © 2017年 Netease. All rights reserved.
//
//: #import "NTESChatroomRobotContentConfig.h"
#import "ToInputMark.h"
//: #import "M80AttributedLabel+NIMKit.h"
#import "M80AttributedLabel+NIMKit.h"
//: #import "NTESSessionRobotContentView.h"
#import "AggregationImageTitle.h"
//: #import "UIView+NIM.h"
#import "UIView+NIM.h"

// __M_A_C_R_O__

//: @interface NTESChatroomRobotContentConfig()
@interface ToInputMark()

//: @property (nonatomic,strong) M80AttributedLabel *label;
@property (nonatomic,strong) MessageEnableTextView *label;

//: @property (nonatomic,strong) NTESSessionRobotContentView *robotContentView;
@property (nonatomic,strong) AggregationImageTitle *robotContentView;

//: @property (nonatomic,strong) NIMMessageModel *robotModel;
@property (nonatomic,strong) NIMMessageModel *robotModel;
//: @end
@end

//: @implementation NTESChatroomRobotContentConfig
@implementation ToInputMark

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)cellBy:(CGFloat)cellWidth weeny:(NIMMessage *)message
{
    //: CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    //: if ([self isFromRobot:message])
    if ([self red:message])
    {
        //: self.robotModel.message = message;
        self.robotModel.message = message;
        //: self.robotContentView.nim_width = msgBubbleMaxWidth;
        self.robotContentView.nim_width = msgBubbleMaxWidth;
        //: [self.robotContentView setupRobot:self.robotModel];
        [self.robotContentView setupRobot:self.robotModel];
        //: [self.robotContentView layoutIfNeeded];
        [self.robotContentView layoutIfNeeded];

        //: CGSize size = [self.robotContentView sizeThatFits:CGSizeMake(msgBubbleMaxWidth, CGFLOAT_MAX)];
        CGSize size = [self.robotContentView sizeThatFits:CGSizeMake(msgBubbleMaxWidth, CGFLOAT_MAX)];
        //: return size;
        return size;
    }
    //: else
    else
    {
        //: NSString *text = message.text;
        NSString *text = message.text;
        //: [self.label nim_setText:text];
        [self.label nim_setText:text];

        //: CGFloat bubbleLeftToContent = 14;
        CGFloat bubbleLeftToContent = 14;
        //: CGFloat contentRightToBubble = 14;
        CGFloat contentRightToBubble = 14;
        //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
        CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
        //: return [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, CGFLOAT_MAX)];
        return [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, CGFLOAT_MAX)];
    }
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)compartment:(NIMMessage *)message
{
    //: if ([self isFromRobot:message])
    if ([self red:message])
    {
        //: return @"NTESSessionRobotContentView";
        return @"AggregationImageTitle";
    }
    //: else
    else
    {
        //: return @"NTESChatroomTextContentView";
        return StringFromUserFriendlyData(&str_dirtyValue);
    }
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)evokeInsets:(NIMMessage *)message
{
    //: if ([self isFromRobot:message])
    if ([self red:message])
    {
        //: return UIEdgeInsetsMake(9,15,10,0);
        return UIEdgeInsetsMake(9,15,10,0);
    }
    //: else
    else
    {
        //: return UIEdgeInsetsMake(20,15,10,0);
        return UIEdgeInsetsMake(20,15,10,0);
    }
}


//: #pragma mark - Private
#pragma mark - Private
//: - (BOOL)isFromRobot:(NIMMessage *)message
- (BOOL)red:(NIMMessage *)message
{
    //: NIMRobotObject *object = (NIMRobotObject *)message.messageObject;
    NIMRobotObject *object = (NIMRobotObject *)message.messageObject;
    //: return object.isFromRobot;
    return object.isFromRobot;
}

//: - (M80AttributedLabel *)label
- (MessageEnableTextView *)label
{
    //: if (_label)
    if (_label)
    {
        //: return _label;
        return _label;
    }
    //: _label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
    _label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
    //: _label.font = [UIFont systemFontOfSize:Chatroom_Message_Font_Size];
    _label.font = [UIFont systemFontOfSize:Chatroom_Message_Font_Size];
    //: return _label;
    return _label;
}

//: - (NTESSessionRobotContentView *)robotContentView
- (AggregationImageTitle *)robotContentView
{
    //: if (_robotContentView)
    if (_robotContentView)
    {
        //: return _robotContentView;
        return _robotContentView;
    }
    //: _robotContentView = [[NTESSessionRobotContentView alloc] initSessionMessageContentView];
    _robotContentView = [[AggregationImageTitle alloc] initSessionMessageContentView];
    //: return _robotContentView;
    return _robotContentView;
}

//: - (NIMMessageModel *)robotModel
- (NIMMessageModel *)robotModel
{
    //: if (_robotModel)
    if (_robotModel)
    {
        //: return _robotModel;
        return _robotModel;
    }
    //: _robotModel = [[NIMMessageModel alloc] init];
    _robotModel = [[NIMMessageModel alloc] init];
    //: return _robotModel;
    return _robotModel;
}

//: @end
@end

Byte *UserFriendlyDataToByte(UserFriendlyData *data) {
    if (data->assaultConstrain) return data->estheticPowder;
    for (int i = 0; i < data->relief; i++) {
        data->estheticPowder[i] ^= data->thoughtCredibility;
    }
    data->estheticPowder[data->relief] = 0;
    data->assaultConstrain = true;
	if (data->relief >= 2) {
		data->rideHerd = data->estheticPowder[0];
		data->tingConsume = data->estheticPowder[1];
	}
    return data->estheticPowder;
}

NSString *StringFromUserFriendlyData(UserFriendlyData *data) {
    return [NSString stringWithUTF8String:(char *)UserFriendlyDataToByte(data)];
}
