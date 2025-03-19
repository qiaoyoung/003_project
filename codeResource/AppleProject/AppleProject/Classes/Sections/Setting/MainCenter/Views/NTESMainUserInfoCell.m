//
//  NTESMainUserInfoCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESMainUserInfoCell.h"
#import "KIImagePickerController.h"
#import "NTESInputNickNameWindowView.h"
#import "HMDataPicker.h"
#import "HMDatePickerView.h"
#import "NTESUserQRCodeViewController.h"

@interface NTESMainUserInfoCell ()<KIImagePickerControllerDelegate,HMDataPickerDelegate,HMDatePickerViewDelegate>
@property (nonatomic ,strong) KIImagePickerController *picker;
@property (nonatomic ,strong) UIImageView *headerImageView;
@property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *accountLabel;
//@property (nonatomic ,strong) UILabel *sexLabel;
@property (nonatomic ,strong) UILabel *brithdayLabel;
@property (nonatomic ,strong) UILabel *signLabel;

@end

@implementation NTESMainUserInfoCell


-(void)reloadWithInformation:(NTESUserInfoModel *)infoModel{
    _infoModel = infoModel;

    _nickNameLabel.text = infoModel.nickname;
    _accountLabel.text = infoModel.account;
    _signLabel.text = infoModel.bio;

    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];

    if (infoModel.birthday.length > 0) {
        NSTimeInterval time=[_infoModel.birthday doubleValue];//1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
        _brithdayLabel.text = [NSDateFormatter dateStringWithFormat:KKDateFormatter04 date:date];
    }
    
}

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];

    UIView *backGroundView = [[UIView alloc] init];
    backGroundView.backgroundColor = [UIColor whiteColor];
    backGroundView.layer.masksToBounds = YES;
    backGroundView.layer.cornerRadius = 6;
    [self addSubview:backGroundView];
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(13);
        make.right.mas_offset(-13);
        make.height.mas_equalTo(5*50 + 70);
        make.bottom.mas_offset(0);
    }];
    
    for (int i = 0; i < 6; i++) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.tag = 100+i;
        [backButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backGroundView addSubview:backButton];
        if (i == 0) {
            [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_offset(0);
                make.left.mas_offset(0);
                make.right.mas_offset(0);
                make.height.mas_equalTo(70);
            }];
        }else{
            [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_offset(20 + 50*i);
                make.left.mas_offset(0);
                make.right.mas_offset(0);
                make.height.mas_equalTo(50);
            }];
        }
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"我的钱包";
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
        [backButton addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(20);
            make.centerY.mas_offset(0);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(30);
        }];
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        arrowImage.image = [UIImage imageNamed:@"btn_right"];
        [backButton addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-20);
            make.centerY.mas_offset(0);
            make.height.mas_equalTo(12);
            make.width.mas_equalTo(12);

        }];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.textAlignment = NSTextAlignmentRight;
        contentLabel.textColor = RGB_COLOR_String(@"#A9A9A9");
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.numberOfLines = 0;
        contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [backButton addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(backButton);
            make.right.mas_equalTo(arrowImage.mas_left).mas_offset(-5);
            make.left.mas_equalTo(titleLabel.mas_right).mas_offset(0);
            make.height.mas_equalTo(50);
        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
        [backButton addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.height.mas_equalTo(2);
            make.top.mas_equalTo(backButton.mas_bottom).mas_offset(-1);
        }];
        
        
        if (i == 0) {
            _headerImageView = [[UIImageView alloc] init];
            _headerImageView.image = [UIImage imageNamed:@"head_default"];
            [backButton addSubview:_headerImageView];
            _headerImageView.layer.masksToBounds = YES;
            _headerImageView.layer.cornerRadius = 23;
            [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(backButton);
                make.right.mas_offset(-50);
                make.width.mas_equalTo(46);
                make.height.mas_equalTo(46);
            }];
        }else if (i == 5){
            UIImageView *qcImage = [[UIImageView alloc] init];
            qcImage.image = [UIImage imageNamed:@"icon_user_contact_qr"];
            [backButton addSubview:qcImage];
            [qcImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(arrowImage.mas_left).mas_offset(-5);
                make.centerY.mas_offset(0);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(30);
            }];
        }
        
        if (i == 0) {
            titleLabel.text = LangKey(@"activity_my_user_info_avatar");
        }else if (i == 1){
            titleLabel.text = LangKey(@"activity_my_user_info_nick");
            _nickNameLabel = contentLabel;

        }else if (i == 2){
            titleLabel.text = LangKey(@"my_fragmet_account");
            _accountLabel = contentLabel;
        }
//        else if (i == 3){
//            titleLabel.text = LangKey(@"activity_friend_info_sex");
//            _sexLabel = contentLabel;
//        }
        else if (i == 3){
            titleLabel.text = LangKey(@"birthday_title");
            _brithdayLabel = contentLabel;
        }else if (i == 4){
            titleLabel.text = LangKey(@"activity_friend_info_shuo");
            _signLabel = contentLabel;
        }else if (i == 5){
            lineView.hidden = YES;
            titleLabel.text = LangKey(@"qrcode_activity_title");

        }else{
            
        }
    }
}

-(void)buttonClick:(UIButton *)sender{
    NSInteger tag = sender.tag -100;
    switch (tag) {
        case 0:
        {
            KIImagePickerController *picker = [[KIImagePickerController alloc]initWithDelegate:self viewController:self.viewController.navigationController];
            _picker = picker;
            [picker showWithDeleteButton:NO cropSize:CGSizeMake(200, 200)];
        }
            break;
        case 1:
        {
            NTESInputNickNameWindowView *windowView = [[NTESInputNickNameWindowView alloc] init];
            windowView.titleLabel.text = LangKey(@"dialog_nick_modify");//@"昵称修改";
            windowView.textField.placeholder = LangKey(@"register_avtivity3_nick"); //@"请输入昵称";
            windowView.textField.text = _infoModel.nickname;
            [windowView.dowmButton setTitle:LangKey(@"change_title") forState:UIControlStateNormal];
            [windowView show];
            [windowView clickKnowButton:^(NSString * _Nonnull niceNmae) {
                NSLog(@"%@",niceNmae);
                _infoModel.nickname = niceNmae;
                [self reloadData];
            }];
        }
            break;
        case 2:
        {
            NTESInputNickNameWindowView *windowView = [[NTESInputNickNameWindowView alloc] init];
            windowView.titleLabel.text = LangKey(@"change_account");//@"账号修改";
            windowView.textField.placeholder = LangKey(@"register_account_activity_account");//@"请输入账号";
            windowView.textField.text = _infoModel.account;
            [windowView.dowmButton setTitle:LangKey(@"change_title") forState:UIControlStateNormal];
            [windowView show];
            [windowView clickKnowButton:^(NSString * _Nonnull niceNmae) {
                NSLog(@"%@",niceNmae);
                _infoModel.account = niceNmae;
                [self reloadData];

            }];
        }
            break;
//        case 3:
//        {
//            NSString *nan = LangKey(@"activity_register3_nan");
//            NSString *nv = LangKey(@"activity_register3_nv");
//            NSArray *array = @[@{@"name":nan,@"code":kConstant_1},@{@"name":nv,@"code":kConstant_0}];
//            NSDictionary *dataDict = [NSDictionary dictionaryWithObject:array forKey:@"item_data"];
//            HMDataPicker *dataPick = [[HMDataPicker alloc] initWithDelegate:self dataDict:dataDict selectedDict:nil jsonNode:@"name"];
//            dataPick.tag = 500;
//            [dataPick show];
//        }
//            break;
        case 3:
        {
            NSDate *nowDate = [NSDate date];
            if (_infoModel.birthday.length > 0) {
                NSTimeInterval time=[_infoModel.birthday doubleValue];//1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
                nowDate = [NSDate dateWithTimeIntervalSince1970:time];
            }
            HMDatePickerView *view = [HMDatePickerView showWithDelegate:self minDate:nil maxDate:nil showDate:nowDate];
            view.titleString = LangKey(@"change_birth"); //@"请选择出生日期";
            [view show];
            
        }
            break;
        case 4:
        {
            NTESInputNickNameWindowView *windowView = [[NTESInputNickNameWindowView alloc] init];
            windowView.titleLabel.text = LangKey(@"activity_friend_info_shuo");
            windowView.textField.placeholder = LangKey(@"activity_set_bio_input");
            windowView.textField.text = _infoModel.bio;
            [windowView.dowmButton setTitle:LangKey(@"change_title") forState:UIControlStateNormal];
            [windowView show];
            [windowView clickKnowButton:^(NSString * _Nonnull niceNmae) {
                NSLog(@"%@",niceNmae);
                _infoModel.bio = niceNmae;
                [self reloadData];

            }];
        }
            break;
        case 5:
        {
            NTESUserQRCodeViewController *vc = [[NTESUserQRCodeViewController alloc] init];
            [self.nav pushViewController:vc animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 换图片
- (void)KIImagePickerController:(KIImagePickerController *)controller didFinishPickImage:(UIImage *)image{
    _headerImageView.image = image;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:kConstant_0 forKey:@"isCompress"];
    
    [ZCHttpManager uploadImagesWithURL:Server_upload_image parameters:dict images:@[UIImageJPEGRepresentation(image, 0.3)] progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *data = [dict valueObjectForKey:@"data"];
        _infoModel.avatar = [data newStringValueForKey:@"image"];
        [self reloadData];
        
    } failed:^(id responseObject, NSError *error) {
            
    }];
}


#pragma mark - HMDataPickerDelegate
- (void)dataPicker:(HMDataPicker *)dataPicker selectedDict:(NSDictionary *)selectedDict{
    _infoModel.gender = [selectedDict newStringValueForKey:@"code"];
    [self reloadData];
}

#pragma mark - HMDatePickerViewDelegate
- (void)datePick:(HMDatePickerView *)pickView doneWithDate:(NSDate *)date{
    
//    NSString *dateStr = [NSDate getStringFromDate:date dateFormatter:KKDateFormatter02];
//    _timeDict = [NSDictionary dictionaryWithObject:dateStr forKey:@"key"];
//    _timeLabel.text = dateStr;
    
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];//字符串转成时间戳,精确到毫秒*1000
    
    _infoModel.birthday = timeStr;
    [self reloadData];
    
    
}

-(void)reloadData{
    [self reloadWithInformation:_infoModel];//刷新页面
    [self saveUserInfo];//存储数据
}


-(void)saveUserInfo{
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"icon"] = _infoModel.avatar;
    dict[@"name"] = _infoModel.nickname;
    dict[@"sign"] = _infoModel.bio;
    dict[@"email"] = _infoModel.email;
    dict[@"birth"] = _infoModel.birthday;
    dict[@"mobile"] = _infoModel.mobile;
    dict[@"gender"] = _infoModel.gender;
    [ZCHttpManager getWithUrl:Server_user_editinfo params:dict isShow:YES success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        [SVProgressHUD showMessage:@"修改成功".nim_localized];
    } failed:^(id responseObject, NSError *error) {
        
    }];
}



@end
