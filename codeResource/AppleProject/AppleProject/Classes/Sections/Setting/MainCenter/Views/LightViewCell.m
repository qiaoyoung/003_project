
#import <Foundation/Foundation.h>

NSString *StringFromDevaluedData(Byte *data);


//: lang
Byte str_labNeedTitle[] = {37, 4, 1, 11, 203, 47, 147, 63, 86, 232, 248, 109, 98, 111, 104, 191};


//: F9F9F9
Byte str_blocText[] = {53, 6, 61, 9, 106, 21, 13, 222, 46, 131, 118, 131, 118, 131, 118, 189};

// __DEBUG__
// __CLOSE_PRINT__
//
//  LightViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESLanguageTableViewCell.h"
#import "LightViewCell.h"

//: @implementation NTESLanguageTableViewCell
@implementation LightViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if ([self.reuseIdentifier isEqualToString:@"lang"]) {
    if ([self.reuseIdentifier isEqualToString:StringFromDevaluedData(str_labNeedTitle)]) {

        //: [self.contentView addSubview:self.labTitle];
        [self.contentView addSubview:self.labTitle];
        //: self.labTitle.frame = CGRectMake(15, 0, [[UIScreen mainScreen] bounds].size.width-60, 44);
        self.labTitle.frame = CGRectMake(15, 0, [[UIScreen mainScreen] bounds].size.width-60, 44);
        //: [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.lineView];
        //: self.lineView.frame = CGRectMake(15, 43.5, [[UIScreen mainScreen] bounds].size.width-60, 0.5);
        self.lineView.frame = CGRectMake(15, 43.5, [[UIScreen mainScreen] bounds].size.width-60, 0.5);
        //: self.layer.cornerRadius = 12;
        self.layer.cornerRadius = 12;
    }
    //: return self;
    return self;
}


//: - (UILabel *)labTitle {
- (UILabel *)labTitle {
    //: if (!_labTitle) {
    if (!_labTitle) {
        //: _labTitle = [[UILabel alloc] init];
        _labTitle = [[UILabel alloc] init];
        //: _labTitle.font = [UIFont systemFontOfSize:16.f];
        _labTitle.font = [UIFont systemFontOfSize:16.f];
        //: _labTitle.textColor = [UIColor blackColor];
        _labTitle.textColor = [UIColor blackColor];
        //: _labTitle.textAlignment = NSTextAlignmentLeft;
        _labTitle.textAlignment = NSTextAlignmentLeft;
    }
    //: return _labTitle;
    return _labTitle;
}

//: - (UIView *)lineView {
- (UIView *)lineView {
    //: if (!_lineView) {
    if (!_lineView) {
        //: _lineView = [[UIView alloc] init];
        _lineView = [[UIView alloc] init];
        //: _lineView.backgroundColor = [UIColor colorWithHexString:@"F9F9F9"];
        _lineView.backgroundColor = [UIColor direction:StringFromDevaluedData(str_blocText)];
    }
    //: return _lineView;
    return _lineView;
}

//: @end
@end

Byte * DevaluedDataToCache(Byte *data) {
    int linkQuantity = data[0];
    int k = data[1];
    Byte according = data[2];
    int metadata = data[3];
    if (!linkQuantity) return data + metadata;
    for (int i = metadata; i < metadata + k; i++) {
        int value = data[i] - according;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[metadata + k] = 0;
    return data + metadata;
}

NSString *StringFromDevaluedData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DevaluedDataToCache(data)];
}
