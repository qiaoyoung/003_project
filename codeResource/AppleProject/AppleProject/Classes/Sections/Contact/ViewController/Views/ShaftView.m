
#import <Foundation/Foundation.h>

NSString *StringFromLinkData(Byte *data);


//: #F7F8FB
Byte str_providerText[] = {30, 7, 23, 12, 54, 93, 67, 33, 246, 207, 239, 225, 58, 93, 78, 93, 79, 93, 89, 49};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ShaftView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/27.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactTableHeader.h"
#import "ShaftView.h"

//: @implementation NTESContactTableHeader
@implementation ShaftView

//: -(instancetype)init{
-(instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [UIColor colorWithHexString:@"#F7F8FB"];
        self.backgroundColor = [UIColor direction:StringFromLinkData(str_providerText)];

        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.textColor = [UIColor lightGrayColor];
        //: _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];
        //: [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.centerY.mas_offset(0);
            make.centerY.mas_offset(0);
            //: make.left.mas_offset(18);
            make.left.mas_offset(18);
            //: make.width.mas_equalTo(100);
            make.width.mas_equalTo(100);
            //: make.height.mas_equalTo(15);
            make.height.mas_equalTo(15);
        //: }];
        }];
    }
    //: return self;
    return self;
}

//: @end
@end




//: @implementation NTESContactTableHeaderGroup
@implementation TableTitleView

//: -(instancetype)init{
-(instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [UIColor colorWithHexString:@"#F7F8FB"];
        self.backgroundColor = [UIColor direction:StringFromLinkData(str_providerText)];

        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
        //: _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];
        //: [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.centerY.mas_offset(0);
            make.centerY.mas_offset(0);
            //: make.left.mas_offset(18);
            make.left.mas_offset(18);
            //: make.width.mas_equalTo(200);
            make.width.mas_equalTo(200);
            //: make.height.mas_equalTo(30);
            make.height.mas_equalTo(30);
        //: }];
        }];


        //: _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView = [[UIImageView alloc] init];
        //: [self addSubview:_arrowImageView];
        [self addSubview:_arrowImageView];
        //: [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.centerY.mas_offset(0);
            make.centerY.mas_offset(0);
            //: make.right.mas_offset(-15);
            make.right.mas_offset(-15);
            //: make.width.mas_equalTo(14);
            make.width.mas_equalTo(14);
            //: make.height.mas_equalTo(8);
            make.height.mas_equalTo(8);
        //: }];
        }];

        //: UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(loadded:) forControlEvents:UIControlEventTouchUpInside];
        //: [self addSubview:button];
        [self addSubview:button];
        //: [button mas_makeConstraints:^(MASConstraintMaker *make) {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.left.mas_offset(0);
            make.left.mas_offset(0);
            //: make.top.mas_offset(0);
            make.top.mas_offset(0);
            //: make.bottom.mas_offset(0);
            make.bottom.mas_offset(0);
            //: make.right.mas_offset(0);
            make.right.mas_offset(0);
        //: }];
        }];
    }
    //: return self;
    return self;
}

//: -(void)buttonClick:(UIButton *)sender{
-(void)loadded:(UIButton *)sender{
    //: if (self.delegate && [self.delegate respondsToSelector:@selector(headerClickWith:)]) {
    if (self.delegate && [self.delegate respondsToSelector:@selector(myCells:)]) {
        //: [self.delegate headerClickWith:self.section];
        [self.delegate myCells:self.section];
    }
}

//: @end
@end

Byte * LinkDataToCache(Byte *data) {
    int shared = data[0];
    int attorneyClientRelation = data[1];
    Byte insert = data[2];
    int scheme = data[3];
    if (!shared) return data + scheme;
    for (int i = scheme; i < scheme + attorneyClientRelation; i++) {
        int value = data[i] - insert;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[scheme + attorneyClientRelation] = 0;
    return data + scheme;
}

NSString *StringFromLinkData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)LinkDataToCache(data)];
}
