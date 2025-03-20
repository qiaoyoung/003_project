
#import <Foundation/Foundation.h>

NSString *StringFromReportedRevData(Byte *data);        


//: personCardId
Byte str_blackContent[] = {93, 12, 38, 14, 127, 120, 156, 131, 75, 31, 252, 132, 163, 187, 74, 63, 76, 77, 73, 72, 29, 59, 76, 62, 35, 62, 196};


//: 个人名片
Byte str_severTianContent[] = {9, 12, 87, 6, 228, 139, 141, 97, 83, 141, 99, 99, 142, 57, 54, 144, 50, 48, 45};


//: type
Byte str_equalExcitedName[] = {85, 4, 78, 5, 89, 38, 43, 34, 23, 225};


//: data
Byte str_tingLeapName[] = {83, 4, 70, 12, 67, 25, 245, 33, 193, 201, 102, 119, 30, 27, 46, 27, 244};


//: head_default
Byte str_basketballData[] = {67, 12, 15, 10, 158, 105, 27, 134, 29, 238, 89, 86, 82, 85, 80, 85, 86, 87, 82, 102, 93, 101, 17};


//: 群名片
Byte str_onlyAreaData[] = {53, 9, 5, 5, 104, 226, 185, 159, 224, 139, 136, 226, 132, 130, 81};


//: content
Byte str_instantlyData[] = {58, 7, 48, 5, 39, 51, 63, 62, 68, 53, 62, 68, 109};


//: group_info_activity_group_already_jiesan
Byte str_altogetherName[] = {3, 40, 57, 12, 13, 219, 130, 248, 44, 209, 81, 111, 46, 57, 54, 60, 55, 38, 48, 53, 45, 54, 38, 40, 42, 59, 48, 61, 48, 59, 64, 38, 46, 57, 54, 60, 55, 38, 40, 51, 57, 44, 40, 43, 64, 38, 49, 48, 44, 58, 40, 53, 78};

// __DEBUG__
// __CLOSE_PRINT__
//
//  WithTapView.m
// Indicator
//
//  Created by 田玉龙 on 2022/8/22.
//  Copyright © 2022 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionShareCardContentView.h"
#import "WithTapView.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBLoadProgressView.h"
#import "ShouldContentView.h"
//: #import "UserKitDependency.h"
#import "UserKitDependency.h"
//: #import <YYImage/YYImage.h>
#import <YYImage/YYImage.h>
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "CCCKitDataProviderImpl.h"
#import "MetadataImpl.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import <SDWebImage/SDWebImage.h>
#import <SDWebImage/SDWebImage.h>
//: #import <objc/runtime.h>
#import <objc/runtime.h>
//: #import <objc/message.h>
#import <objc/message.h>

//: @interface CCCSessionShareCardContentView()
@interface WithTapView()

//: @property (nonatomic,strong) NIMUser *user;
@property (nonatomic,strong) NIMUser *user;

//: @property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIImageView * imageView;

//: @property (nonatomic,strong) UILabel * nameLabel;
@property (nonatomic,strong) UILabel * nameLabel;
//: @property (nonatomic,strong) UIView * breakLabel;
@property (nonatomic,strong) UIView * breakLabel;
//: @property (nonatomic,strong) UILabel * tagLabel;
@property (nonatomic,strong) UILabel * tagLabel;

//: @end
@end

//: @implementation CCCSessionShareCardContentView
@implementation WithTapView

//: - (instancetype)initSessionMessageContentView{
- (instancetype)initMessageOpen{
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: if (self) {
    if (self) {
        //: self.opaque = YES;
        self.opaque = YES;
        //: _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //: _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.backgroundColor = [UIColor whiteColor];
        //: _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];

        //: _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textColor = [UIColor blackColor];
        //: [self addSubview:_nameLabel];
        [self addSubview:_nameLabel];

        //: _breakLabel = [[UIView alloc] initWithFrame:CGRectZero];
        _breakLabel = [[UIView alloc] initWithFrame:CGRectZero];
        //: _breakLabel.backgroundColor = [UIColor grayColor];
        _breakLabel.backgroundColor = [UIColor grayColor];
        //: [self addSubview:_breakLabel];
        [self addSubview:_breakLabel];

        //: _tagLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tagLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _tagLabel.textColor = [UIColor grayColor];
        _tagLabel.textColor = [UIColor grayColor];
        //: _tagLabel.font = [UIFont systemFontOfSize:12];
        _tagLabel.font = [UIFont systemFontOfSize:12];
        //: [self addSubview:_tagLabel];
        [self addSubview:_tagLabel];

    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data
- (void)video:(AccumulationCenter *)data
{
    //: [super refresh:data];
    [super video:data];
    //: _imageView.image = nil;
    _imageView.image = nil;
    //: NIMCustomObject * cardObject = (NIMCustomObject*)self.model.message.messageObject;
    NIMCustomObject * cardObject = (NIMCustomObject*)self.model.message.messageObject;

    //: NSString *userid = cardObject.message.session.sessionId;
    NSString *userid = cardObject.message.session.sessionId;
    //: self.user = [[NIMSDK sharedSDK].userManager userInfo:userid];
    self.user = [[NIMSDK sharedSDK].userManager userInfo:userid];

    //: NSString *content = [cardObject.attachment encodeAttachment];
    NSString *content = [cardObject.attachment encodeAttachment];
    //: NSData *dataaaaa = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *dataaaaa = [content dataUsingEncoding:NSUTF8StringEncoding];
    //: if (dataaaaa) {
    if (dataaaaa) {
        //: NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataaaaa
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataaaaa
                                                             //: options:0
                                                             options:0
                                                               //: error:nil];
                                                               error:nil];
        //: if ([dict isKindOfClass:[NSDictionary class]])
        if ([dict isKindOfClass:[NSDictionary class]])
        {
            //: NSInteger type = [[dict objectForKey:@"type"] intValue];
            NSInteger type = [[dict objectForKey:StringFromReportedRevData(str_equalExcitedName)] intValue];
            //: NSDictionary *datatyl = [dict objectForKey:@"data"];
            NSDictionary *datatyl = [dict objectForKey:StringFromReportedRevData(str_tingLeapName)];
            //: if (type == 105) {
            if (type == 105) {

                //: NSString *cardname = [datatyl objectForKey:@"content"];;
                NSString *cardname = [datatyl objectForKey:StringFromReportedRevData(str_instantlyData)];;

                //: NSString *cardid = [datatyl stringValueForKey:@"personCardId" defaultValue:@""];
                NSString *cardid = [datatyl value:StringFromReportedRevData(str_blackContent) withTing:@""];

                //: if ([[datatyl stringValueForKey:@"type" defaultValue:@"0"] boolValue]) {
                if ([[datatyl value:StringFromReportedRevData(str_equalExcitedName) withTing:@"0"] boolValue]) {
                    //: _tagLabel.text = @"群名片".nim_localized;
                    _tagLabel.text = StringFromReportedRevData(str_onlyAreaData).trapLocalized;

                    //: NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:cardid];
                    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:cardid];
                    //: [_imageView sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl?:@""] placeholderImage:[UIImage imageNamed:@"head_default"]];
                    [_imageView sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl?:@""] placeholderImage:[UIImage imageNamed:StringFromReportedRevData(str_basketballData)]];
                    //: _nameLabel.text = team.teamName ? : [NTESLanguageManager getTextWithKey:@"group_info_activity_group_already_jiesan"];
                    _nameLabel.text = team.teamName ? : [MaxInformation off:StringFromReportedRevData(str_altogetherName)];

                //: } else {
                } else {
                    //: _tagLabel.text = @"个人名片".nim_localized;
                    _tagLabel.text = StringFromReportedRevData(str_severTianContent).trapLocalized;
                    @
                     //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                     autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                                  ;
                    //: [[NIMSDK sharedSDK].userManager fetchUserInfos:@[cardid] completion:^(NSArray<NIMUser *> * _Nullable users, NSError * _Nullable error) {
                    [[NIMSDK sharedSDK].userManager fetchUserInfos:@[cardid] completion:^(NSArray<NIMUser *> * _Nullable users, NSError * _Nullable error) {

                        //: if (users.count) {
                        if (users.count) {
                            @
                             //: try{} @finally{} __typeof__(self) self = __weak_self__;
                             try{} @finally{} __typeof__(self) self = __weak_self__;
                                            ;
                            //: self.user = users.firstObject;
                            self.user = users.firstObject;
                            //: [_imageView sd_setImageWithURL:[NSURL URLWithString:self.user.userInfo.avatarUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
                            [_imageView sd_setImageWithURL:[NSURL URLWithString:self.user.userInfo.avatarUrl] placeholderImage:[UIImage imageNamed:StringFromReportedRevData(str_basketballData)]];
                            //: _nameLabel.text = self.user.userInfo.nickName ? : cardname;
                            _nameLabel.text = self.user.userInfo.nickName ? : cardname;
                        }
                    //: }];
                    }];

                }
            }
        }
    }

}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: CGFloat tableViewWidth = self.superview.nim_width;
    CGFloat tableViewWidth = self.superview.nim_width;
    //: CGSize contentSize = [self.model contentSize:tableViewWidth];
    CGSize contentSize = [self.model aggregation:tableViewWidth];
    //: CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, 50, 50);
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, 50, 50);
    //: self.imageView.frame = imageViewFrame;
    self.imageView.frame = imageViewFrame;

    //: CALayer *maskLayer = [CALayer layer];
    CALayer *maskLayer = [CALayer layer];
    //: maskLayer.cornerRadius = 13.0;
    maskLayer.cornerRadius = 13.0;
    //: maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    //: maskLayer.frame = self.imageView.bounds;
    maskLayer.frame = self.imageView.bounds;
    //: self.imageView.layer.mask = maskLayer;
    self.imageView.layer.mask = maskLayer;

    //: self.nameLabel.frame = CGRectMake(contentInsets.left + 60, contentInsets.top + 16, 150, 20);
    self.nameLabel.frame = CGRectMake(contentInsets.left + 60, contentInsets.top + 16, 150, 20);

    //: self.tagLabel.frame = CGRectMake(contentInsets.left, contentInsets.top + 60 + 15, 200, 10);
    self.tagLabel.frame = CGRectMake(contentInsets.left, contentInsets.top + 60 + 15, 200, 10);

    //: self.breakLabel.frame = CGRectMake(contentInsets.left, contentInsets.top + 60, contentSize.width, 0.5);
    self.breakLabel.frame = CGRectMake(contentInsets.left, contentInsets.top + 60, contentSize.width, 0.5);
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

//: @end
@end

Byte * ReportedRevDataToCache(Byte *data) {
    int statuteOwn = data[0];
    int correlationTable = data[1];
    Byte helpAdministrative = data[2];
    int speciallyOrigin = data[3];
    if (!statuteOwn) return data + speciallyOrigin;
    for (int i = speciallyOrigin; i < speciallyOrigin + correlationTable; i++) {
        int value = data[i] + helpAdministrative;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[speciallyOrigin + correlationTable] = 0;
    return data + speciallyOrigin;
}

NSString *StringFromReportedRevData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ReportedRevDataToCache(data)];
}
