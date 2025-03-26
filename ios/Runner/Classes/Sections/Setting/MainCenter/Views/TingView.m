
#import <Foundation/Foundation.h>

NSString *StringFromAttractBackgroundData(Byte *data);        


//: bill_adapter_type_1
Byte str_tableShowTitle[] = {50, 19, 16, 5, 6, 82, 89, 92, 92, 79, 81, 84, 81, 96, 100, 85, 98, 79, 100, 105, 96, 85, 79, 33, 213};


//: icon_redpacket_user_list
Byte str_cornerTitleName[] = {79, 24, 16, 6, 131, 239, 89, 83, 95, 94, 79, 98, 85, 84, 96, 81, 83, 91, 85, 100, 79, 101, 99, 85, 98, 79, 92, 89, 99, 100, 51};


//: bill_adapter_type_5
Byte str_scheduleImposeData[] = {46, 19, 83, 10, 223, 39, 79, 187, 12, 44, 15, 22, 25, 25, 12, 14, 17, 14, 29, 33, 18, 31, 12, 33, 38, 29, 18, 12, 226, 93};


//: #EAC37D
Byte str_imposeMediaContent[] = {64, 7, 52, 14, 41, 203, 51, 107, 10, 88, 246, 13, 101, 114, 239, 17, 13, 15, 255, 3, 16, 59};


//: bill_adapter_type_4
Byte str_schemeShowValue[] = {23, 19, 18, 10, 31, 59, 194, 58, 245, 127, 80, 87, 90, 90, 77, 79, 82, 79, 94, 98, 83, 96, 77, 98, 103, 94, 83, 77, 34, 187};


//: unknow
Byte str_weaponValue[] = {17, 6, 4, 4, 113, 106, 103, 106, 107, 115, 155};


//: createtime
Byte str_interventionData[] = {71, 10, 15, 8, 250, 104, 100, 160, 84, 99, 86, 82, 101, 86, 101, 90, 94, 86, 253};


//: type
Byte str_cornerName[] = {27, 4, 56, 14, 243, 80, 64, 44, 167, 89, 96, 11, 59, 143, 60, 65, 56, 45, 90};


//: amount
Byte str_dateBalanceData[] = {20, 6, 96, 6, 225, 136, 1, 13, 15, 21, 14, 20, 238};


//: bill_adapter_type_0
Byte str_frameMediaText[] = {79, 19, 21, 13, 49, 3, 109, 160, 254, 19, 60, 229, 216, 77, 84, 87, 87, 74, 76, 79, 76, 91, 95, 80, 93, 74, 95, 100, 91, 80, 74, 27, 4};


//: bill_adapter_type_6
Byte str_missingMagnitudeThousandValue[] = {14, 19, 74, 9, 98, 58, 216, 113, 156, 24, 31, 34, 34, 21, 23, 26, 23, 38, 42, 27, 40, 21, 42, 47, 38, 27, 21, 236, 38};


//: bill_adapter_type_2
Byte str_insertFrameTitle[] = {60, 19, 2, 6, 152, 202, 96, 103, 106, 106, 93, 95, 98, 95, 110, 114, 99, 112, 93, 114, 119, 110, 99, 93, 48, 87};


//: bill_adapter_type_3
Byte str_brotherProviderName[] = {17, 19, 61, 14, 205, 10, 200, 54, 127, 222, 197, 232, 211, 69, 37, 44, 47, 47, 34, 36, 39, 36, 51, 55, 40, 53, 34, 55, 60, 51, 40, 34, 246, 193};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TingView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/14.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESUserWalletListCell.h"
#import "TingView.h"

//: @implementation NTESUserWalletListCell
@implementation TingView

//: - (void)initSubviews{
- (void)initChangeByWill{

    //: UIImageView *imageView = [[UIImageView alloc] init];
    UIImageView *imageView = [[UIImageView alloc] init];
    //: imageView.image = [UIImage imageNamed:@"icon_redpacket_user_list"];
    imageView.image = [UIImage imageNamed:StringFromAttractBackgroundData(str_cornerTitleName)];
    //: [self addSubview:imageView];
    [self addSubview:imageView];
    //: [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(15);
        make.left.mas_offset(15);
        //: make.top.mas_offset(10);
        make.top.mas_offset(10);
        //: make.bottom.mas_offset(-10);
        make.bottom.mas_offset(-10);
        //: make.width.height.mas_equalTo(50);
        make.width.height.mas_equalTo(50);
    //: }];
    }];

    //: _titleLabel = [[UILabel alloc] init];
    _titleLabel = [[UILabel alloc] init];
    //: _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    //: _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textColor = [UIColor blackColor];
    //: [self addSubview:_titleLabel];
    [self addSubview:_titleLabel];
    //: [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.centerY.mas_offset(-12);
        make.centerY.mas_offset(-12);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_equalTo(20);
        make.height.mas_equalTo(20);
        //: make.left.mas_equalTo(imageView.mas_right).mas_offset(5);
        make.left.mas_equalTo(imageView.mas_right).mas_offset(5);
    //: }];
    }];

    //: _timeLabel = [[UILabel alloc] init];
    _timeLabel = [[UILabel alloc] init];
    //: _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    //: _timeLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textColor = [UIColor lightGrayColor];
    //: [self addSubview:_timeLabel];
    [self addSubview:_timeLabel];
    //: [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.centerY.mas_offset(12);
        make.centerY.mas_offset(12);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_equalTo(20);
        make.height.mas_equalTo(20);
        //: make.left.mas_equalTo(imageView.mas_right).mas_offset(5);
        make.left.mas_equalTo(imageView.mas_right).mas_offset(5);
    //: }];
    }];

    //: _amountLabel = [[UILabel alloc] init];
    _amountLabel = [[UILabel alloc] init];
    //: _amountLabel.font = [UIFont boldSystemFontOfSize:20];
    _amountLabel.font = [UIFont boldSystemFontOfSize:20];
    //: _amountLabel.textColor = [UIColor blackColor];
    _amountLabel.textColor = [UIColor blackColor];
    //: _amountLabel.textAlignment = NSTextAlignmentRight;
    _amountLabel.textAlignment = NSTextAlignmentRight;
    //: [self addSubview:_amountLabel];
    [self addSubview:_amountLabel];
    //: [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_equalTo(30);
        make.height.mas_equalTo(30);
        //: make.right.mas_offset(-15);
        make.right.mas_offset(-15);
    //: }];
    }];

}

//: -(void)reloadWithInformation:(NSDictionary *)information{
-(void)heritage:(NSDictionary *)information{
    //: NSString *amount = [information newStringValueForKey:@"amount"];
    NSString *amount = [information cord:StringFromAttractBackgroundData(str_dateBalanceData)];
    //: NSString *type = [information newStringValueForKey:@"type"];
    NSString *type = [information cord:StringFromAttractBackgroundData(str_cornerName)];
    //: if (type.integerValue == 1 || type.integerValue == 2 || type.integerValue == 3) {
    if (type.integerValue == 1 || type.integerValue == 2 || type.integerValue == 3) {
        //: amount = [NSString stringWithFormat:@"-%@",amount];
        amount = [NSString stringWithFormat:@"-%@",amount];
        //: _amountLabel.textColor = [UIColor blackColor];
        _amountLabel.textColor = [UIColor blackColor];
    //: }else{
    }else{
        //: amount = [NSString stringWithFormat:@"+%@",amount];
        amount = [NSString stringWithFormat:@"+%@",amount];
        //: _amountLabel.textColor = [UIColor colorWithHexString:@"#EAC37D"];
        _amountLabel.textColor = [UIColor direction:StringFromAttractBackgroundData(str_imposeMediaContent)];
    }

    //: _titleLabel.text = [self getName:information];
    _titleLabel.text = [self canAcross:information];
    //: _timeLabel.text = [information newStringValueForKey:@"createtime"];
    _timeLabel.text = [information cord:StringFromAttractBackgroundData(str_interventionData)];

    //: _amountLabel.text = amount;
    _amountLabel.text = amount;
}

//: -(NSString *)getName:(NSDictionary *)information{
-(NSString *)canAcross:(NSDictionary *)information{
    //: NSString *type = [information newStringValueForKey:@"type"];
    NSString *type = [information cord:StringFromAttractBackgroundData(str_cornerName)];

    //: switch (type.integerValue) {
    switch (type.integerValue) {
        //: case 0:
        case 0:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_0"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_frameMediaText)];
            //: break;
            break;
        //: case 1:
        case 1:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_1"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_tableShowTitle)];
            //: break;
            break;
        //: case 2:
        case 2:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_2"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_insertFrameTitle)];
            //: break;
            break;
        //: case 3:
        case 3:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_3"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_brotherProviderName)];
            //: break;
            break;
        //: case 4:
        case 4:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_4"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_schemeShowValue)];
            //: break;
            break;
        //: case 5:
        case 5:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_5"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_scheduleImposeData)];
            //: break;
            break;
        //: case 6:
        case 6:
            //: return [NTESLanguageManager getTextWithKey:@"bill_adapter_type_6"];
            return [MaxInformation off:StringFromAttractBackgroundData(str_missingMagnitudeThousandValue)];
            //: break;
            break;
        //: default:
        default:
            //: return @"unknow";
            return StringFromAttractBackgroundData(str_weaponValue);
            //: break;
            break;
    }
}

//类型:0=充值,1=提现,2=转账,3=发红包,4=收红包,5=红包退款,6=签到奖励

//: @end
@end

Byte * AttractBackgroundDataToCache(Byte *data) {
    int spit = data[0];
    int textAmbleLength = data[1];
    Byte luckyMissing = data[2];
    int brother = data[3];
    if (!spit) return data + brother;
    for (int i = brother; i < brother + textAmbleLength; i++) {
        int value = data[i] + luckyMissing;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[brother + textAmbleLength] = 0;
    return data + brother;
}

NSString *StringFromAttractBackgroundData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AttractBackgroundDataToCache(data)];
}
