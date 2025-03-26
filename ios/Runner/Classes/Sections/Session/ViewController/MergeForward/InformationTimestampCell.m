
#import <Foundation/Foundation.h>
typedef struct {
    Byte domainName;
    Byte *sharedLow;
    unsigned int suraSend;
    bool mansionLow;
} PowderHareData;

NSString *StringFromPowderHareData(PowderHareData *data);


//: yyyy-MM-dd
PowderHareData str_brotherName = (PowderHareData){148, (Byte []){237, 237, 237, 237, 185, 217, 217, 185, 240, 240, 247}, 10, false};

// __DEBUG__
// __CLOSE_PRINT__
//
//  InformationTimestampCell.m
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESTimestampCell.h"
#import "InformationTimestampCell.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "BBBTimestampModel.h"
#import "FromTap.h"

//: @interface NTESTimestampCell ()
@interface InformationTimestampCell ()

//: @property (nonatomic, strong) UIView *lineLeft;
@property (nonatomic, strong) UIView *lineLeft;
//: @property (nonatomic, strong) UIView *lineRight;
@property (nonatomic, strong) UIView *lineRight;

//: @end
@end

//: @implementation NTESTimestampCell
@implementation InformationTimestampCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    //: if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //: [self.timeBGView removeFromSuperview];
        [self.timeBGView removeFromSuperview];
        //: self.timeLabel.textColor = [AppleProjectKit sharedKit].config.nickColor;
        self.timeLabel.textColor = [Indicator reach].config.nickColor;
        //: self.backgroundColor = [UIColor colorWithRed:((float)((0xfefefe & 0xFF0000) >> 16))/255.0 green:((float)((0xfefefe & 0x00FF00) >> 8))/255.0 blue:((float)(0xfefefe & 0x0000FF))/255.0 alpha:1.0];
        self.backgroundColor = [UIColor colorWithRed:((float)((0xfefefe & 0xFF0000) >> 16))/255.0 green:((float)((0xfefefe & 0x00FF00) >> 8))/255.0 blue:((float)(0xfefefe & 0x0000FF))/255.0 alpha:1.0];
        //: [self.contentView addSubview:self.lineLeft];
        [self.contentView addSubview:self.lineLeft];
        //: [self.contentView addSubview:self.lineRight];
        [self.contentView addSubview:self.lineRight];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat padding = 8.0;
    CGFloat padding = 8.0;
    //: self.timeLabel.centerY = self.height/2;
    self.timeLabel.centerY = self.height/2;
    //: _lineLeft.frame = CGRectMake(padding, 0.0, self.timeLabel.left - padding*2, 1.0);
    _lineLeft.frame = CGRectMake(padding, 0.0, self.timeLabel.left - padding*2, 1.0);
    //: _lineLeft.centerY = self.timeLabel.centerY;
    _lineLeft.centerY = self.timeLabel.centerY;
    //: _lineRight.frame = CGRectMake(self.timeLabel.right + padding, 0, self.width - self.timeLabel.right - 2*padding, 1.0);
    _lineRight.frame = CGRectMake(self.timeLabel.right + padding, 0, self.width - self.timeLabel.right - 2*padding, 1.0);
    //: _lineRight.centerY = self.timeLabel.centerY;
    _lineRight.centerY = self.timeLabel.centerY;
}

//: - (void)refreshData:(BBBTimestampModel *)data {
- (void)queryed:(FromTap *)data {
    //: if ([data isKindOfClass:[BBBTimestampModel class]]) {
    if ([data isKindOfClass:[FromTap class]]) {
        //: self.timeLabel.text = [self timeFormatString:data.messageTime];
        self.timeLabel.text = [self tap:data.messageTime];
    }
}

//: - (NSString *)timeFormatString:(NSTimeInterval)timestamp {
- (NSString *)tap:(NSTimeInterval)timestamp {
    //: NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //: NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //: [formatter setDateFormat:@"yyyy-MM-dd"];
    [formatter setDateFormat:StringFromPowderHareData(&str_brotherName)];
    //: return [formatter stringFromDate: date];
    return [formatter stringFromDate: date];
}

//: #pragma mark - Getter
#pragma mark - Getter
//: - (UIView *)lineLeft {
- (UIView *)lineLeft {
    //: if (!_lineLeft) {
    if (!_lineLeft) {
        //: _lineLeft = [self setupLine];
        _lineLeft = [self holder];
    }
    //: return _lineLeft;
    return _lineLeft;
}

//: - (UIView *)lineRight {
- (UIView *)lineRight {
    //: if (!_lineRight) {
    if (!_lineRight) {
        //: _lineRight = [self setupLine];
        _lineRight = [self holder];
    }
    //: return _lineRight;
    return _lineRight;
}

//: - (UIView *)setupLine {
- (UIView *)holder {
    //: UIView *ret = [[UIView alloc] init];
    UIView *ret = [[UIView alloc] init];
    //: ret.backgroundColor = [UIColor systemGroupedBackgroundColor];
    ret.backgroundColor = [UIColor systemGroupedBackgroundColor];
    //: return ret;
    return ret;
}

//: @end
@end

Byte *PowderHareDataToByte(PowderHareData *data) {
    if (data->mansionLow) return data->sharedLow;
    for (int i = 0; i < data->suraSend; i++) {
        data->sharedLow[i] ^= data->domainName;
    }
    data->sharedLow[data->suraSend] = 0;
    data->mansionLow = true;
    return data->sharedLow;
}

NSString *StringFromPowderHareData(PowderHareData *data) {
    return [NSString stringWithUTF8String:(char *)PowderHareDataToByte(data)];
}
