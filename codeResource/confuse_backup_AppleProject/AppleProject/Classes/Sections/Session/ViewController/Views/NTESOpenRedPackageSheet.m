//
//  NTESOpenRedPackageSheet.m
//  NIM
//
//  Created by 彭爽 on 2021/10/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESOpenRedPackageSheet.h"
#define Height  300

@interface NTESOpenRedPackageSheet ()
@property (nonatomic,strong) NSDictionary *originDict;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *sendNickname;
@property (nonatomic,strong) UILabel *amountLabel;
@property (nonatomic,strong) UILabel *unitLabel;
@property (nonatomic,strong) UILabel *wordLabel;

@end

@implementation NTESOpenRedPackageSheet

-(instancetype)initWithFrame:(CGRect)frame dictionary:(NSDictionary *)dictionary{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _originDict = [NSDictionary dictionaryWithDictionary:dictionary];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        
        UIView *b = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self addSubview:b];
        
        UITapGestureRecognizer* singleRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTapFrom)];
        singleRecognizer.numberOfTapsRequired=1;
        [b addGestureRecognizer:singleRecognizer];
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2- Height/2-50, SCREEN_WIDTH-100, Height)];
        _backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_backView];
        
        
    
        

        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.image = [UIImage imageNamed:@"icon_redpackage_open_back"];
        backImage.clipsToBounds = YES;
        backImage.contentMode = UIViewContentModeScaleAspectFill;
        [_backView addSubview:backImage];
        [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.top.mas_offset(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        
        _headerImageView = [[UIImageView alloc] init];
        [_backView addSubview:_headerImageView];
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_offset(50);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];

        //昵称
        UILabel *titleLabel_1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 120, 65)];
        titleLabel_1.textColor = [UIColor whiteColor];
        titleLabel_1.font = [UIFont systemFontOfSize:16];
        titleLabel_1.textAlignment  = NSTextAlignmentLeft;
        [_backView addSubview:titleLabel_1];
        _sendNickname = titleLabel_1;
        [titleLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(50);
            make.left.mas_offset(50);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(150);
        }];
        
//        UIView *line = [[UIView alloc] init];
//        line.backgroundColor = RGB_COLOR_String(@"#C7E8CA");
//        [_backView addSubview:line];
//        [line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(0);
//            make.right.mas_offset(0);
//            make.top.mas_offset(50);
//            make.height.mas_equalTo(1);
//        }];
//

        
        UILabel *amountLabel = [[UILabel alloc] init];
        amountLabel.textAlignment = NSTextAlignmentLeft;
        amountLabel.textColor = [UIColor whiteColor];
        amountLabel.font = [UIFont boldSystemFontOfSize:36];
        [amountLabel sizeToFit];
        [_backView addSubview:amountLabel];
        _amountLabel = amountLabel;
        [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(90);
            make.left.mas_offset(15);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(50);
        }];
        
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.textAlignment = NSTextAlignmentLeft;
        _unitLabel.textColor = [UIColor whiteColor];
        _unitLabel.font = [UIFont systemFontOfSize:15];
        _unitLabel.text = LangKey(@"team_red_adapter_yuan");
        [_backView addSubview:_unitLabel];
        [_unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(110);
            make.left.mas_equalTo(amountLabel.mas_right).mas_offset(5);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        
        
        
        UIButton *content = [UIButton buttonWithType:UIButtonTypeCustom];
        content.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        content.titleLabel.font = [UIFont systemFontOfSize:13];
        [content setTitle:@"The balance has been deposited and can be withdrawn directly>>" forState:UIControlStateNormal];
        [content setTitleColor:RGB_COLOR_String(@"#FFD7C4") forState:UIControlStateNormal];
        [content addTarget:self action:@selector(walletButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:content];
        [_backView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(145);
            make.left.mas_offset(15);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(20);
        }];
        
        
        UILabel *words = [[UILabel alloc] init];
        words.textAlignment = NSTextAlignmentCenter;
        words.textColor = RGB_COLOR_String(@"#FE9FA8");
        words.font = [UIFont systemFontOfSize:24];
        words.text = @"Congratulations on your fortune";
        [_backView addSubview:words];
        _wordLabel = words;
        [words mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(190);
            make.left.mas_offset(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(30);
        }];
        
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [moreBtn setTitle:@"View pick-up details>>" forState:UIControlStateNormal];
        [moreBtn setTitleColor:RGB_COLOR_String(@"#FDA6A4") forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(redpackageDetail) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:moreBtn];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.bottom.mas_offset(-15);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(30);
        }];
        
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.frame = CGRectMake(0, 0, 50, 50);
        [closeButton setImage:[UIImage imageNamed:@"icon_redpackage_open_close"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(dismissPicker) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeButton];
        closeButton.layer.masksToBounds = YES;
        closeButton.layer.cornerRadius = 25;
        closeButton.layer.borderColor = [UIColor whiteColor].CGColor;
        closeButton.layer.borderWidth = 2;
        [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_backView.frame.origin.y + Height +20);
            make.centerX.mas_equalTo(self);
            make.width.height.mas_equalTo(50);
        }];
        

        
        [self requestRedDetail];
        
    }
    return self;
}


-(void)requestRedDetail{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    dict[@"redid"] = [_originDict newStringValueForKey:@"redid"];
    dict[@"start"] = kConstant_1;
    [ZCHttpManager getWithUrl:Server_wallet_redDetail params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *data = [resultDict valueObjectForKey:@"data"];
        NSDictionary *redinfo = [data valueObjectForKey:@"redinfo"];
        NSArray *list = [data arrayValueForKey:@"list"];
        _wordLabel.text = [redinfo newStringValueForKey:@"words"];
        [self reloadHeader:[redinfo newStringValueForKey:@"user_id"]];
        
        
        NSDictionary *getRedDict = nil;
        for (NSDictionary *item in  list) {
            NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
            if ([[item newStringValueForKey:@"user_id"] isEqualToString:currentAccount]) {
                getRedDict = item;
                break;
            }
        }
        
        if (getRedDict == nil) {
            
            _amountLabel.text = @"unclaimed";
            [_amountLabel sizeToFit];
            [_amountLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(120);
            }];
            _unitLabel.hidden = YES;
        }else{
            _unitLabel.hidden = NO;
            NSString *amount = [NSString stringWithFormat:@"¥%@",[getRedDict newStringValueForKey:@"amount"]];
            _amountLabel.text = amount;
            [_amountLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(120);
            }];
            [_unitLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_amountLabel.mas_right).mas_offset(5);
            }];
        }
        
    } failed:^(id responseObject, NSError *error) {
        
    }];
}

-(void)walletButtonClick{

    if (self.delegate && [self.delegate respondsToSelector:@selector(myWalletDelegate)]) {
        [self.delegate myWalletDelegate];
        [self dismissPicker];
    }
}

-(void)redpackageDetail{
    if (self.delegate && [self.delegate respondsToSelector:@selector(redpackageDetailWith:)]) {
        [self.delegate redpackageDetailWith:[_originDict newStringValueForKey:@"redid"]];
        [self dismissPicker];

    }
}

-(void)reloadHeader:(NSString *)userID{
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    NSString *headerUrl = me.userInfo.avatarUrl;
    UIImage *placeholderImage = info.avatarImage;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:headerUrl] placeholderImage:placeholderImage];
    _sendNickname.text = me.userInfo.nickName;
}

-(void)handleSingleTapFrom{
    [self dismissPicker];
}

- (void)show{
    
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self->_backView setOriginY:SCREEN_SAFE_HEIGHT/2- Height/2];
    }];
}

- (void)dismissPicker{
    [UIView animateWithDuration:0.3 animations:^{
        [self->_backView setOriginY:SCREEN_HEIGHT];
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

@end
