
#import <Foundation/Foundation.h>
typedef struct {
    Byte mediaYouth;
    Byte *measureUp;
    unsigned int maximising;
    bool valueName;
	int readilyMin;
	int pullAway;
} NearData;

NSString *StringFromNearData(NearData *data);


//: icon_map
NearData str_organizeName = (NearData){5, (Byte []){108, 102, 106, 107, 90, 104, 100, 117, 189}, 8, false, 45, 223};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageControl.m
// Indicator
//
//  Created by chris on 15/2/28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionLocationContentView.h"
#import "MessageControl.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCSessionLocationContentView()
@interface MessageControl()

//: @property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIImageView * imageView;

//: @property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * titleLabel;

//: @end
@end

//: @implementation CCCSessionLocationContentView
@implementation MessageControl

//: - (instancetype)initSessionMessageContentView{
- (instancetype)initMessageOpen{
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: if (self) {
    if (self) {
        //: self.opaque = YES;
        self.opaque = YES;
        //: UIImage *image = [UIImage imageNamed:@"icon_map"];
        UIImage *image = [UIImage imageNamed:StringFromNearData(&str_organizeName)];
        //: _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView = [[UIImageView alloc] initWithImage:image];

        //: CALayer *maskLayer = [CALayer layer];
        CALayer *maskLayer = [CALayer layer];
        //: maskLayer.cornerRadius = 13.0;
        maskLayer.cornerRadius = 13.0;
        //: maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        //: maskLayer.frame = _imageView.bounds;
        maskLayer.frame = _imageView.bounds;
        //: _imageView.layer.mask = maskLayer;
        _imageView.layer.mask = maskLayer;

        //: [self addSubview:_imageView];
        [self addSubview:_imageView];

        //: _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //: _titleLabel.numberOfLines = 0;
        _titleLabel.numberOfLines = 0;
        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];

    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data
- (void)video:(AccumulationCenter *)data
{
    //: [super refresh:data];
    [super video:data];
    //: NIMLocationObject * locationObject = (NIMLocationObject*)self.model.message.messageObject;
    NIMLocationObject * locationObject = (NIMLocationObject*)self.model.message.messageObject;
    //: self.titleLabel.text = locationObject.title;
    self.titleLabel.text = locationObject.title;

    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    CenterShould *setting = [[Indicator reach].config info:data.message];

    //: self.titleLabel.textColor = setting.textColor;
    self.titleLabel.textColor = setting.textColor;
    //: self.titleLabel.font = setting.font;
    self.titleLabel.font = setting.font;
}

//: - (void)onTouchUpInside:(id)sender
- (void)priceTag:(id)sender
{
    //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
    MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
    //: event.eventName = BBBKitEventNameTapContent;
    event.eventName = k_kitTotalContactTitle;
    //: event.messageModel = self.model;
    event.messageModel = self.model;
    //: [self.delegate onCatchEvent:event];
    [self.delegate birthplaces:event];
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _titleLabel.nim_width = self.nim_width - 20;
    _titleLabel.nim_width = self.nim_width - 20;
    //: _titleLabel.nim_height= 35.f;
    _titleLabel.nim_height= 35.f;
    //: self.titleLabel.nim_centerY = 90.f;
    self.titleLabel.nim_centerY = 90.f;
    //: self.titleLabel.nim_centerX = self.nim_width * .5f;
    self.titleLabel.nim_centerX = self.nim_width * .5f;
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;

    //: CGFloat tableViewWidth = self.superview.nim_width;
    CGFloat tableViewWidth = self.superview.nim_width;
    //: CGSize contentsize = [self.model contentSize:tableViewWidth];
    CGSize contentsize = [self.model aggregation:tableViewWidth];

    //: CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    //: self.imageView.frame = imageViewFrame;
    self.imageView.frame = imageViewFrame;
}


//: @end
@end

Byte *NearDataToByte(NearData *data) {
    if (data->valueName) return data->measureUp;
    for (int i = 0; i < data->maximising; i++) {
        data->measureUp[i] ^= data->mediaYouth;
    }
    data->measureUp[data->maximising] = 0;
    data->valueName = true;
	if (data->maximising >= 2) {
		data->readilyMin = data->measureUp[0];
		data->pullAway = data->measureUp[1];
	}
    return data->measureUp;
}

NSString *StringFromNearData(NearData *data) {
    return [NSString stringWithUTF8String:(char *)NearDataToByte(data)];
}
