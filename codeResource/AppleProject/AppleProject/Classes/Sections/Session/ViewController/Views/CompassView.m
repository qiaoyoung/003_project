
#import <Foundation/Foundation.h>

NSString *StringFromRitualData(Byte *data);


//: #333333
Byte str_longtimeContent[] = {30, 7, 8, 118, 236, 142, 168, 190, 51, 51, 51, 51, 51, 51, 35, 188};


//: #888888
Byte str_fishingSignerData[] = {91, 7, 5, 245, 214, 56, 56, 56, 56, 56, 56, 35, 113};


//: icon_redpackage_money
Byte str_byNaturalData[] = {85, 21, 9, 49, 71, 79, 154, 177, 246, 121, 101, 110, 111, 109, 95, 101, 103, 97, 107, 99, 97, 112, 100, 101, 114, 95, 110, 111, 99, 105, 31};


//: activity_pay_psw_input
Byte str_concedeOvenData[] = {87, 22, 7, 182, 166, 244, 61, 116, 117, 112, 110, 105, 95, 119, 115, 112, 95, 121, 97, 112, 95, 121, 116, 105, 118, 105, 116, 99, 97, 231};


//: red_packet
Byte str_advanceValue[] = {91, 10, 11, 48, 225, 61, 241, 248, 248, 54, 85, 116, 101, 107, 99, 97, 112, 95, 100, 101, 114, 151};


//: icon_redpackage_close
Byte str_worthSculptValue[] = {50, 21, 9, 65, 63, 58, 97, 37, 96, 101, 115, 111, 108, 99, 95, 101, 103, 97, 107, 99, 97, 112, 100, 101, 114, 95, 110, 111, 99, 105, 227};


//: #D6D6D6
Byte str_curiousScanText[] = {47, 7, 13, 225, 171, 55, 6, 91, 101, 89, 62, 186, 226, 54, 68, 54, 68, 54, 68, 35, 132};


//: #C7E8CA
Byte str_iconNearName[] = {78, 7, 7, 29, 251, 90, 109, 65, 67, 56, 69, 55, 67, 35, 90};


//: amount
Byte str_slatData[] = {97, 6, 7, 110, 239, 171, 59, 116, 110, 117, 111, 109, 97, 220};


//: change
Byte str_goalData[] = {28, 6, 3, 101, 103, 110, 97, 104, 99, 135};

// __DEBUG__
// __CLOSE_PRINT__
//
//  CompassView.m
//  NIM
//
//  Created by 彭爽 on 2021/10/10.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESRedPackagePaySheet.h"
#import "CompassView.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "TPPasswordTextView.h"
#import "RawDataView.h"

//: @interface NTESRedPackagePaySheet ()
@interface CompassView ()
//: @property (nonatomic,strong) NSDictionary *originDict;
@property (nonatomic,strong) NSDictionary *originDict;
//: @property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIView *backView;
//: @property (nonatomic,strong) UITextField *textfield;
@property (nonatomic,strong) UITextField *textfield;
//: @property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UIImageView *headerImageView;
//: @end
@end

//: @implementation NTESRedPackagePaySheet
@implementation CompassView

//: -(instancetype)initWithFrame:(CGRect)frame dictionary:(NSDictionary *)dictionary{
-(instancetype)initWithShowState:(CGRect)frame dismiss:(NSDictionary *)dictionary{

    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {

        //: _originDict = [NSDictionary dictionaryWithDictionary:dictionary];
        _originDict = [NSDictionary dictionaryWithDictionary:dictionary];
        //: self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];

        //: UIView *b = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        UIView *b = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        //: [self addSubview:b];
        [self addSubview:b];

        //: UITapGestureRecognizer* singleRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTapFrom)];
        UITapGestureRecognizer* singleRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shouldGreen)];
        //: singleRecognizer.numberOfTapsRequired=1;
        singleRecognizer.numberOfTapsRequired=1;
        //: [b addGestureRecognizer:singleRecognizer];
        [b addGestureRecognizer:singleRecognizer];

        //: _backView = [[UIView alloc] initWithFrame:CGRectMake(30, [[UIScreen mainScreen] bounds].size.height/2- 270/2-50, [[UIScreen mainScreen] bounds].size.width-60, 270)];
        _backView = [[UIView alloc] initWithFrame:CGRectMake(30, [[UIScreen mainScreen] bounds].size.height/2- 270/2-50, [[UIScreen mainScreen] bounds].size.width-60, 270)];
        //: _backView.backgroundColor = [UIColor whiteColor];
        _backView.backgroundColor = [UIColor whiteColor];
        //: [self addSubview:_backView];
        [self addSubview:_backView];


        //: UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: closeButton.frame = CGRectMake(0, 0, 50, 50);
        closeButton.frame = CGRectMake(0, 0, 50, 50);
        //: [closeButton setImage:[UIImage imageNamed:@"icon_redpackage_close"] forState:UIControlStateNormal];
        [closeButton setImage:[UIImage imageNamed:StringFromRitualData(str_worthSculptValue)] forState:UIControlStateNormal];
        //: [closeButton addTarget:self action:@selector(dismissPicker) forControlEvents:UIControlEventTouchUpInside];
        [closeButton addTarget:self action:@selector(dismissImage) forControlEvents:UIControlEventTouchUpInside];
        //: [_backView addSubview:closeButton];
        [_backView addSubview:closeButton];


        //: _headerImageView = [[UIImageView alloc] init];
        _headerImageView = [[UIImageView alloc] init];
        //: [_backView addSubview:_headerImageView];
        [_backView addSubview:_headerImageView];
        //: [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.left.mas_offset(50);
            make.left.mas_offset(50);
            //: make.top.mas_offset(7.5);
            make.top.mas_offset(7.5);
            //: make.width.mas_equalTo(35);
            make.width.mas_equalTo(35);
            //: make.height.mas_equalTo(35);
            make.height.mas_equalTo(35);
        //: }];
        }];



        //: UILabel *titleLabel_1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 120, 65)];
        UILabel *titleLabel_1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 120, 65)];
        //: titleLabel_1.textColor = [UIColor colorWithHexString:@"#333333"];
        titleLabel_1.textColor = [UIColor direction:StringFromRitualData(str_longtimeContent)];
        //: titleLabel_1.font = [UIFont boldSystemFontOfSize:16];
        titleLabel_1.font = [UIFont boldSystemFontOfSize:16];
        //: titleLabel_1.text = [NTESLanguageManager getTextWithKey:@"activity_pay_psw_input"];
        titleLabel_1.text = [MaxInformation off:StringFromRitualData(str_concedeOvenData)];
        //: titleLabel_1.textAlignment = NSTextAlignmentLeft;
        titleLabel_1.textAlignment = NSTextAlignmentLeft;
        //: [_backView addSubview:titleLabel_1];
        [_backView addSubview:titleLabel_1];
        //: [titleLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        [titleLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.top.mas_offset(0);
            make.top.mas_offset(0);
            //: make.left.mas_offset(100);
            make.left.mas_offset(100);
            //: make.height.mas_equalTo(50);
            make.height.mas_equalTo(50);
            //: make.width.mas_equalTo(150);
            make.width.mas_equalTo(150);
        //: }];
        }];

        //: UIView *line = [[UIView alloc] init];
        UIView *line = [[UIView alloc] init];
        //: line.backgroundColor = [UIColor colorWithHexString:@"#C7E8CA"];
        line.backgroundColor = [UIColor direction:StringFromRitualData(str_iconNearName)];
        //: [_backView addSubview:line];
        [_backView addSubview:line];
        //: [line mas_makeConstraints:^(MASConstraintMaker *make) {
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.left.mas_offset(0);
            make.left.mas_offset(0);
            //: make.right.mas_offset(0);
            make.right.mas_offset(0);
            //: make.top.mas_offset(50);
            make.top.mas_offset(50);
            //: make.height.mas_equalTo(1);
            make.height.mas_equalTo(1);
        //: }];
        }];

        //: UILabel *title = [[UILabel alloc] init];
        UILabel *title = [[UILabel alloc] init];
        //: title.textAlignment = NSTextAlignmentCenter;
        title.textAlignment = NSTextAlignmentCenter;
        //: title.textColor = [UIColor blackColor];
        title.textColor = [UIColor blackColor];
        //: title.font = [UIFont systemFontOfSize:15];
        title.font = [UIFont systemFontOfSize:15];
        //: title.text = [NTESLanguageManager getTextWithKey:@"red_packet"];
        title.text = [MaxInformation off:StringFromRitualData(str_advanceValue)];
        //: [_backView addSubview:title];
        [_backView addSubview:title];
        //: [title mas_makeConstraints:^(MASConstraintMaker *make) {
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.top.mas_offset(60);
            make.top.mas_offset(60);
            //: make.centerX.mas_offset(0);
            make.centerX.mas_offset(0);
            //: make.width.mas_equalTo(200);
            make.width.mas_equalTo(200);
            //: make.height.mas_equalTo(30);
            make.height.mas_equalTo(30);
        //: }];
        }];

        //: UILabel *amountLabel = [[UILabel alloc] init];
        UILabel *amountLabel = [[UILabel alloc] init];
        //: amountLabel.textAlignment = NSTextAlignmentCenter;
        amountLabel.textAlignment = NSTextAlignmentCenter;
        //: amountLabel.textColor = [UIColor blackColor];
        amountLabel.textColor = [UIColor blackColor];
        //: amountLabel.font = [UIFont boldSystemFontOfSize:30];
        amountLabel.font = [UIFont boldSystemFontOfSize:30];
        //: amountLabel.text = [NSString stringWithFormat:@"¥%@",[dictionary newStringValueForKey:@"amount"]];
        amountLabel.text = [NSString stringWithFormat:@"¥%@",[dictionary cord:StringFromRitualData(str_slatData)]];
        //: [_backView addSubview:amountLabel];
        [_backView addSubview:amountLabel];
        //: [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.top.mas_offset(90);
            make.top.mas_offset(90);
            //: make.centerX.mas_offset(0);
            make.centerX.mas_offset(0);
            //: make.width.mas_equalTo(200);
            make.width.mas_equalTo(200);
            //: make.height.mas_equalTo(50);
            make.height.mas_equalTo(50);
        //: }];
        }];

        //: UIView *blackLine = [[UIView alloc] init];
        UIView *blackLine = [[UIView alloc] init];
        //: blackLine.backgroundColor = [UIColor colorWithHexString:@"#D6D6D6"];
        blackLine.backgroundColor = [UIColor direction:StringFromRitualData(str_curiousScanText)];
        //: [_backView addSubview:blackLine];
        [_backView addSubview:blackLine];
        //: [blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
        [blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.left.mas_offset(0);
            make.left.mas_offset(0);
            //: make.right.mas_offset(0);
            make.right.mas_offset(0);
            //: make.top.mas_offset(150);
            make.top.mas_offset(150);
            //: make.height.mas_equalTo(0.6);
            make.height.mas_equalTo(0.6);
        //: }];
        }];

        //: UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 155, 40, 40)];
        UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 155, 40, 40)];
        //: iconImage.image = [UIImage imageNamed:@"icon_redpackage_money"];
        iconImage.image = [UIImage imageNamed:StringFromRitualData(str_byNaturalData)];
        //: [_backView addSubview:iconImage];
        [_backView addSubview:iconImage];

        //: UILabel *lingq = [[UILabel alloc] initWithFrame:CGRectMake(60, 155, 100, 40)];
        UILabel *lingq = [[UILabel alloc] initWithFrame:CGRectMake(60, 155, 100, 40)];
        //: lingq.textColor = [UIColor colorWithHexString:@"#888888"];
        lingq.textColor = [UIColor direction:StringFromRitualData(str_fishingSignerData)];
        //: lingq.font = [UIFont systemFontOfSize:15];
        lingq.font = [UIFont systemFontOfSize:15];
        //: lingq.text = @"change";
        lingq.text = StringFromRitualData(str_goalData);
        //: [_backView addSubview:lingq];
        [_backView addSubview:lingq];


        //: UIView *blackLine_2 = [[UIView alloc] init];
        UIView *blackLine_2 = [[UIView alloc] init];
        //: blackLine_2.backgroundColor = [UIColor colorWithHexString:@"#D6D6D6"];
        blackLine_2.backgroundColor = [UIColor direction:StringFromRitualData(str_curiousScanText)];
        //: [_backView addSubview:blackLine_2];
        [_backView addSubview:blackLine_2];
        //: [blackLine_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        [blackLine_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            //: make.left.mas_offset(0);
            make.left.mas_offset(0);
            //: make.right.mas_offset(0);
            make.right.mas_offset(0);
            //: make.top.mas_offset(200);
            make.top.mas_offset(200);
            //: make.height.mas_equalTo(0.6);
            make.height.mas_equalTo(0.6);
        //: }];
        }];


        //: CGRect rect = CGRectMake([[UIScreen mainScreen] bounds].size.width/2-30-132, 210, 264, 44);
        CGRect rect = CGRectMake([[UIScreen mainScreen] bounds].size.width/2-30-132, 210, 264, 44);
        //: TPPasswordTextView *view1 = [[TPPasswordTextView alloc] initWithFrame:rect];
        RawDataView *view1 = [[RawDataView alloc] initWithFrame:rect];
        //: view1.elementCount = 6;
        view1.elementCount = 6;
        //: view1.elementBorderColor = [UIColor lightGrayColor];
        view1.elementBorderColor = [UIColor lightGrayColor];
        //: [_backView addSubview:view1];
        [_backView addSubview:view1];
        //: view1.passwordDidChangeBlock = ^(NSString *password) {
        view1.passwordDidChangeBlock = ^(NSString *password) {

            //: if (password.length == 6) {
            if (password.length == 6) {
                //: _block(password);
                _block(password);
                //: [self dismissPicker];
                [self dismissImage];
            }
        //: };
        };

        //: [self reloadHeader];
        [self quantity];
    }
    //: return self;
    return self;
}


//: -(void)reloadHeader{
-(void)quantity{
    //: NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    //: NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    TitleInfo *info = [[Indicator reach] indoors:userID harvest:nil];
    //: NSString *headerUrl = me.userInfo.avatarUrl;
    NSString *headerUrl = me.userInfo.avatarUrl;
    //: UIImage *placeholderImage = info.avatarImage;
    UIImage *placeholderImage = info.avatarImage;
    //: [_headerImageView sd_setImageWithURL:[NSURL URLWithString:headerUrl] placeholderImage:placeholderImage];
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:headerUrl] placeholderImage:placeholderImage];
}

//: -(void)handleSingleTapFrom{
-(void)shouldGreen{
    //: [self dismissPicker];
    [self dismissImage];
}

//: - (void)show{
- (void)record{

    //: UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    //: [window addSubview:self];
    [window addSubview:self];

    //: [UIView animateWithDuration:0.3 animations:^{
    [UIView animateWithDuration:0.3 animations:^{
        //: [self->_backView setOriginY:([[UIScreen mainScreen] bounds].size.height - (44.0f + [UIDevice vg_statusBarHeight]) - (({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom))/2- 270/2];
        [self->_backView setTingAdd:([[UIScreen mainScreen] bounds].size.height - (44.0f + [UIDevice task]) - (({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom))/2- 270/2];
    //: }];
    }];
}

//: - (void)dismissPicker{
- (void)dismissImage{
    //: [UIView animateWithDuration:0.3 animations:^{
    [UIView animateWithDuration:0.3 animations:^{
        //: [self->_backView setOriginY:[[UIScreen mainScreen] bounds].size.height];
        [self->_backView setTingAdd:[[UIScreen mainScreen] bounds].size.height];
    //: } completion:^(BOOL finished) {
    } completion:^(BOOL finished) {

        //: self.hidden = YES;
        self.hidden = YES;
        //: [self removeFromSuperview];
        [self removeFromSuperview];
    //: }];
    }];
}

//: -(void)finshInputPassword:(PayPasswordBlock)block{
-(void)center:(PayPasswordBlock)block{
    //: _block = block;
    _block = block;
}

//: @end
@end

Byte * RitualDataToCache(Byte *data) {
    int rev = data[0];
    int recordImage = data[1];
    int easyRecent = data[2];
    if (!rev) return data + easyRecent;
    for (int i = 0; i < recordImage / 2; i++) {
        int begin = easyRecent + i;
        int end = easyRecent + recordImage - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[easyRecent + recordImage] = 0;
    return data + easyRecent;
}

NSString *StringFromRitualData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)RitualDataToCache(data)];
}  
