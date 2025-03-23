
#import <Foundation/Foundation.h>

NSString *StringFromMudraData(Byte *data);        


//: icon_whiteboard_session_msg
Byte str_valueYardLifeData[] = {21, 27, 19, 8, 136, 152, 138, 66, 86, 80, 92, 91, 76, 100, 85, 86, 97, 82, 79, 92, 78, 95, 81, 76, 96, 82, 96, 96, 86, 92, 91, 76, 90, 96, 84, 216};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MiddleClassView.m
//  NIM
//
//  Created by chris on 15/8/3.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionWhiteBoardContentView.h"
#import "MiddleClassView.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "NTESWhiteboardAttachment.h"
#import "ToContainer.h"

//: @interface NTESSessionWhiteBoardContentView()
@interface MiddleClassView()

//: @property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *imageView;

//: @end
@end

//: @implementation NTESSessionWhiteBoardContentView
@implementation MiddleClassView

//: -(instancetype)initSessionMessageContentView
-(instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _textLabel = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textLabel = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _textLabel.autoDetectLinks = NO;
        _textLabel.autoDetectLinks = NO;
        //: _textLabel.numberOfLines = 0;
        _textLabel.numberOfLines = 0;
        //: _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        //: _textLabel.font = [UIFont systemFontOfSize:14.f];
        _textLabel.font = [UIFont systemFontOfSize:14.f];
        //: _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        //: [self addSubview:_textLabel];
        [self addSubview:_textLabel];

        //: _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_whiteboard_session_msg"]];
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:StringFromMudraData(str_valueYardLifeData)]];
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data{
- (void)video:(AccumulationCenter *)data{
    //: [super refresh:data];
    [super video:data];
    //: NIMCustomObject *object = (NIMCustomObject *)data.message.messageObject;
    NIMCustomObject *object = (NIMCustomObject *)data.message.messageObject;
    //: NTESWhiteboardAttachment *attach = (NTESWhiteboardAttachment *)object.attachment;
    ToContainer *attach = (ToContainer *)object.attachment;
    //: NSString *text = attach.formatedMessage;
    NSString *text = attach.orientationBubble;

    //: [_textLabel setText:text];
    [_textLabel setText:text];
    //: if (!data.message.isOutgoingMsg) {
    if (!data.message.isOutgoingMsg) {
        //: _textLabel.textColor = [UIColor blackColor];
        _textLabel.textColor = [UIColor blackColor];
    //: }else{
    }else{
        //: _textLabel.textColor = [UIColor whiteColor];
        _textLabel.textColor = [UIColor whiteColor];
    }

    //: self.bubbleImageView.hidden = NO;
    self.bubbleImageView.hidden = NO;
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: CGFloat tableViewWidth = self.superview.width;
    CGFloat tableViewWidth = self.superview.width;
    //: CGSize contentSize = [self.model contentSize:tableViewWidth];
    CGSize contentSize = [self.model aggregation:tableViewWidth];
    //: self.imageView.left = contentInsets.left;
    self.imageView.left = contentInsets.left;
    //: self.imageView.centerY = self.height * .5f;
    self.imageView.centerY = self.height * .5f;
    //: CGFloat customWhiteBorardMessageImageRightToText = 5.f;
    CGFloat customWhiteBorardMessageImageRightToText = 5.f;
    //: CGRect labelFrame = CGRectMake(self.imageView.right + customWhiteBorardMessageImageRightToText, contentInsets.top, contentSize.width, contentSize.height);
    CGRect labelFrame = CGRectMake(self.imageView.right + customWhiteBorardMessageImageRightToText, contentInsets.top, contentSize.width, contentSize.height);
    //: self.textLabel.frame = labelFrame;
    self.textLabel.frame = labelFrame;
}
//: @end
@end

Byte * MudraDataToCache(Byte *data) {
    int pastaRide = data[0];
    int needAmble = data[1];
    Byte offGoing = data[2];
    int hare = data[3];
    if (!pastaRide) return data + hare;
    for (int i = hare; i < hare + needAmble; i++) {
        int value = data[i] + offGoing;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[hare + needAmble] = 0;
    return data + hare;
}

NSString *StringFromMudraData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)MudraDataToCache(data)];
}
