
#import <Foundation/Foundation.h>
typedef struct {
    Byte numerosity;
    Byte *rock;
    unsigned int doingScape;
    bool swingLab;
	int concerningBare;
	int areaBlack;
} NewData;

NSString *StringFromNewData(NewData *data);


//: chat_ic_video_g
NewData str_fedBottomText = (NewData){138, (Byte []){233, 226, 235, 254, 213, 227, 233, 213, 252, 227, 238, 239, 229, 213, 237, 142}, 15, false, 203, 116};


//: chat_ic_voice_g
NewData str_thatPotData = (NewData){89, (Byte []){58, 49, 56, 45, 6, 48, 58, 6, 47, 54, 48, 58, 60, 6, 62, 41}, 15, false, 126, 210};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageOfView.m
// Indicator
//
//  Created by Wenchao Ding on 2020/11/7.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionRtcCallRecordContentView.h"
#import "MessageOfView.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"

//: @implementation CCCSessionRtcCallRecordContentView
@implementation MessageOfView

//: - (instancetype)initSessionMessageContentView
- (instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _textLabel.numberOfLines = 1;
        _textLabel.numberOfLines = 1;
        //: _textLabel.backgroundColor = UIColor.clearColor;
        _textLabel.backgroundColor = UIColor.clearColor;
        //: [self addSubview:_textLabel];
        [self addSubview:_textLabel];

        //: _icImage = [[UIImageView alloc]init];
        _icImage = [[UIImageView alloc]init];
        //: [self addSubview:_icImage];
        [self addSubview:_icImage];

    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data {
- (void)video:(AccumulationCenter *)data {
    //: [super refresh:data];
    [super video:data];
    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    CenterShould *setting = [[Indicator reach].config info:data.message];
    //: self.textLabel.textColor = setting.textColor;
    self.textLabel.textColor = setting.textColor;
    //: self.textLabel.font = setting.font;
    self.textLabel.font = setting.font;
    //: self.textLabel.text = [AAAKitUtil messageTipContent:data.message];
    self.textLabel.text = [TypicalCenter mode:data.message];

    //: NIMRtcCallRecordObject *record = data.message.messageObject;
    NIMRtcCallRecordObject *record = data.message.messageObject;
    //: if(record.callType == NIMNetCallTypeAudio){
    if(record.callType == NIMNetCallTypeAudio){
        //: self.icImage.image = [UIImage imageNamed:@"chat_ic_voice_g"];
        self.icImage.image = [UIImage imageNamed:StringFromNewData(&str_thatPotData)];
    //: }else{
    }else{
        //: self.icImage.image = [UIImage imageNamed:@"chat_ic_video_g"];
        self.icImage.image = [UIImage imageNamed:StringFromNewData(&str_fedBottomText)];
    }

//    */
//   typedef NS_ENUM(NSInteger, NIMNetCallType){
//       /**
//        *  音频通话
//        */
//       NIMNetCallTypeAudio = 1,
//       /**
//        *  视频通话
//        */
//       NIMNetCallTypeVideo = 2,
//   };

}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;

    //: CGFloat tableViewWidth = self.superview.frame.size.width;
    CGFloat tableViewWidth = self.superview.frame.size.width;
    //: CGSize contentsize = [self.model contentSize:tableViewWidth];
    CGSize contentsize = [self.model aggregation:tableViewWidth];
//    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
//    self.textLabel.frame = labelFrame;

    //: self.icImage.frame = CGRectMake(contentInsets.left, contentInsets.top+2, 16, 16);
    self.icImage.frame = CGRectMake(contentInsets.left, contentInsets.top+2, 16, 16);
    //: self.textLabel.frame = CGRectMake(self.icImage.right+5, contentInsets.top, contentsize.width-20, contentsize.height);
    self.textLabel.frame = CGRectMake(self.icImage.right+5, contentInsets.top, contentsize.width-20, contentsize.height);

}

//: @end
@end

Byte *NewDataToByte(NewData *data) {
    if (data->swingLab) return data->rock;
    for (int i = 0; i < data->doingScape; i++) {
        data->rock[i] ^= data->numerosity;
    }
    data->rock[data->doingScape] = 0;
    data->swingLab = true;
	if (data->doingScape >= 2) {
		data->concerningBare = data->rock[0];
		data->areaBlack = data->rock[1];
	}
    return data->rock;
}

NSString *StringFromNewData(NewData *data) {
    return [NSString stringWithUTF8String:(char *)NewDataToByte(data)];
}
