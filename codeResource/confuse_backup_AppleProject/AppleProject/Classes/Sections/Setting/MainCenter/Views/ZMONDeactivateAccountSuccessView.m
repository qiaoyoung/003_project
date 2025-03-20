//
//  ZMONDeactivateAccountSuccessView.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/6.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import "ZMONDeactivateAccountSuccessView.h"

@interface ZMONDeactivateAccountSuccessView ()

@property (nonatomic,strong) UIView *box;

@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *img;

@property (nonatomic,strong) UIView *nextBox;

@end

@implementation ZMONDeactivateAccountSuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self initUI];
        
    }
    return self;
}


- (void)initUI{
    _box = [[UIView alloc]initWithFrame:CGRectMake(15, (SCREEN_HEIGHT-238)/2, SCREEN_WIDTH-30, 238)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];
    

    [_box addSubview:self.img];
    self.img.frame = CGRectMake((SCREEN_WIDTH-30-32)/2, 20, 32, 32);
    
    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(0, self.img.bottom+15, SCREEN_WIDTH-30, 20);
    
    [_box addSubview:self.nextBox];
    self.nextBox.frame = CGRectMake(20, self.titleLabel.bottom+20, SCREEN_WIDTH-70, 54);
    

    
    CGFloat width = (SCREEN_WIDTH-70);
    CGFloat height = 40;
    
    [_box addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake(20, 238-20-height, width, height);
    
}

- (void)reloadWithNickname:(NSString *)nickname
{
    self.titleLabel.text = nickname;
}

- (void)updateTheNickname
{
    
    [ZCHttpManager deleteUser:^(NSDictionary * _Nonnull configDict) {
        [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error)
         {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NTESNotificationLogout" object:nil];
        }];
    }];
    
 
}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.numberOfLines = 1;
//        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
//        _titleLabel.text = LangKey(@"deactivated_success");
    }
    return _titleLabel;
}

- (UIImageView *)img
{
    if(!_img){
        _img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safe_success_tip"]];
    }
    return _img;
}

- (UIView *)nextBox
{
    if(!_nextBox){
        _nextBox = [[UIView alloc]init];
        
        CGFloat width = (SCREEN_WIDTH-30-40)/3;
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 54)];
        [_nextBox addSubview:view1];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        img1.image = [UIImage imageNamed:@"safe_success_step"];
        [view1 addSubview:img1];

        
        UILabel *labtitle1 = [[UILabel alloc] initWithFrame:CGRectMake(0, img1.bottom+4, width, 30)];
        labtitle1.font = [UIFont systemFontOfSize:11.f];
        labtitle1.textColor = [UIColor blackColor];
        labtitle1.text = LangKey(@"Read_agree_agreement");
        labtitle1.numberOfLines = 2;
        labtitle1.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:labtitle1];
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(width, 0, width, 54)];
        [_nextBox addSubview:view2];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        img2.image = [UIImage imageNamed:@"safe_success_step"];
        [view2 addSubview:img2];
        UILabel *labtitle2 = [[UILabel alloc] initWithFrame:CGRectMake(0, img2.bottom+4, width, 30)];
        labtitle2.font = [UIFont systemFontOfSize:11.f];
        labtitle2.textColor = [UIColor blackColor];
        labtitle2.text = LangKey(@"Vertify_login_password");
        labtitle2.numberOfLines = 2;
        labtitle2.textAlignment = NSTextAlignmentCenter;
        [view2 addSubview:labtitle2];
        
        UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(width*2, 0, width, 54)];
        [_nextBox addSubview:view3];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        img3.image = [UIImage imageNamed:@"safe_success_step"];
        [view3 addSubview:img3];
        UILabel *labtitle3 = [[UILabel alloc] initWithFrame:CGRectMake(0, img3.bottom+4, width, 30)];
        labtitle3.font = [UIFont systemFontOfSize:11.f];
        labtitle3.textColor = [UIColor blackColor];
        labtitle3.text = LangKey(@"Complete_operation");
        labtitle3.numberOfLines = 2;
        labtitle3.textAlignment = NSTextAlignmentCenter;
        [view3 addSubview:labtitle3];
        
        UIImageView *arrow1 = [[UIImageView alloc]initWithFrame:CGRectMake(width-10, 4, 20, 12)];
        arrow1.image = [UIImage imageNamed:@"safe_arrow_next"];
        [_nextBox addSubview:arrow1];
        
        UIImageView *arrow2 = [[UIImageView alloc]initWithFrame:CGRectMake(width*2-10, 4, 20, 12)];
        arrow2.image = [UIImage imageNamed:@"safe_arrow_next"];
        [_nextBox addSubview:arrow2];
    }
    return _nextBox;
}


//- (UIButton *)closeBtn {
//    if (!_closeBtn) {
//        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
//        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        [_closeBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
//        [_closeBtn setTitle:LangKey(@"contact_tag_fragment_cancel") forState:UIControlStateNormal];
//        _closeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
//        _closeBtn.layer.borderWidth = 0.5;
//        _closeBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
//        _closeBtn.layer.cornerRadius = 10;
//        _closeBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
//        _closeBtn.layer.shadowOffset = CGSizeMake(0,3);
//        _closeBtn.layer.shadowOpacity = 1;
//        _closeBtn.layer.shadowRadius = 0;
//    }
//    return _closeBtn;
//}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn addTarget:self action:@selector(updateTheNickname) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureBtn setTitleColor:RGB_COLOR_String(@"#ffffff") forState:UIControlStateNormal];
        [_sureBtn setTitle:@"OK" forState:UIControlStateNormal];
        _sureBtn.backgroundColor = ThemeColor;
//        _sureBtn.layer.borderWidth = 0.5;
//        _sureBtn.layer.borderColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = DeepBtnColor.CGColor;
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowRadius = 0;

    }
    return _sureBtn;
}



- (void)animationClose
{
    self.hidden = YES;
}

- (void)animationShow
{
    self.hidden = NO;

}

@end
