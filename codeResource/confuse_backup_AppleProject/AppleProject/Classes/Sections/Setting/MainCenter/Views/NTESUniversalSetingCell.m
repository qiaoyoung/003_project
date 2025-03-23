//
//  NTESUniversalSetingCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESUniversalSetingCell.h"
#import "NTESBundleSetting.h"

@interface NTESUniversalSetingCell ()
@property (nonatomic ,strong) UISwitch *notifSwitch_1;
@property (nonatomic ,strong) UISwitch *notifSwitch_2;
@end

@implementation NTESUniversalSetingCell

-(void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshSwitch) name:UIApplicationWillEnterForegroundNotification object:nil];

    
    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(150);
    }];
    

    
    for (int i = 0; i<2; i++) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
        
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.text = @"";
        titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
        [backBtn addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(25);
            make.centerY.mas_offset(0);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(30);
        }];
        
 
        
        UISwitch *switchView = [[UISwitch alloc] init];
        switchView.onTintColor = RGB_COLOR_String(@"#0D9DF8");
        [switchView addTarget:self action:@selector(switchWith:) forControlEvents:UIControlEventValueChanged];
        [backBtn addSubview:switchView];
        [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-15);
            make.centerY.mas_offset(0);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(60);
        }];
        
        switch (i) {
            case 0:
                titleLabel.text = LangKey(@"main_activity_open_notify");//@"开启通知";
                _notifSwitch_1 = switchView;
                break;
            case 1:
                titleLabel.text = LangKey(@"push_mode");//@"强力推送模式";
                _notifSwitch_2 = switchView;
                break;
            default:
                break;
        }
    }
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:13];
    contentLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
    contentLabel.numberOfLines = 2;
    contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [backGround addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.height.mas_offset(50);
    }];
    contentLabel.text = LangKey(@"push_mode_content");//@"开启强力推送模式后，应用将长期存活，请不要将应用杀死。建议海外用户开启此功能";
}



-(void)switchWith:(UISwitch *)switchView{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (switchView.on) {
        [dict setObject:kConstant_1 forKey:@"enable"];
    }else{
        [dict setObject:kConstant_0 forKey:@"enable"];
    }
    
    // 跳转到系统设置
    NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication] openURL:settingURL options:[NSDictionary dictionary] completionHandler:nil];
   
    
}

-(void)refreshSwitch{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    self.notifSwitch_1.on = (setting.types != UIUserNotificationTypeNone);
    self.notifSwitch_1.on = (setting.types != UIUserNotificationTypeNone);
}

@end






@implementation NTESUniversalSetingCell_1

-(void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(100);
    }];
    

    
    for (int i = 0; i<2; i++) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
        
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.text = @"";
        titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
        [backBtn addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(25);
            make.centerY.mas_offset(0);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(30);
        }];
        
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        arrowImage.image = [UIImage imageNamed:@"btn_right"];
        [backBtn addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-20);
            make.centerY.mas_offset(0);
            make.height.mas_equalTo(12);
            make.width.mas_equalTo(12);

        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = TableSeparatorLineColor;
        [backGround addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i -0.5);
            make.height.mas_equalTo(1);
        }];
        if (i== 0) {
            lineView.hidden = YES;
        }
        
        
        switch (i) {
            case 0:
                titleLabel.text = LangKey(@"activity_comment_setting_chat_cover");//@"聊天背景";
                break;
            case 1:
                titleLabel.text = LangKey(@"activity_comment_setting_clear_chat_cover");//@"清除聊天背景";
                break;
            default:
                break;
        }
    }

    

}

@end

@implementation NTESUniversalSetingCell_2

-(void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    

    
    for (int i = 0; i<1; i++) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
        
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.text = @"";
        titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
        [backBtn addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(25);
            make.centerY.mas_offset(0);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(30);
        }];
        
        
        UISwitch *switchView = [[UISwitch alloc] init];
        switchView.onTintColor = RGB_COLOR_String(@"#0D9DF8");
        [switchView addTarget:self action:@selector(switchWith:) forControlEvents:UIControlEventValueChanged];
        [backBtn addSubview:switchView];
        [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-15);
            make.centerY.mas_offset(0);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(60);
        }];
        
        switch (i) {
            case 0:
                titleLabel.text = LangKey(@"receiver_model");//@"听筒模式";
                break;
            default:
                break;
        }
    }
}

-(void)switchWith:(UISwitch *)switchView{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (switchView.on) {
        [dict setObject:kConstant_1 forKey:@"enable"];
    }else{
        [dict setObject:kConstant_0 forKey:@"enable"];
    }
    
}


@end


@implementation NTESUniversalSetingCell_3

-(void)initSubviews{
    self.backgroundColor = [UIColor clearColor];

    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(200);
    }];



    for (int i = 0; i<4; i++) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.tag = 100 +i;
        [backBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
        
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.text = @"";
        titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
        [backBtn addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(25);
            make.centerY.mas_offset(0);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(30);
        }];
        
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        arrowImage.image = [UIImage imageNamed:@"btn_right"];
        [backBtn addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-20);
            make.centerY.mas_offset(0);
            make.height.mas_equalTo(12);
            make.width.mas_equalTo(12);

        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = TableSeparatorLineColor;
        [backGround addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i -0.5);
            make.height.mas_equalTo(1);
        }];
        if (i== 0) {
            lineView.hidden = YES;
        }
        
        switch (i) {
            case 0:
                titleLabel.text = LangKey(@"activity_comment_setting_clear_cache");//@"删除本地文件";
                break;
            case 1:
                titleLabel.text = LangKey(@"activity_group_info_clear_chat");//@"清空聊天记录";
                break;
            case 2:
                titleLabel.text = LangKey(@"activity_comment_setting_ys");//@"用户协议和隐私协议";
                break;
            case 3:
                titleLabel.text = LangKey(@"system_change_language");//@"更改语言";
                break;
            default:
                break;
        }
    }


}

-(void)buttonClick:(UIButton *)sender{
    
    NSString *sure_title = LangKey(@"contact_tag_fragment_sure");
    NSString *cancel_title = LangKey(@"contact_tag_fragment_cancel");
    NSInteger tag = sender.tag - 100;
    
    NSString *title = LangKey(@"clear_history");
    switch (tag) {
        case 0:
            title = LangKey(@"clear_content");//@"清除后，图片、视频等多媒体消息需要重新下载查看。确定清除？";
            break;
        case 1:
            title = LangKey(@"clear_history");
            break;
        case 2:
            [self jumpAgreement];
            return;
            break;
        case 3:
            [self changeLang];
            return;//更改语言
            break;
        default:
            break;
    }
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:sure_title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        switch (tag) {
            case 0:
                [self clearLocalityMessage];
                break;
            case 1:
                [self clearHistoryMessage];
                break;
            case 2:
                [self jumpAgreement];
                break;
            default:
                break;
        }

    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancel_title
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:sure];
    [sheet addAction:cancel];
    [self.viewController presentViewController:sheet animated:YES completion:nil];

}

-(void)changeLang{
    
    NSString *alertStr = LangKey(@"system_change_language");
  
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertStr preferredStyle:UIAlertControllerStyleActionSheet];
#ifdef DEBUG
    [alert addAction:[UIAlertAction actionWithTitle:@"中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"zh";
        [self exitApp];
    }]];
#endif
    
    [alert addAction:[UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"en";
        [self exitApp];

    }]];
    
    // 泰语
    [alert addAction:[UIAlertAction actionWithTitle:@"ภาษาไทย " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"th";

        [self exitApp];

    }]];
    
    // 越南
    [alert addAction:[UIAlertAction actionWithTitle:@"Việt nam " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"vi";

        [self exitApp];

    }]];
    
    // 印度
    [alert addAction:[UIAlertAction actionWithTitle:@"हिंदी" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"hi";

        [self exitApp];

    }]];
    
    // 日语
    [alert addAction:[UIAlertAction actionWithTitle:@"にほんご" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"ja";

        [self exitApp];

    }]];
    
    //韩语
    [alert addAction:[UIAlertAction actionWithTitle:@"한국어" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"ko";

        [self exitApp];

    }]];
    
    // 西班牙
    [alert addAction:[UIAlertAction actionWithTitle:@"Español" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"spa";

        [self exitApp];

    }]];
    
    /// 葡萄牙
    [alert addAction:[UIAlertAction actionWithTitle:@"Língua portuguesa" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"pt";

        [self exitApp];

    }]];
    
    /// 印度尼西亚
    [alert addAction:[UIAlertAction actionWithTitle:@"bahasa Indonesia" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NIMUserDefaults standardUserDefaults].language = @"id";

        [self exitApp];

    }]];
    

    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
    }]];
    
    [self.viewController presentViewController:alert animated:YES completion:nil];
    
}

-(void)exitApp{
    NSString *alertStr = LangKey(@"system_change_language_title");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertStr preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_sure") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {        
        exit(0);
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
    }]];
    
    [self.viewController presentViewController:alert animated:YES completion:nil];
    
}

-(void)clearLocalityMessage{
    NIMResourceQueryOption *option = [[NIMResourceQueryOption alloc] init];
    option.timeInterval = 0;
    [SVProgressHUD show];
    [[NIMSDK sharedSDK].resourceManager removeResourceFiles:option completion:^(NSError * _Nullable error, long long freeBytes) {
        [SVProgressHUD dismiss];
        if (error)
        {
            UIAlertController *result = [UIAlertController alertControllerWithTitle:@"" message:@"清除失败！".ntes_localized preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
            [result addAction:action];
            [self.viewController presentViewController:result animated:YES completion:nil];
        }
        else
        {
            CGFloat freeMB = (CGFloat)freeBytes / 1000 / 1000;
            UIAlertController *result = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"%@%.2fMB%@",LangKey(@"clear_success"), freeMB, LangKey(@"disk_space")] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];

            [result addAction:action];
            [self.viewController presentViewController:result animated:YES completion:nil];

        }
    }];
}

-(void)clearHistoryMessage{
    BOOL removeRecentSession = [NTESBundleSetting sharedConfig].removeSessionWhenDeleteMessages;
    BOOL removeTable = [NTESBundleSetting sharedConfig].dropTableWhenDeleteMessages;
    NIMDeleteMessagesOption *option = [[NIMDeleteMessagesOption alloc] init];
    option.removeSession = removeRecentSession;
    option.removeTable = removeTable;
    [[NIMSDK sharedSDK].conversationManager deleteAllMessages:option];
    
    NSString *success = LangKey(@"clear_success");
    UIAlertController *result = [UIAlertController alertControllerWithTitle:@"" message:success preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:LangKey(@"dialog_notice_i_known") style:UIAlertActionStyleCancel handler:nil];
    [result addAction:action];
    [self.viewController presentViewController:result animated:YES completion:nil];
}

-(void)jumpAgreement{
    
    HMWebViewController *vc = [[HMWebViewController alloc] init];
    vc.webTitle = LangKey(@"activity_comment_setting_ys");//@"隐私协议";
    vc.urlString = [NIMUserDefaults standardUserDefaults].yshref;
    [_nav pushViewController:vc animated:YES];
    
}


@end



@implementation NTESUniversalSetingCell_4

-(void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = LangKey(@"activity_comment_setting_exit");//@"退出登录";
    titleLabel.textColor = RGB_COLOR_String(@"#FF2A1A");
    [backGround addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.centerX.mas_offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];


}

@end




@implementation NTESUniversalSetingCell_5

-(void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = LangKey(@"activity_comment_setting_cancel_account");//@"退出登录";
    titleLabel.textColor = [UIColor blackColor];
    [backGround addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.centerX.mas_offset(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(30);
    }];

}

@end
