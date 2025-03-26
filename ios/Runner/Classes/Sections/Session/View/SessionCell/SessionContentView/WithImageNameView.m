
#import <Foundation/Foundation.h>

NSString *StringFromOpenData(Byte *data);


//: normal
Byte str_lowNameData[] = {42, 6, 3, 108, 97, 109, 114, 111, 110, 88};


//: icon_redpacket_
Byte str_wolfFishingName[] = {66, 15, 5, 201, 171, 95, 116, 101, 107, 99, 97, 112, 100, 101, 114, 95, 110, 111, 99, 105, 88};


//: 查看红包
Byte str_providerKeyValue[] = {48, 12, 3, 133, 140, 229, 162, 186, 231, 139, 156, 231, 165, 159, 230, 78};


//: redid
Byte str_iconBrotherText[] = {43, 5, 4, 255, 100, 105, 100, 101, 114, 30};


//: 领取红包
Byte str_mansionRideName[] = {67, 12, 7, 22, 52, 67, 191, 133, 140, 229, 162, 186, 231, 150, 143, 229, 134, 162, 233, 93};


//: data
Byte str_dateQuestionValue[] = {26, 4, 12, 229, 252, 57, 71, 64, 170, 99, 6, 209, 97, 116, 97, 100, 242};


//: icon_redpacket_custom
Byte str_imagePriseData[] = {60, 21, 9, 75, 230, 52, 19, 104, 53, 109, 111, 116, 115, 117, 99, 95, 116, 101, 107, 99, 97, 112, 100, 101, 114, 95, 110, 111, 99, 105, 61};


//: isaccept
Byte str_marbleName[] = {55, 8, 4, 61, 116, 112, 101, 99, 99, 97, 115, 105, 198};


//: pressed
Byte str_personalityName[] = {4, 7, 13, 176, 181, 143, 158, 116, 202, 134, 81, 206, 121, 100, 101, 115, 115, 101, 114, 112, 213};


//: /wallet/isAcceptRed
Byte str_soilData[] = {88, 19, 3, 100, 101, 82, 116, 112, 101, 99, 99, 65, 115, 105, 47, 116, 101, 108, 108, 97, 119, 47, 197};


//: from_
Byte str_seventhPowderValue[] = {33, 5, 3, 95, 109, 111, 114, 102, 215};

// __DEBUG__
// __CLOSE_PRINT__
//
//  WithImageNameView.m
//  NIM
//
//  Created by chris on 2017/7/17.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionRedPacketContentView.h"
#import "WithImageNameView.h"
//: #import "NTESRedPacketAttachment.h"
#import "MarkTing.h"

//: NSString *const NIMDemoEventNameOpenRedPacket = @"NIMDemoEventNameOpenRedPacket";
NSString *const k_backVersionText = @"NIMDemoEventNameOpenRedPacket";

//: @interface NTESSessionRedPacketContentView()
@interface WithImageNameView()

//: @property (nonatomic ,strong) UIImageView *redPacketImage;
@property (nonatomic ,strong) UIImageView *redPacketImage;

//: @property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *titleLabel;

//: @property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

//: @property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *descLabel;

//: @property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIView *whiteView;

//: @property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *tap;

//: @end
@end

//: @implementation NTESSessionRedPacketContentView
@implementation WithImageNameView

//: - (instancetype)initSessionMessageContentView{
- (instancetype)initMessageOpen{
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: if (self) {
    if (self) {
        // 内容布局
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _titleLabel.font = [UIFont systemFontOfSize:12.f];
//        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _subTitleLabel.font = [UIFont systemFontOfSize:12.f];
//        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _descLabel.font = [UIFont systemFontOfSize:13.f];

        //: _redPacketImage = [[UIImageView alloc] init];
        _redPacketImage = [[UIImageView alloc] init];
        //: _redPacketImage.clipsToBounds = YES;
        _redPacketImage.clipsToBounds = YES;
        //: _redPacketImage.contentMode = UIViewContentModeScaleAspectFill;
        _redPacketImage.contentMode = UIViewContentModeScaleAspectFill;
        //: _redPacketImage.image = [UIImage imageNamed:@"icon_redpacket_custom"];
        _redPacketImage.image = [UIImage imageNamed:StringFromOpenData(str_imagePriseData)];
        //: _redPacketImage.layer.masksToBounds = YES;
        _redPacketImage.layer.masksToBounds = YES;
        //: _redPacketImage.layer.cornerRadius = 10;
        _redPacketImage.layer.cornerRadius = 10;

        //: _whiteView = [[UIView alloc] init];
        _whiteView = [[UIView alloc] init];
        //: _whiteView.userInteractionEnabled = NO;
        _whiteView.userInteractionEnabled = NO;
        //: _whiteView.backgroundColor = [UIColor whiteColor];
        _whiteView.backgroundColor = [UIColor whiteColor];
        //: _whiteView.alpha = 0.5;
        _whiteView.alpha = 0.5;
        //: _whiteView.hidden = YES;
        _whiteView.hidden = YES;

        //: self.bubbleImageView.hidden = YES;
        self.bubbleImageView.hidden = YES;

        //: [self addSubview:_redPacketImage];
        [self addSubview:_redPacketImage];
        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];
        //: [self addSubview:_subTitleLabel];
        [self addSubview:_subTitleLabel];
        //: [self addSubview:_descLabel];
        [self addSubview:_descLabel];
        //: [self addSubview:_whiteView];
        [self addSubview:_whiteView];

    }
    //: return self;
    return self;
}


//: - (void)onTouchUpInside:(id)sender
- (void)priceTag:(id)sender
{
    //: if ([self.delegate respondsToSelector:@selector(onCatchEvent:)]) {
    if ([self.delegate respondsToSelector:@selector(birthplaces:)]) {
        //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
        MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
        //: event.eventName = NIMDemoEventNameOpenRedPacket;
        event.eventName = k_backVersionText;
        //: event.messageModel = self.model;
        event.messageModel = self.model;
        //: event.data = self;
        event.data = self;
        //: [self.delegate onCatchEvent:event];
        [self.delegate birthplaces:event];
    }
}

//: #pragma mark - 系统父类方法
#pragma mark - 系统父类方法
//: - (void)refresh:(BBBMessageModel*)data{
- (void)video:(AccumulationCenter*)data{
    //: [super refresh:data];
    [super video:data];

    //: NIMCustomObject *object = data.message.messageObject;
    NIMCustomObject *object = data.message.messageObject;
    //: NTESRedPacketAttachment *attachment = (NTESRedPacketAttachment *)object.attachment;
    MarkTing *attachment = (MarkTing *)object.attachment;

    //: self.titleLabel.text = attachment.title;
    self.titleLabel.text = attachment.title;
    //: self.descLabel.text = attachment.content;
    self.descLabel.text = attachment.content;

    //: self.titleLabel.textColor = [UIColor lightGrayColor];
    self.titleLabel.textColor = [UIColor lightGrayColor];
    //: self.subTitleLabel.textColor = [UIColor whiteColor];
    self.subTitleLabel.textColor = [UIColor whiteColor];
    //: self.descLabel.textColor = [UIColor whiteColor];
    self.descLabel.textColor = [UIColor whiteColor];

    //: [self.titleLabel sizeToFit];
    [self.titleLabel sizeToFit];
    //: CGRect rect = self.titleLabel.frame;
    CGRect rect = self.titleLabel.frame;
    //: if (CGRectGetMaxX(rect) > self.bounds.size.width)
    if (CGRectGetMaxX(rect) > self.bounds.size.width)
    {
        //: rect.size.width = self.bounds.size.width - rect.origin.x - 20;
        rect.size.width = self.bounds.size.width - rect.origin.x - 20;
        //: self.titleLabel.frame = rect;
        self.titleLabel.frame = rect;
    }
    //: self.subTitleLabel.text = self.model.message.isOutgoingMsg? @"查看红包".ntes_localized : @"领取红包".ntes_localized;
    self.subTitleLabel.text = self.model.message.isOutgoingMsg? StringFromOpenData(str_providerKeyValue).language : StringFromOpenData(str_mansionRideName).language;

    //: NSMutableDictionary *dict = @{}.mutableCopy;
    NSMutableDictionary *dict = @{}.mutableCopy;
    //: dict[@"redid"] = attachment.redPacketId;
    dict[StringFromOpenData(str_iconBrotherText)] = attachment.redPacketId;
    //: [ZCHttpManager getWithUrl:[NSString stringWithFormat:@"/wallet/isAcceptRed"] params:dict isShow:NO success:^(id responseObject) {
    [FromMessage maxColor:[NSString stringWithFormat:StringFromOpenData(str_soilData)] flush:dict countIn:NO alongResponseSuccess:^(id responseObject) {
        //: NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        //: NSDictionary *dataDict = [resultDict valueObjectForKey:@"data"];
        NSDictionary *dataDict = [resultDict eigenvalueOfAMatrix:StringFromOpenData(str_dateQuestionValue)];
        //: NSString *isaccept = [dataDict newStringValueForKey:@"isaccept"];
        NSString *isaccept = [dataDict cord:StringFromOpenData(str_marbleName)];
        //: if (isaccept.integerValue == 0) {
        if (isaccept.integerValue == 0) {
            //: _whiteView.hidden = YES;
            _whiteView.hidden = YES;
        //: }else{
        }else{
            //: _whiteView.hidden = NO;
            _whiteView.hidden = NO;
        }
    //: } failed:^(id responseObject, NSError *error) {
    } searched:^(id responseObject, NSError *error) {

    //: }];
    }];
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _redPacketImage.frame = CGRectMake(0, 0, 160, 180);
    _redPacketImage.frame = CGRectMake(0, 0, 160, 180);
    //: _whiteView.frame = CGRectMake(0, 0, 160, 180);
    _whiteView.frame = CGRectMake(0, 0, 160, 180);

    //: BOOL outgoing = self.model.message.isOutgoingMsg;
    BOOL outgoing = self.model.message.isOutgoingMsg;
    //: if (outgoing)
    if (outgoing)
    {
        //: self.descLabel.frame = CGRectMake(12.0f+31.f+12.f, 17.f, 160.f, 24.f);
        self.descLabel.frame = CGRectMake(12.0f+31.f+12.f, 17.f, 160.f, 24.f);
        //: self.subTitleLabel.frame = CGRectMake(12.0f+31.f+12.f, 39.f, 150.f, 20.f);
        self.subTitleLabel.frame = CGRectMake(12.0f+31.f+12.f, 39.f, 150.f, 20.f);
        //: self.titleLabel.frame = CGRectMake(7.0f, 93.f-18.f, 180.f, 21.f);
        self.titleLabel.frame = CGRectMake(7.0f, 93.f-18.f, 180.f, 21.f);
    }
    //: else
    else
    {
        //: self.descLabel.frame = CGRectMake(12.f+31.f+12.f, 17.f, 160.f, 24.f);
        self.descLabel.frame = CGRectMake(12.f+31.f+12.f, 17.f, 160.f, 24.f);
        //: self.subTitleLabel.frame = CGRectMake(12.f+31.f+12.f, 39.f, 150.f, 20.f);
        self.subTitleLabel.frame = CGRectMake(12.f+31.f+12.f, 39.f, 150.f, 20.f);
        //: self.titleLabel.frame = CGRectMake(14.f, 93.f-18.f, 180.f, 21.f);
        self.titleLabel.frame = CGRectMake(14.f, 93.f-18.f, 180.f, 21.f);
    }
}

//: - (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
- (UIImage *)administrator:(UIControlState)state language:(BOOL)outgoing
{
    //: NSString *stateString = state == UIControlStateNormal? @"normal" : @"pressed";
    NSString *stateString = state == UIControlStateNormal? StringFromOpenData(str_lowNameData) : StringFromOpenData(str_personalityName);
    //: NSString *imageName = @"icon_redpacket_";
    NSString *imageName = StringFromOpenData(str_wolfFishingName);
    //: if (outgoing)
    if (outgoing)
    {
        //: imageName = [imageName stringByAppendingString:@"from_"];
        imageName = [imageName stringByAppendingString:StringFromOpenData(str_seventhPowderValue)];
    }
    //: else
    else
    {
        //: imageName = [imageName stringByAppendingString:@"to_"];
        imageName = [imageName stringByAppendingString:@"to_"];
    }
    //: imageName = [imageName stringByAppendingString:stateString];
    imageName = [imageName stringByAppendingString:stateString];
    //: return [UIImage imageNamed:imageName];
    return [UIImage imageNamed:imageName];
}

//: @end
@end

Byte * OpenDataToCache(Byte *data) {
    int marriageCeremony = data[0];
    int sessionEnable = data[1];
    int hareTown = data[2];
    if (!marriageCeremony) return data + hareTown;
    for (int i = 0; i < sessionEnable / 2; i++) {
        int begin = hareTown + i;
        int end = hareTown + sessionEnable - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[hareTown + sessionEnable] = 0;
    return data + hareTown;
}

NSString *StringFromOpenData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OpenDataToCache(data)];
}  
