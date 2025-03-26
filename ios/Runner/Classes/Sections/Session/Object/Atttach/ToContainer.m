
#import <Foundation/Foundation.h>

NSString *StringFromTropicData(Byte *data);


//: 我发起了白板演示
Byte str_cameraValueData[] = {60, 24, 9, 12, 30, 159, 113, 58, 250, 51, 206, 182, 239, 145, 154, 238, 152, 154, 241, 190, 192, 237, 195, 143, 240, 162, 198, 239, 166, 200, 239, 197, 157, 240, 173, 195, 92};


//: flag
Byte str_burdenTitle[] = {2, 4, 30, 13, 226, 239, 180, 29, 142, 197, 111, 245, 236, 132, 138, 127, 133, 3};


//: data
Byte str_wolfData[] = {81, 4, 67, 11, 56, 9, 65, 185, 131, 174, 196, 167, 164, 183, 164, 217};


//: 白板演示已结束
Byte str_needMissingValue[] = {98, 21, 93, 6, 215, 92, 68, 246, 26, 67, 250, 28, 67, 25, 241, 68, 1, 23, 66, 20, 15, 68, 24, 240, 67, 250, 252, 57};


//: icon_whiteboard_session_msg
Byte str_insuranceData[] = {98, 27, 57, 5, 116, 162, 156, 168, 167, 152, 176, 161, 162, 173, 158, 155, 168, 154, 171, 157, 152, 172, 158, 172, 172, 162, 168, 167, 152, 166, 172, 160, 134};


//: type
Byte str_minimumName[] = {66, 4, 67, 14, 218, 228, 29, 47, 73, 198, 246, 231, 93, 83, 183, 188, 179, 168, 240};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ToContainer.m
//  NIM
//
//  Created by 高峰 on 15/7/28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESWhiteboardAttachment.h"
#import "ToContainer.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"

//: @implementation NTESWhiteboardAttachment
@implementation ToContainer

//: - (NSString *)encodeAttachment
- (NSString *)encodeAttachment
{
    //: NSDictionary *dict = @{@"type" : @(CustomMessageTypeWhiteboard),
    NSDictionary *dict = @{StringFromTropicData(str_minimumName) : @(CustomMessageTypeWhiteboard),
                           //: @"data" : @{@"flag":@(self.flag)}};
                           StringFromTropicData(str_wolfData) : @{StringFromTropicData(str_burdenTitle):@(self.flag)}};
    //: NSData *data = [NSJSONSerialization dataWithJSONObject:dict
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   //: options:0
                                                   options:0
                                                     //: error:nil];
                                                     error:nil];
    //: NSString *content = @"";
    NSString *content = @"";
    //: if (data) {
    if (data) {
        //: content = [[NSString alloc] initWithData:data
        content = [[NSString alloc] initWithData:data
                                        //: encoding:NSUTF8StringEncoding];
                                        encoding:NSUTF8StringEncoding];
    }
    //: return content;
    return content;
}

//: - (NSString *)formatedMessage{
- (NSString *)orientationBubble{
    //: NSString *msg = @"";
    NSString *msg = @"";
    //: switch (self.flag) {
    switch (self.flag) {
        //: case CustomWhiteboardFlagInvite:
        case CustomWhiteboardFlagInvite:
            //: msg = @"我发起了白板演示".ntes_localized;
            msg = StringFromTropicData(str_cameraValueData).language;
            //: break;
            break;
        //: case CustomWhiteboardFlagClose:
        case CustomWhiteboardFlagClose:
            //: msg = @"白板演示已结束".ntes_localized;
            msg = StringFromTropicData(str_needMissingValue).language;
        //: default:
        default:
            //: break;
            break;
    }
    //: return msg;
    return msg;
}


//: - (NSString *)cellContent:(NIMMessage *)message{
- (NSString *)pin:(NIMMessage *)message{
    //: NSString *content;
    NSString *content;
    //: switch (self.flag) {
    switch (self.flag) {
        //: case CustomWhiteboardFlagInvite:
        case CustomWhiteboardFlagInvite:
            //: content = @"NTESSessionWhiteBoardContentView";
            content = @"MiddleClassView";
            //: break;
            break;
        //: case CustomWhiteboardFlagClose:
        case CustomWhiteboardFlagClose:
            //: content = @"NTESSessionTipContentView";
            content = @"SizeControl";
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: return content;
    return content;
}

//: - (BOOL)shouldShowAvatar
- (BOOL)name
{
    //: switch (self.flag) {
    switch (self.flag) {
        //: case CustomWhiteboardFlagInvite:
        case CustomWhiteboardFlagInvite:
            //: return YES;
            return YES;
        //: case CustomWhiteboardFlagClose:
        case CustomWhiteboardFlagClose:
            //: return NO;
            return NO;
        //: default:
        default:
            //: break;
            break;
    }
    //: return NO;
    return NO;
}


//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width{
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width{
    //: CGSize contentSize;
    CGSize contentSize;
    //: switch (self.flag) {
    switch (self.flag) {
        //: case CustomWhiteboardFlagInvite:{
        case CustomWhiteboardFlagInvite:{
            //: M80AttributedLabel *label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
            MessageEnableTextView *label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
            //: label.autoDetectLinks = NO;
            label.autoDetectLinks = NO;
            //: label.font = [UIFont systemFontOfSize:14];
            label.font = [UIFont systemFontOfSize:14];
            //: [label setText:self.formatedMessage];
            [label setText:self.orientationBubble];
            //: UIImage *image = [UIImage imageNamed:@"icon_whiteboard_session_msg"];
            UIImage *image = [UIImage imageNamed:StringFromTropicData(str_insuranceData)];
            //: CGFloat msgBubbleMaxWidth = ([UIScreen mainScreen].bounds.size.width - 130);
            CGFloat msgBubbleMaxWidth = ([UIScreen mainScreen].bounds.size.width - 130);
            //: CGFloat bubbleLeftToContent = 14;
            CGFloat bubbleLeftToContent = 14;
            //: CGFloat contentRightToBubble = 14;
            CGFloat contentRightToBubble = 14;
            //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
            CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
            //: CGFloat customWhiteBorardMessageImageRightToText = 10.f;
            CGFloat customWhiteBorardMessageImageRightToText = 10.f;
            //: CGSize labelSize = [label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
            CGSize labelSize = [label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
            //: contentSize = CGSizeMake(labelSize.width + image.size.width + customWhiteBorardMessageImageRightToText, labelSize.height);
            contentSize = CGSizeMake(labelSize.width + image.size.width + customWhiteBorardMessageImageRightToText, labelSize.height);
            //: break;
            break;
        }
        //: case CustomWhiteboardFlagClose:{
        case CustomWhiteboardFlagClose:{
            //: CGFloat messageWidth = width;
            CGFloat messageWidth = width;
            //: CGFloat messageHeight = 40;
            CGFloat messageHeight = 40;
            //: contentSize = CGSizeMake(messageWidth, messageHeight);
            contentSize = CGSizeMake(messageWidth, messageHeight);
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }
    //: return contentSize;
    return contentSize;
}


//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message
{
    //: if (self.flag == CustomWhiteboardFlagClose) {
    if (self.flag == CustomWhiteboardFlagClose) {
        //: return UIEdgeInsetsZero;
        return UIEdgeInsetsZero;
    //: } else {
    } else {
        //: CGFloat selfBubbleTopToContentForBoard = 11.f;
        CGFloat selfBubbleTopToContentForBoard = 11.f;
        //: CGFloat selfBubbleLeftToContentForBoard = 11.f;
        CGFloat selfBubbleLeftToContentForBoard = 11.f;
        //: CGFloat selfContentButtomToBubbleForBoard = 9.f;
        CGFloat selfContentButtomToBubbleForBoard = 9.f;
        //: CGFloat selfBubbleRightToContentForBoard = 15.f;
        CGFloat selfBubbleRightToContentForBoard = 15.f;

        //: CGFloat otherBubbleTopToContentForBoard = 11.f;
        CGFloat otherBubbleTopToContentForBoard = 11.f;
        //: CGFloat otherBubbleLeftToContentForBoard = 15.f;
        CGFloat otherBubbleLeftToContentForBoard = 15.f;
        //: CGFloat otherContentButtomToBubbleForBoard = 9.f;
        CGFloat otherContentButtomToBubbleForBoard = 9.f;
        //: CGFloat otherContentRightToBubbleForBoard = 9.f;
        CGFloat otherContentRightToBubbleForBoard = 9.f;


        //: return message.isOutgoingMsg ? UIEdgeInsetsMake(selfBubbleTopToContentForBoard,
        return message.isOutgoingMsg ? UIEdgeInsetsMake(selfBubbleTopToContentForBoard,
                                                        //: selfBubbleLeftToContentForBoard,
                                                        selfBubbleLeftToContentForBoard,
                                                        //: selfContentButtomToBubbleForBoard,
                                                        selfContentButtomToBubbleForBoard,
                                                        //: selfBubbleRightToContentForBoard):
                                                        selfBubbleRightToContentForBoard):
        //: UIEdgeInsetsMake(otherBubbleTopToContentForBoard,
        UIEdgeInsetsMake(otherBubbleTopToContentForBoard,
                         //: otherBubbleLeftToContentForBoard,
                         otherBubbleLeftToContentForBoard,
                         //: otherContentButtomToBubbleForBoard,
                         otherContentButtomToBubbleForBoard,
                         //: otherContentRightToBubbleForBoard);
                         otherContentRightToBubbleForBoard);
    }
}

//: - (BOOL)canDisplayBubbleBackground:(NIMMessage *)message
- (BOOL)ofs:(NIMMessage *)message
{
    //: return NO;
    return NO;
}

//: - (BOOL)canBeForwarded
- (BOOL)container
{
    //: return NO;
    return NO;
}

//: - (BOOL)canBeRevoked
- (BOOL)recent
{
    //: return NO;
    return NO;
}



//: @end
@end

Byte * TropicDataToCache(Byte *data) {
    int sessionPasta = data[0];
    int sura = data[1];
    Byte mTheory = data[2];
    int pitch = data[3];
    if (!sessionPasta) return data + pitch;
    for (int i = pitch; i < pitch + sura; i++) {
        int value = data[i] - mTheory;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[pitch + sura] = 0;
    return data + pitch;
}

NSString *StringFromTropicData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)TropicDataToCache(data)];
}
