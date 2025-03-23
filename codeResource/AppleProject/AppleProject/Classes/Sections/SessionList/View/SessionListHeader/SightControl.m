
#import <Foundation/Foundation.h>

NSString *StringFromSumData(Byte *data);


//: ic-waring
Byte str_imagePostData[] = {12, 9, 8, 205, 132, 21, 22, 67, 103, 110, 105, 114, 97, 119, 45, 99, 105, 66};


//: #FF483D
Byte str_dataSessionName[] = {73, 7, 5, 248, 117, 68, 51, 56, 52, 70, 70, 35, 121};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESNetStatusHeaderView.m
//  NIM
//
//  Created by chris on 15/7/22.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESTextHeaderView.h"
#import "SightControl.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"

//: @implementation NTESTextHeaderView
@implementation SightControl

//: - (instancetype) initWithFrame:(CGRect)frame{
- (instancetype) initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.textColor = [UIColor colorWithHexString:@"#FF483D"];
        _label.textColor = [UIColor direction:StringFromSumData(str_dataSessionName)];
        //: _label.font = [UIFont systemFontOfSize:12.f];
        _label.font = [UIFont systemFontOfSize:12.f];
        //: [self addSubview:_label];
        [self addSubview:_label];

        //: _img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic-waring"]];
        _img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:StringFromSumData(str_imagePostData)]];
        //: [self addSubview:_img];
        [self addSubview:_img];
    }
    //: return self;
    return self;
}

//: - (void)setContentText:(NSString *)content{
- (void)setRecentIndex:(NSString *)content{
    //: self.label.text = content;
    self.label.text = content;
}


//: - (CGSize)sizeThatFits:(CGSize)size{
- (CGSize)sizeThatFits:(CGSize)size{
    //: [self.label sizeToFit];
    [self.label sizeToFit];
    //: CGSize contentSize = self.label.frame.size;
    CGSize contentSize = self.label.frame.size;
    //: return CGSizeMake(self.width, contentSize.height + 10 * 2);
    return CGSizeMake(self.width, contentSize.height + 10 * 2);
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.label.centerX = self.width * .5f;
    self.label.centerX = self.width * .5f;
    //: self.label.centerY = self.height * .5f;
    self.label.centerY = self.height * .5f;
    //: self.img.centerY = self.height * .5f;
    self.img.centerY = self.height * .5f;
    //: self.img.right = self.label.left -10;
    self.img.right = self.label.left -10;
}

//: @end
@end

Byte * SumDataToCache(Byte *data) {
    int sendLinkInput = data[0];
    int pastBottom = data[1];
    int mutual = data[2];
    if (!sendLinkInput) return data + mutual;
    for (int i = 0; i < pastBottom / 2; i++) {
        int begin = mutual + i;
        int end = mutual + pastBottom - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[mutual + pastBottom] = 0;
    return data + mutual;
}

NSString *StringFromSumData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SumDataToCache(data)];
}  
