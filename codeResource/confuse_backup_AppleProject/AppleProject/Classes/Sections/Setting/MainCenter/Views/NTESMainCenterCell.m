//
//  NTESMainCenterCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESMainCenterCell.h"
#import "NTESUserQRCodeViewController.h"
#import "UIViewNimKit.h"

@implementation NTESMainCenterCell

- (void)initSubviews{
    
    self.backgroundColor = [UIColor clearColor];
    
    UIButton *backGroundView = [UIButton buttonWithType:UIButtonTypeCustom];
    backGroundView.backgroundColor = [UIColor whiteColor];
    backGroundView.layer.masksToBounds = YES;
    backGroundView.layer.cornerRadius = 10;
    [backGroundView addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backGroundView];
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.height.mas_equalTo(60);
        make.bottom.mas_offset(0);
    }];
    
    UIImageView *imageIcon = [[UIImageView alloc] init];
    imageIcon.image = [UIImage imageNamed:@"user_icon_1"];
    imageIcon.layer.masksToBounds = YES;
    imageIcon.layer.cornerRadius = 15;
    [backGroundView addSubview:imageIcon];
    [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.centerY.mas_offset(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = LangKey(@"wallet_activity_title");//@"我的钱包";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
    [backGroundView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageIcon.mas_right).mas_offset(10);
        make.centerY.mas_offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    UIImageView *arrowImage = [[UIImageView alloc] init];
    arrowImage.image = [UIImage imageNamed:@"btn_right"];
    [backGroundView addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-20);
        make.centerY.mas_offset(0);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(12);

    }];
    
    
}

-(void)buttonClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(myWallet)]) {
        [self.delegate myWallet];
    }
}

@end


@interface NTESMainCenterCell_1 ()
@property (nonatomic ,strong) NSMutableArray *titleArray;
@property (nonatomic ,strong) NSMutableArray *imgaeArray;
@property (nonatomic ,strong) NSMutableArray *selectArray;


@end
@implementation NTESMainCenterCell_1

- (void)initSubviews{
    
    self.backgroundColor = [UIColor clearColor];
    
    
    _titleArray = @[].mutableCopy;
    _imgaeArray = @[].mutableCopy;

    NSString *share = LangKey(@"share_title");//分享
    NSString *report_activity_title = LangKey(@"report_activity_title");

    for (int i = 0; i < 2; i++) {
        
        [_titleArray addObject:report_activity_title];
        [_imgaeArray addObject:@"ic_Report"];
        
        [_titleArray addObject:share];
        [_imgaeArray addObject:@"ic_Share"];
        
    }


    UIView *backGroundView = [[UIView alloc] init];
    backGroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:backGroundView];
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.height.mas_equalTo(100);
        make.bottom.mas_offset(0);
    }];
    
    
    for (int i = 0; i < 2; i++) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.tag = 100+i;
        backButton.layer.cornerRadius = 8;
        backButton.layer.masksToBounds = YES;
        backButton.backgroundColor = [UIColor whiteColor];
        [backGroundView addSubview:backButton];
        [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.left.mas_equalTo((SCREEN_WIDTH/2.f)*i + 10);
            make.right.mas_offset(-(SCREEN_WIDTH/2.f*(1-i))-10);
            make.height.mas_equalTo(100);
        }];
        
        UIImageView *imageIcon = [[UIImageView alloc] init];
        imageIcon.layer.masksToBounds = YES;
        imageIcon.layer.cornerRadius = 15;
        [backButton addSubview:imageIcon];
        [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_offset(15);
            make.width.mas_equalTo(36);
            make.height.mas_equalTo(36);
        }];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont boldSystemFontOfSize:14];
        titleLabel.textColor = RGB_COLOR_String(@"#203152");
        [backButton addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_equalTo(imageIcon.mas_bottom).mas_offset(15);
            make.width.mas_equalTo(backButton.mas_width).mas_offset(-20);
            make.height.mas_equalTo(20);
        }];
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        arrowImage.image = [UIImage imageNamed:@"mine_btn_right"];
        [backButton addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-15);
            make.centerY.mas_equalTo(imageIcon.mas_centerY);
            make.height.mas_equalTo(12);
            make.width.mas_equalTo(12);

        }];
        
        imageIcon.image = [UIImage imageNamed:_imgaeArray[i]];
        titleLabel.text = _titleArray[i];
        if ([titleLabel.text isEqualToString:report_activity_title]) {
            [backButton addTarget:self action:@selector(opinionBack) forControlEvents:UIControlEventTouchUpInside];

        }else if ([titleLabel.text isEqualToString:share]){
            [backButton addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];

        }

    }
}

-(void)opinionBack{
    if (self.delegate && [self.delegate respondsToSelector:@selector(opinionBack)]) {
        [self.delegate opinionBack];
    }
}
-(void)signClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(signClick)]) {
        [self.delegate signClick];
    }
}
-(void)shareClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareUserInfo)]) {
        [self.delegate shareUserInfo];
    }
}


@end





@implementation NTESMainCenterCell_2

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];

    UIView *backGroundView = [[UIView alloc] init];
    backGroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:backGroundView];
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.height.mas_equalTo(100);
        make.bottom.mas_offset(0);
    }];
    
    
    NSString *safe_setting_activity_title = LangKey(@"safe_setting_activity_title");
    NSString *comment_setting_activity_title = LangKey(@"comment_setting_activity_title");
    
    for (int i = 0; i < 2; i++) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.layer.cornerRadius = 8;
        backButton.layer.masksToBounds = YES;
        backButton.backgroundColor = [UIColor whiteColor];
        backButton.tag = 100+i;
        [backButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backGroundView addSubview:backButton];
        [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.left.mas_equalTo((SCREEN_WIDTH/2.f)*i + 10);
            make.right.mas_offset(-(SCREEN_WIDTH/2.f*(1-i))-10);
            make.height.mas_equalTo(100);
        }];
        
        UIImageView *imageIcon = [[UIImageView alloc] init];
        [backButton addSubview:imageIcon];
        [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_offset(15);
            make.width.mas_equalTo(36);
            make.height.mas_equalTo(36);
        }];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"";
        titleLabel.font = [UIFont boldSystemFontOfSize:14];
        titleLabel.textColor = RGB_COLOR_String(@"#203152");
        [backButton addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_equalTo(imageIcon.mas_bottom).mas_offset(15);
            make.width.mas_equalTo(backButton.mas_width).mas_offset(-20);
            make.height.mas_equalTo(20);
        }];
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        arrowImage.image = [UIImage imageNamed:@"mine_btn_right"];
        [backButton addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-15);
            make.centerY.mas_equalTo(imageIcon.mas_centerY);
            make.height.mas_equalTo(12);
            make.width.mas_equalTo(12);

        }];
                
        if (i == 0) {
            imageIcon.image = [UIImage imageNamed:@"ic_Security_Settings"];
            titleLabel.text = safe_setting_activity_title;
        }else if (i == 1){
            imageIcon.image = [UIImage imageNamed:@"ic_General_settings"];
            titleLabel.text = comment_setting_activity_title;

        }
    }
}

-(void)buttonClick:(UIButton *)sender{
    
    NSInteger tag = sender.tag -100;
    
    switch (tag) {
        case 0:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(safetySeting)]) {
                [self.delegate safetySeting];
            }
        }
            break;
        case 1:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(generalSeting)]) {
                [self.delegate generalSeting];
            }
        }
            break;
            
        default:
            break;
    }
    
}

@end






@implementation NTESMainCenterCell_3

- (void)initSubviews{
    
    self.backgroundColor = [UIColor clearColor];
    
    UIButton *backGroundView = [UIButton buttonWithType:UIButtonTypeCustom];
    backGroundView.backgroundColor = [UIColor whiteColor];
    backGroundView.layer.masksToBounds = YES;
    backGroundView.layer.cornerRadius = 10;
    [backGroundView addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backGroundView];
    [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.height.mas_equalTo(60);
        make.bottom.mas_offset(0);
    }];
    
    UIImageView *imageIcon = [[UIImageView alloc] init];
    imageIcon.image = [UIImage imageNamed:@"ic_version"];
    imageIcon.layer.masksToBounds = YES;
    imageIcon.layer.cornerRadius = 15;
    [backGroundView addSubview:imageIcon];
    [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.centerY.mas_offset(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    

    NSString *fragment_my_version = LangKey(@"fragment_my_version");
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];// 获取App的版本号
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = [NSString stringWithFormat: @"%@：%@",fragment_my_version,appVersion];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
    [backGroundView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageIcon.mas_right).mas_offset(10);
        make.centerY.mas_offset(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    
}

-(void)buttonClick{
    NSLog(@"------");
}

@end





@implementation NTESMainCenterCell_4

- (void)initSubviews{
    
}

@end




@implementation NTESMainCenterHeader

-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        [self initSubviews];
    }
    return self;
}

-(void)initSubviews{
    
    
    UIImageView *qcImage = [[UIImageView alloc] init];
    qcImage.image = [UIImage imageNamed:@"ic_ma"];
    [self addSubview:qcImage];
    qcImage.userInteractionEnabled = YES;
    [qcImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-20);
        make.top.mas_offset(SCREEN_STATUS_HEIGHT);
        make.height.mas_equalTo(28);
        make.width.mas_equalTo(28);
    }];
    UITapGestureRecognizer *tapIconSinger = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myQRCodeButtnClick)];
    [qcImage addGestureRecognizer:tapIconSinger];
    
    _headerImage = [[UIImageView alloc] init];
    [self addSubview:_headerImage];
    _headerImage.layer.cornerRadius = 55;
    _headerImage.layer.shadowColor = RGB_COLOR_String(kCommonBGColor_All).CGColor;
    _headerImage.layer.shadowOffset = CGSizeMake(5, 5);
    _headerImage.layer.masksToBounds = YES;
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(SCREEN_STATUS_HEIGHT+18);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(110);
    }];
    
    
    
    _nickNameLabel = [[UILabel alloc] init];
    _nickNameLabel.font = [UIFont boldSystemFontOfSize:20];
    _nickNameLabel.text = @"";
    _nickNameLabel.textColor = [UIColor blackColor];
    [self addSubview:_nickNameLabel];
    _nickNameLabel.textAlignment = NSTextAlignmentCenter;
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImage.mas_bottom).mas_offset(12);
        make.centerX.mas_offset(0);
        make.height.mas_equalTo(30);
    }];
    
    self.arrowImage = [[UIImageView alloc] init];
    _arrowImage.image = [UIImage imageNamed:@"ic_edit"];
    [self addSubview:_arrowImage];
    [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nickNameLabel.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(_nickNameLabel.mas_centerY);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    _accountLabel = [[UILabel alloc] init];
    _accountLabel.font = [UIFont systemFontOfSize:12];
    _accountLabel.text = @"";
    _accountLabel.textColor = [UIColor blackColor];
    _accountLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_accountLabel];
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nickNameLabel.mas_bottom).mas_offset(4);
        make.centerX.mas_offset(0);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(20);
    }];
    
    
    
    UITapGestureRecognizer *tapSinger = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userInfoClick)];
    [self addGestureRecognizer:tapSinger];
        
}

-(void)myQRCodeButtnClick{
    NTESUserQRCodeViewController *vc = [[NTESUserQRCodeViewController alloc] init];
    [self.topViewController.navigationController pushViewController:vc animated:YES];
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].windows.firstObject rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

-(void)reloadWithDictionary:(NSDictionary *)dictionary{
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];

    [_headerImage sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    _nickNameLabel.text = me.userInfo.nickName;
    _accountLabel.text = emptyString([NIMUserDefaults standardUserDefaults].accountName);
        
    [_nickNameLabel sizeToFit];
    [_accountLabel sizeToFit];
    
    _arrowImage.nim_left = _nickNameLabel.nim_right+10;
}

-(void)userInfoClick{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(userInfoCenter)]) {
        [self.delegate userInfoCenter];
    }
    
}


@end
