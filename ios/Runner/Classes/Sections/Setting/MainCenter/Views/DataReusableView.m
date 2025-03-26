
#import <Foundation/Foundation.h>

NSString *StringFromGestureData(Byte *data);


//: 666666
Byte str_lowData[] = {70, 6, 5, 5, 199, 59, 59, 59, 59, 59, 59, 95};


//: 中东小王子
Byte str_missingImprovementTitle[] = {40, 15, 11, 5, 211, 239, 195, 184, 239, 195, 167, 240, 187, 154, 242, 153, 150, 240, 184, 155, 39};


//: login_logo
Byte str_orationChickenName[] = {78, 10, 80, 7, 13, 191, 34, 188, 191, 183, 185, 190, 175, 188, 191, 183, 191, 140};


//: #333333
Byte str_rideSendTitle[] = {89, 7, 13, 5, 252, 48, 64, 64, 64, 64, 64, 64, 227};


//: login_bg
Byte str_goingThreadData[] = {19, 8, 11, 9, 190, 79, 104, 36, 62, 119, 122, 114, 116, 121, 106, 109, 114, 78};


//: 来一个摇滚表演
Byte str_tropicAttractValue[] = {24, 21, 36, 6, 50, 104, 10, 193, 201, 8, 220, 164, 8, 220, 206, 10, 181, 171, 10, 223, 190, 12, 197, 204, 10, 224, 184, 50};

// __DEBUG__
// __CLOSE_PRINT__
//
//  DataReusableView.m
//  NIM
//
//  Created by Yan Wang on 2024/6/26.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESVideolistCollectionViewCell.h"
#import "DataReusableView.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"

//: @implementation NTESVideolistCollectionViewCell
@implementation DataReusableView


//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: [self setUp];
        [self atImage];
    }
    //: return self;
    return self;
}

//: - (void)setUp
- (void)atImage
{
    //: CGFloat spacing = 15;
    CGFloat spacing = 15;//行、列 间距
    //: int totalloc = 2;
    int totalloc = 2;//列数
    //: CGFloat appvieww = ([[UIScreen mainScreen] bounds].size.width - spacing*3)/totalloc;
    CGFloat appvieww = ([[UIScreen mainScreen] bounds].size.width - spacing*3)/totalloc;

    //: _picImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, appvieww, appvieww*1.3)];
    _picImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, appvieww, appvieww*1.3)];
    //: _picImg.image = [UIImage imageNamed:@"login_bg"];
    _picImg.image = [UIImage imageNamed:StringFromGestureData(str_goingThreadData)];
    //: [self.contentView addSubview:_picImg];
    [self.contentView addSubview:_picImg];

    //: _labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, _picImg.bottom+12, appvieww, 15)];
    _labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, _picImg.bottom+12, appvieww, 15)];
    //: _labtitle.font = [UIFont systemFontOfSize:12.f];
    _labtitle.font = [UIFont systemFontOfSize:12.f];
    //: _labtitle.textColor = [UIColor colorWithHexString:@"#333333"];
    _labtitle.textColor = [UIColor direction:StringFromGestureData(str_rideSendTitle)];
    //: _labtitle.text = @"来一个摇滚表演";
    _labtitle.text = StringFromGestureData(str_tropicAttractValue);
    //: [self.contentView addSubview:_labtitle];
    [self.contentView addSubview:_labtitle];

    //: _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, _labtitle.bottom+5, 16, 16)];
    _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, _labtitle.bottom+5, 16, 16)];
    //: _headImg.image = [UIImage imageNamed:@"login_logo"];
    _headImg.image = [UIImage imageNamed:StringFromGestureData(str_orationChickenName)];
    //: [self.contentView addSubview:_headImg];
    [self.contentView addSubview:_headImg];

    //: _labname = [[UILabel alloc]initWithFrame:CGRectMake(_headImg.right+5, _labtitle.bottom+5, appvieww, 16)];
    _labname = [[UILabel alloc]initWithFrame:CGRectMake(_headImg.right+5, _labtitle.bottom+5, appvieww, 16)];
    //: _labname.font = [UIFont systemFontOfSize:11.f];
    _labname.font = [UIFont systemFontOfSize:11.f];
    //: _labname.textColor = [UIColor colorWithHexString:@"666666"];
    _labname.textColor = [UIColor direction:StringFromGestureData(str_lowData)];
    //: _labname.text = @"中东小王子";
    _labname.text = StringFromGestureData(str_missingImprovementTitle);
    //: [self.contentView addSubview:_labname];
    [self.contentView addSubview:_labname];

}

//: @end
@end

Byte * GestureDataToCache(Byte *data) {
    int nameImage = data[0];
    int priseTing = data[1];
    Byte kickName = data[2];
    int dataName = data[3];
    if (!nameImage) return data + dataName;
    for (int i = dataName; i < dataName + priseTing; i++) {
        int value = data[i] - kickName;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[dataName + priseTing] = 0;
    return data + dataName;
}

NSString *StringFromGestureData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)GestureDataToCache(data)];
}
