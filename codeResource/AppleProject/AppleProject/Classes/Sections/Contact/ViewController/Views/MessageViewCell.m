
#import <Foundation/Foundation.h>

NSString *StringFromSupplierData(Byte *data);


//: activity_add_friend_my_account
Byte str_datePostOnText[] = {23, 30, 6, 101, 183, 217, 116, 110, 117, 111, 99, 99, 97, 95, 121, 109, 95, 100, 110, 101, 105, 114, 102, 95, 100, 100, 97, 95, 121, 116, 105, 118, 105, 116, 99, 97, 31};


//: ic_search
Byte str_changeText[] = {25, 9, 13, 100, 55, 209, 217, 78, 51, 245, 131, 12, 169, 104, 99, 114, 97, 101, 115, 95, 99, 105, 62};


//: icon_user_contact_qr
Byte str_clientName[] = {33, 20, 7, 6, 232, 62, 97, 114, 113, 95, 116, 99, 97, 116, 110, 111, 99, 95, 114, 101, 115, 117, 95, 110, 111, 99, 105, 77};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageViewCell.m
//  NIM
//
//  Created by 彭爽 on 2021/10/19.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactAddFriendCell.h"
#import "MessageViewCell.h"

//: @implementation NTESContactAddFriendCell
@implementation MessageViewCell

//: - (void)initSubviews{
- (void)initChangeByWill{

    //: self.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

    //: UIView *backView = [[UIView alloc] init];
    UIView *backView = [[UIView alloc] init];
    //: backView.backgroundColor = [UIColor whiteColor];
    backView.backgroundColor = [UIColor whiteColor];
    //: backView.layer.masksToBounds = YES;
    backView.layer.masksToBounds = YES;
    //: backView.layer.cornerRadius = 4.6f;
    backView.layer.cornerRadius = 4.6f;
    //: [self addSubview:backView];
    [self addSubview:backView];
    //: [backView mas_makeConstraints:^(MASConstraintMaker *make) {
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(15);
        make.left.mas_offset(15);
        //: make.right.mas_offset(-15);
        make.right.mas_offset(-15);
        //: make.height.mas_equalTo(50);
        make.height.mas_equalTo(50);
        //: make.top.mas_offset(0);
        make.top.mas_offset(0);

    //: }];
    }];

    //: UIImageView *imageIcon = [[UIImageView alloc] init];
    UIImageView *imageIcon = [[UIImageView alloc] init];
    //: imageIcon.image = [UIImage imageNamed:@"ic_search"];
    imageIcon.image = [UIImage imageNamed:StringFromSupplierData(str_changeText)];
    //: [backView addSubview:imageIcon];
    [backView addSubview:imageIcon];
    //: [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
    [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(8);
        make.left.mas_offset(8);
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.width.height.mas_equalTo(23);
        make.width.height.mas_equalTo(23);
    //: }];
    }];

    //: _textField = [[UITextField alloc] init];
    _textField = [[UITextField alloc] init];
    //: [backView addSubview:_textField];
    [backView addSubview:_textField];
    //: [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_equalTo(imageIcon.mas_right).mas_offset(5);
        make.left.mas_equalTo(imageIcon.mas_right).mas_offset(5);
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.right.mas_offset(-15);
        make.right.mas_offset(-15);
        //: make.height.mas_equalTo(30);
        make.height.mas_equalTo(30);

    //: }];
    }];

    //: NSString *my_account = [NTESLanguageManager getTextWithKey:@"activity_add_friend_my_account"];
    NSString *my_account = [MaxInformation off:StringFromSupplierData(str_datePostOnText)];
    //: NSString *myCodeStr = [NSString stringWithFormat:@"%@:%@",my_account,[NIMUserDefaults standardUserDefaults].accountName];
    NSString *myCodeStr = [NSString stringWithFormat:@"%@:%@",my_account,[WastepaperBasketDefaults at].accountName];
    //: UILabel *titleLable = [[UILabel alloc] init];
    UILabel *titleLable = [[UILabel alloc] init];
    //: titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.font = [UIFont systemFontOfSize:15];
    //: titleLable.textColor = [UIColor blackColor];
    titleLable.textColor = [UIColor blackColor];
    //: titleLable.text = myCodeStr;
    titleLable.text = myCodeStr;
    //: [titleLable sizeToFit];
    [titleLable sizeToFit];
    //: [self addSubview:titleLable];
    [self addSubview:titleLable];
    //: [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.top.mas_equalTo(backView.mas_bottom).mas_offset(40);
        make.top.mas_equalTo(backView.mas_bottom).mas_offset(40);
        //: make.centerX.mas_offset(0).mas_offset(-25);
        make.centerX.mas_offset(0).mas_offset(-25);
        //: make.height.mas_equalTo(30);
        make.height.mas_equalTo(30);
        //: make.bottom.mas_offset(0);
        make.bottom.mas_offset(0);
    //: }];
    }];


    //: _myQRCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _myQRCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: [_myQRCodeBtn setImage:[UIImage imageNamed:@"icon_user_contact_qr"] forState:UIControlStateNormal];
    [_myQRCodeBtn setImage:[UIImage imageNamed:StringFromSupplierData(str_clientName)] forState:UIControlStateNormal];
    //: [_myQRCodeBtn setImage:[UIImage imageNamed:@"icon_user_contact_qr"] forState:UIControlStateHighlighted];
    [_myQRCodeBtn setImage:[UIImage imageNamed:StringFromSupplierData(str_clientName)] forState:UIControlStateHighlighted];
    //: [self addSubview:_myQRCodeBtn];
    [self addSubview:_myQRCodeBtn];
    //: [_myQRCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    [_myQRCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_equalTo(titleLable.mas_right).mas_offset(3);
        make.left.mas_equalTo(titleLable.mas_right).mas_offset(3);
        //: make.centerY.mas_equalTo(titleLable);
        make.centerY.mas_equalTo(titleLable);
        //: make.width.height.mas_equalTo(25);
        make.width.height.mas_equalTo(25);
    //: }];
    }];



}

//: @end
@end

Byte * SupplierDataToCache(Byte *data) {
    int valueFile = data[0];
    int disablePoint = data[1];
    int dateShow = data[2];
    if (!valueFile) return data + dateShow;
    for (int i = 0; i < disablePoint / 2; i++) {
        int begin = dateShow + i;
        int end = dateShow + disablePoint - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[dateShow + disablePoint] = 0;
    return data + dateShow;
}

NSString *StringFromSupplierData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SupplierDataToCache(data)];
}  
