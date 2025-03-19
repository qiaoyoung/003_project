//
//  NTESUserWalletListCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/14.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESUserWalletListCell.h"

@implementation NTESUserWalletListCell

- (void)initSubviews{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"icon_redpacket_user_list"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(10);
        make.bottom.mas_offset(-10);
        make.width.height.mas_equalTo(50);
    }];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor blackColor];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(-12);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(imageView.mas_right).mas_offset(5);
    }];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(12);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(imageView.mas_right).mas_offset(5);
    }];
    
    _amountLabel = [[UILabel alloc] init];
    _amountLabel.font = [UIFont boldSystemFontOfSize:20];
    _amountLabel.textColor = [UIColor blackColor];
    _amountLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_amountLabel];
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
        make.right.mas_offset(-15);
    }];
    
}

-(void)reloadWithInformation:(NSDictionary *)information{
    NSString *amount = [information newStringValueForKey:@"amount"];
    NSString *type = [information newStringValueForKey:@"type"];
    if (type.integerValue == 1 || type.integerValue == 2 || type.integerValue == 3) {
        amount = [NSString stringWithFormat:@"-%@",amount];
        _amountLabel.textColor = [UIColor blackColor];
    }else{
        amount = [NSString stringWithFormat:@"+%@",amount];
        _amountLabel.textColor = RGB_COLOR_String(@"#EAC37D");
    }

    _titleLabel.text = [self getName:information];
    _timeLabel.text = [information newStringValueForKey:@"createtime"];
    
    _amountLabel.text = amount;
}

-(NSString *)getName:(NSDictionary *)information{
    NSString *type = [information newStringValueForKey:@"type"];
    
    switch (type.integerValue) {
        case 0:
            return LangKey(@"bill_adapter_type_0");
            break;
        case 1:
            return LangKey(@"bill_adapter_type_1");
            break;
        case 2:
            return LangKey(@"bill_adapter_type_2");
            break;
        case 3:
            return LangKey(@"bill_adapter_type_3");
            break;
        case 4:
            return LangKey(@"bill_adapter_type_4");
            break;
        case 5:
            return LangKey(@"bill_adapter_type_5");
            break;
        case 6:
            return LangKey(@"bill_adapter_type_6");
            break;
        default:
            return @"unknow";
            break;
    }
}

//类型:0=充值,1=提现,2=转账,3=发红包,4=收红包,5=红包退款,6=签到奖励

@end
