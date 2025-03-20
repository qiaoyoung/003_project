//
//  NTESRedPackagePaySheet.m
//  NIM
//
//  Created by 彭爽 on 2021/10/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESRedPackagePaySheet.h"
#import "BBBAvatarImageView.h"
#import "TPPasswordTextView.h"

#define Height  270

#define Key  @"amount"


@interface NTESRedPackagePaySheet ()
@property (nonatomic,strong) NSDictionary *originDict;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UITextField *textfield;
@property (nonatomic,strong) UIImageView *headerImageView;
@end

@implementation NTESRedPackagePaySheet

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
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT/2- Height/2-50, SCREEN_WIDTH-60, Height)];
        _backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_backView];
        
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.frame = CGRectMake(0, 0, 50, 50);
        [closeButton setImage:[UIImage imageNamed:@"icon_redpackage_close"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(dismissPicker) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:closeButton];
        

        _headerImageView = [[UIImageView alloc] init];
        [_backView addSubview:_headerImageView];
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(50);
            make.top.mas_offset(7.5);
            make.width.mas_equalTo(35);
            make.height.mas_equalTo(35);
        }];
        

        
        UILabel *titleLabel_1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 120, 65)];
        titleLabel_1.textColor = RGB_COLOR_String(@"#333333");
        titleLabel_1.font = [UIFont boldSystemFontOfSize:16];
        titleLabel_1.text = LangKey(@"activity_pay_psw_input");
        titleLabel_1.textAlignment  = NSTextAlignmentLeft;
        [_backView addSubview:titleLabel_1];
        [titleLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.left.mas_offset(100);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(150);
        }];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = RGB_COLOR_String(@"#C7E8CA");
        [_backView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50);
            make.height.mas_equalTo(1);
        }];
        
        UILabel *title = [[UILabel alloc] init];
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor blackColor];
        title.font = [UIFont systemFontOfSize:15];
        title.text = LangKey(@"red_packet");
        [_backView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(60);
            make.centerX.mas_offset(0);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(30);
        }];
        
        UILabel *amountLabel = [[UILabel alloc] init];
        amountLabel.textAlignment = NSTextAlignmentCenter;
        amountLabel.textColor = [UIColor blackColor];
        amountLabel.font = [UIFont boldSystemFontOfSize:30];
        amountLabel.text = [NSString stringWithFormat:@"¥%@",[dictionary newStringValueForKey:Key]];
        [_backView addSubview:amountLabel];
        [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(90);
            make.centerX.mas_offset(0);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
        }];
        
        UIView *blackLine = [[UIView alloc] init];
        blackLine.backgroundColor = RGB_COLOR_String(@"#D6D6D6");
        [_backView addSubview:blackLine];
        [blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(150);
            make.height.mas_equalTo(0.6);
        }];
        
        UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 155, 40, 40)];
        iconImage.image = [UIImage imageNamed:@"icon_redpackage_money"];
        [_backView addSubview:iconImage];
        
        UILabel *lingq = [[UILabel alloc] initWithFrame:CGRectMake(60, 155, 100, 40)];
        lingq.textColor = RGB_COLOR_String(@"#888888");
        lingq.font = [UIFont systemFontOfSize:15];
        lingq.text = @"change";
        [_backView addSubview:lingq];
        
                
        UIView *blackLine_2 = [[UIView alloc] init];
        blackLine_2.backgroundColor = RGB_COLOR_String(@"#D6D6D6");
        [_backView addSubview:blackLine_2];
        [blackLine_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(200);
            make.height.mas_equalTo(0.6);
        }];
        

        CGRect rect = CGRectMake(SCREEN_WIDTH/2-30-132, 210, 264, 44);
        TPPasswordTextView *view1 = [[TPPasswordTextView alloc] initWithFrame:rect];
        view1.elementCount = 6;
        view1.elementBorderColor = [UIColor lightGrayColor];
        [_backView addSubview:view1];
        view1.passwordDidChangeBlock = ^(NSString *password) {
            
            if (password.length == 6) {
                _block(password);
                [self dismissPicker];
            }
        };
        
        [self reloadHeader];
    }
    return self;
}


-(void)reloadHeader{
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    NSString *headerUrl = me.userInfo.avatarUrl;
    UIImage *placeholderImage = info.avatarImage;
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:headerUrl] placeholderImage:placeholderImage];
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

-(void)finshInputPassword:(PayPasswordBlock)block{
    _block = block;
}

@end
