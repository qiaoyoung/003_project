
#import <Foundation/Foundation.h>

NSString *StringFromRecentProviderData(Byte *data);


//: icon_muti_clients
Byte str_thatModeContent[] = {43, 17, 85, 11, 34, 73, 77, 163, 214, 180, 239, 190, 184, 196, 195, 180, 194, 202, 201, 190, 180, 184, 193, 190, 186, 195, 201, 200, 91};


//: icon_arrow
Byte str_byChangeKickData[] = {84, 10, 89, 5, 169, 194, 188, 200, 199, 184, 186, 203, 203, 200, 208, 17};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamView.m
//  NIM
//
//  Created by chris on 15/7/22.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMutiClientsHeaderView.h"
#import "TeamView.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"

//: @interface NTESMutiClientsHeaderView()
@interface TeamView()

//: @property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UIImageView *icon;

//: @property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UILabel *label;

//: @property (nonatomic,strong) UIButton *accessoryBtn;
@property (nonatomic,strong) UIButton *accessoryBtn;

//: @end
@end

//: @implementation NTESMutiClientsHeaderView
@implementation TeamView

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //: _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_muti_clients"]];
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:StringFromRecentProviderData(str_thatModeContent)]];
        //: [self addSubview:_icon];
        [self addSubview:_icon];

        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.textColor = [UIColor colorWithRed:((float)((0x888888 & 0xFF0000) >> 16))/255.0 green:((float)((0x888888 & 0x00FF00) >> 8))/255.0 blue:((float)(0x888888 & 0x0000FF))/255.0 alpha:1.0];
        _label.textColor = [UIColor colorWithRed:((float)((0x888888 & 0xFF0000) >> 16))/255.0 green:((float)((0x888888 & 0x00FF00) >> 8))/255.0 blue:((float)(0x888888 & 0x0000FF))/255.0 alpha:1.0];
        //: _label.font = [UIFont boldSystemFontOfSize:14.f];
        _label.font = [UIFont boldSystemFontOfSize:14.f];
        //: [self addSubview:_label];
        [self addSubview:_label];

        //: _accessoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _accessoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_accessoryBtn setImage:[UIImage imageNamed:@"icon_arrow"] forState:UIControlStateNormal];
        [_accessoryBtn setImage:[UIImage imageNamed:StringFromRecentProviderData(str_byChangeKickData)] forState:UIControlStateNormal];
        //: [_accessoryBtn sizeToFit];
        [_accessoryBtn sizeToFit];
        //: [self addSubview:_accessoryBtn];
        [self addSubview:_accessoryBtn];
    }
    //: return self;
    return self;
}

//: CGFloat TextPadding = 17.f;
CGFloat k_iconContent = 17.f;
//: - (CGSize)sizeThatFits:(CGSize)size{
- (CGSize)sizeThatFits:(CGSize)size{
    //: [self.label sizeToFit];
    [self.label sizeToFit];
    //: CGSize contentSize = self.label.frame.size;
    CGSize contentSize = self.label.frame.size;
    //: return CGSizeMake(self.width, contentSize.height + TextPadding * 2);
    return CGSizeMake(self.width, contentSize.height + k_iconContent * 2);
}


//: #pragma mark - NTESSessionListHeaderView
#pragma mark - NTESSessionListHeaderView
//: - (void)setContentText:(NSString *)content{
- (void)setRecentIndex:(NSString *)content{
    //: self.label.text = content;
    self.label.text = content;
}


//: CGFloat IconLeft = 10.f;
CGFloat k_itemValue = 10.f;
//: CGFloat IconAndContentSpacing = 10.f;
CGFloat k_borderEventData = 10.f;
//: CGFloat ArrowRight = 12.f;
CGFloat k_needName = 12.f;
//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.icon.left = IconLeft;
    self.icon.left = k_itemValue;
    //: self.icon.centerY = self.height * .5f;
    self.icon.centerY = self.height * .5f;
    //: self.label.left = self.icon.right + IconAndContentSpacing;
    self.label.left = self.icon.right + k_borderEventData;
    //: self.label.centerY = self.height * .5f;
    self.label.centerY = self.height * .5f;
    //: self.accessoryBtn.right = self.width - ArrowRight;
    self.accessoryBtn.right = self.width - k_needName;
    //: self.accessoryBtn.centerY = self.height * .5f;
    self.accessoryBtn.centerY = self.height * .5f;
}

//: @end
@end

Byte * RecentProviderDataToCache(Byte *data) {
    int trailhead = data[0];
    int database = data[1];
    Byte labWith = data[2];
    int recordPost = data[3];
    if (!trailhead) return data + recordPost;
    for (int i = recordPost; i < recordPost + database; i++) {
        int value = data[i] - labWith;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[recordPost + database] = 0;
    return data + recordPost;
}

NSString *StringFromRecentProviderData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)RecentProviderDataToCache(data)];
}
