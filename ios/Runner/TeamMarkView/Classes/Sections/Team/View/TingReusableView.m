
#import <Foundation/Foundation.h>
typedef struct {
    Byte proteosome;
    Byte *genreSkill;
    unsigned int establish;
    bool threadFish;
	int tuckFed;
	int fileSkill;
	int spanishTamarind;
} MainlyData;

NSString *StringFromMainlyData(MainlyData *data);


//: Group_Me
MainlyData str_suspectTitle = (MainlyData){115, (Byte []){52, 1, 28, 6, 3, 44, 62, 22, 58}, 8, false, 7, 98, 7};


//: icon_avatar_del
MainlyData str_bandData = (MainlyData){37, (Byte []){76, 70, 74, 75, 122, 68, 83, 68, 81, 68, 87, 122, 65, 64, 73, 119}, 15, false, 239, 116, 57};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamCardHeaderCell.m
//  NIM
//
//  Created by chris on 15/3/7.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBCardHeaderCell.h"
#import "TingReusableView.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "BBBTeamHelper.h"
#import "LanguageChild.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"

//: @interface BBBCardHeaderCell()
@interface TingReusableView()

//: @property (nonatomic,strong) id<NIMKitCardHeaderData> data;
@property (nonatomic,strong) id<WithChild> data;

//: @end
@end

//: @implementation BBBCardHeaderCell
@implementation TingReusableView

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: _imageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
        _imageView = [[AvatarControl alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];
        //: _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _titleLabel.font = [UIFont systemFontOfSize:13.f];
        _titleLabel.font = [UIFont systemFontOfSize:13.f];
        //: _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        //: _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];
        //: _roleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _roleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //: [self addSubview:_roleImageView];
        [self addSubview:_roleImageView];
        //: _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: _removeBtn.hidden = YES;
        _removeBtn.hidden = YES;
        //: [_removeBtn setImage:[UIImage imageNamed:@"icon_avatar_del"] forState:UIControlStateNormal];
        [_removeBtn setImage:[UIImage imageNamed:StringFromMainlyData(&str_bandData)] forState:UIControlStateNormal];
        //: [_removeBtn sizeToFit];
        [_removeBtn sizeToFit];
        //: [_removeBtn addTarget:self action:@selector(onTouchRemoveBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_removeBtn addTarget:self action:@selector(pickUp:) forControlEvents:UIControlEventTouchUpInside];
        //: [self addSubview:_removeBtn];
        [self addSubview:_removeBtn];
    }
    //: return self;
    return self;
}

//: - (void)refreshData:(id<NIMKitCardHeaderData>)data{
- (void)text:(id<WithChild>)data{
    //: self.data = data;
    self.data = data;
    //: NSURL *url = [NSURL URLWithString:data.imageUrl];
    NSURL *url = [NSURL URLWithString:data.imageUrl];
    //: [self.imageView nim_setImageWithURL:url placeholderImage:data.imageNormal];
    [self.imageView title:url sumeract:data.imageNormal];
    //: [self.imageView addTarget:self action:@selector(onSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.imageView addTarget:self action:@selector(recorded:) forControlEvents:UIControlEventTouchUpInside];

    //: NSString *showName = data.title;
    NSString *showName = data.title;
    //: if ([data isMyUserId]) {
    if ([data isMyUserId]) {
        //: showName = [NTESLanguageManager getTextWithKey:@"Group_Me"];
        showName = [MaxInformation off:StringFromMainlyData(&str_suspectTitle)];//@"我".nim_localized;
    }
    //: self.titleLabel.text = showName;
    self.titleLabel.text = showName;
    //: self.roleImageView.image = [BBBTeamHelper imageWithMemberType:data.userType];
    self.roleImageView.image = [LanguageChild beVoice:data.userType];
    //: [self.titleLabel sizeToFit];
    [self.titleLabel sizeToFit];
}

//: - (void)onSelected:(id)sender{
- (void)recorded:(id)sender{
    //: if ([self.delegate respondsToSelector:@selector(cellDidSelected:)]) {
    if ([self.delegate respondsToSelector:@selector(views:)]) {
        //: [self.delegate cellDidSelected:self];
        [self.delegate views:self];
    }
}

//: - (void)onTouchRemoveBtn:(id)sender{
- (void)pickUp:(id)sender{
    //: if ([self.delegate respondsToSelector:@selector(cellShouldBeRemoved:)]) {
    if ([self.delegate respondsToSelector:@selector(imaged:)]) {
        //: [self.delegate cellShouldBeRemoved:self];
        [self.delegate imaged:self];
    }
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.imageView.nim_centerX = self.nim_width * .5f;
    self.imageView.nim_centerX = self.nim_width * .5f;
    //: self.titleLabel.nim_width = self.nim_width + 10;
    self.titleLabel.nim_width = self.nim_width + 10;
    //: self.titleLabel.nim_bottom = self.nim_height;
    self.titleLabel.nim_bottom = self.nim_height;
    //: self.titleLabel.nim_centerX = self.nim_width * .5f;
    self.titleLabel.nim_centerX = self.nim_width * .5f;
    //: [self.roleImageView sizeToFit];
    [self.roleImageView sizeToFit];
    //: self.roleImageView.nim_bottom = self.imageView.nim_bottom;
    self.roleImageView.nim_bottom = self.imageView.nim_bottom;
    //: self.roleImageView.nim_right = self.imageView.nim_right;
    self.roleImageView.nim_right = self.imageView.nim_right;
    //: self.removeBtn.nim_right = self.nim_width;
    self.removeBtn.nim_right = self.nim_width;

}

//: @end
@end

Byte *MainlyDataToByte(MainlyData *data) {
    if (data->threadFish) return data->genreSkill;
    for (int i = 0; i < data->establish; i++) {
        data->genreSkill[i] ^= data->proteosome;
    }
    data->genreSkill[data->establish] = 0;
    data->threadFish = true;
	if (data->establish >= 3) {
		data->tuckFed = data->genreSkill[0];
		data->fileSkill = data->genreSkill[1];
		data->spanishTamarind = data->genreSkill[2];
	}
    return data->genreSkill;
}

NSString *StringFromMainlyData(MainlyData *data) {
    return [NSString stringWithUTF8String:(char *)MainlyDataToByte(data)];
}
