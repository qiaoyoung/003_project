//
//  NTESContactHeaderView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESContactHeaderView.h"
#import "UIButton+ImageTitleSpacing.h"

@interface NTESContactHeaderView ()<UITextFieldDelegate>
@property (nonatomic ,strong) UIView *sliderView;
@property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UIButton *mesBtn;
@property (nonatomic ,strong) UIButton *resqBtn;
@end

@implementation NTESContactHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)initUI{

//    NSArray *titleArray = @[
//
//        LangKey(@"fragment_contact_new_friend"),
//        LangKey(@"group_notification"),
//        LangKey(@"func_viewholder_black"),
//
//    ];
//
//
//
//    UIView *bgView = [[UIView alloc] init];
//    bgView.backgroundColor = [UIColor whiteColor];
//    [self addSubview:bgView];
//    _backView = bgView;
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(0);
//        make.right.mas_offset(0);
//        make.top.mas_offset(0);
//        make.height.mas_equalTo(12+12+41);
//    }];
//
//
//    UIView *lineViews = [[UIView alloc] init];
//    lineViews.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
//    [self addSubview:lineViews];
//    [lineViews mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(0);
//        make.right.mas_offset(0);
//        make.top.mas_equalTo(bgView.mas_bottom).mas_offset(0);
//        make.height.mas_equalTo(1);
//    }];
//
//
//    for (int i = 0; i < 3; i++) {
//
//        CGFloat x;
//        NSString *imageName;
//        if (i==0) {
//            imageName = @"ic_New_friend";
//            x = 0.4;
//        } else if (i==1) {
//            imageName = @"ic_Group_notice";
//            x = 1;
//        } else {
//            imageName = @"ic_Blacklist";
//            x = 1.6;
//        }
//
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.tag = 100 +i;
//        btn.backgroundColor = [UIColor clearColor];
//        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [bgView addSubview:btn];
//        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.multipliedBy(x);
//            make.centerY.mas_offset(0);
//            make.width.mas_equalTo(110);
//            make.height.mas_equalTo(40);
//        }];
//        [btn setTitle:titleArray[i] forState:(UIControlStateNormal)];
//        [btn setTitleColor:RGB_COLOR_String(@"#3F3F3F") forState:(UIControlStateNormal)];
//        btn.titleLabel.font = [UIFont systemFontOfSize:12];;
//        [btn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleTop) imageTitleSpace:3];
//
//        UILabel *numLabel = [[UILabel alloc] init];
//        numLabel.tag = 500 + i;
//        numLabel.hidden = YES;
//        numLabel.backgroundColor = [UIColor redColor];
//        numLabel.font = [UIFont systemFontOfSize:11];
//        numLabel.textColor = [UIColor whiteColor];
//        numLabel.textAlignment = NSTextAlignmentCenter;
//        [_backView addSubview:numLabel];
//        numLabel.layer.masksToBounds = YES;
//        numLabel.layer.cornerRadius = 8;
//        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(btn).mas_offset(-3);
//            make.right.mas_equalTo(btn).mas_offset(-3);
//            make.width.height.mas_equalTo(16);
//        }];
//
//    }
    
    UIView *sliderView = [[UIView alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-30, 60)];
    sliderView.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    sliderView.layer.cornerRadius = 30;
//    sliderView.backgroundColor = [UIColor clearColor];
    [self addSubview:sliderView];
    _sliderView = sliderView;
 
    _mesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _mesBtn.frame = CGRectMake(8, 10, 162, 40);
    _mesBtn.tag = 200;
    _mesBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
    _mesBtn.layer.cornerRadius = 20;
    _mesBtn.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_mesBtn setTitle:LangKey(@"contact_my_tag_activity_my_friend") forState:UIControlStateNormal];
    [_mesBtn addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sliderView addSubview:_mesBtn];

    _resqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _resqBtn.frame = CGRectMake(SCREEN_WIDTH-30-8-170, 10, 162, 40);
    _resqBtn.tag = 201;
//    resqBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
    _resqBtn.layer.cornerRadius = 20;
    _resqBtn.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_resqBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    [_resqBtn setTitle:LangKey(@"contact_fragment_group") forState:UIControlStateNormal];
    [_resqBtn addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sliderView addSubview:_resqBtn];
    
//    for (int i = 0; i<2; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.tag = 200 + i;
//        [button addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [sliderView addSubview:button];
//
//        [button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.multipliedBy(1);
//            make.centerX.multipliedBy(0.5+1*i).mas_offset(i*10);
//            make.width.mas_equalTo(80);
//            make.height.mas_equalTo(44);
//        }];
//
//        UIView *lineView = [[UIView alloc] init];
//        lineView.tag = 2000 + i;
//        [sliderView addSubview:lineView];
//        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(SCREEN_WIDTH/2.f*i);
//            make.width.mas_equalTo(SCREEN_WIDTH/2.f);
//            make.top.mas_equalTo(button.mas_bottom).mas_offset(-3);
//            make.height.mas_equalTo(2);
//        }];
//
//        if (i == 0) {
//            [button setImage:[UIImage imageNamed:@"ic_friends"] forState:(UIControlStateNormal)];
//            [button setImage:[UIImage imageNamed:@"ic_friends_current"] forState:(UIControlStateSelected)];
//
//            lineView.backgroundColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
//            button.selected = YES;
//        } else if (i == 1){
//            [button setImage:[UIImage imageNamed:@"ic_group"] forState:(UIControlStateNormal)];
//            [button setImage:[UIImage imageNamed:@"ic_group_current"] forState:(UIControlStateSelected)];
//
//        }
//
//    }
}

-(void)sliderButtonClick:(UIButton *)sender{
    
    sender.selected = YES;
    
    if(sender == self.mesBtn){
        _mesBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
        [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _resqBtn.backgroundColor = [UIColor clearColor];
        [_resqBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    }else if (sender == self.resqBtn){
        _resqBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
        [_resqBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _mesBtn.backgroundColor = [UIColor clearColor];
        [_mesBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    }
  

    if (self.delegate && [self.delegate respondsToSelector:@selector(sliderWithIndex:)]) {
        [self.delegate sliderWithIndex:sender.tag -200];
    }
    
}

-(void)buttonClick:(UIButton *)sender{
    NSInteger tag = sender.tag -100;
    switch (tag) {
        case 0:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(friendNotification)]) {
                [self.delegate friendNotification];
            }
        }
            break;
        case 1:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(friendNotification)]) {
                [self.delegate groupNotification];
            }
        }
            break;
        case 2:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(blackFriendList)]) {
                [self.delegate blackFriendList];
            }
        }
            break;
            
        default:
            break;
    }
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (self.delegate &&[self.delegate respondsToSelector:@selector(searchClick)]) {
        [self.delegate searchClick];
    }
    
    return NO;
}

-(void)reloadCountNumber:(NSInteger)systemCount{
    [self reloadAddFriend];
    [self reloadGroup];
}

-(void)reloadAddFriend{
    NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    filter.notificationTypes = @[@(5)];
    NSInteger systemCount = [[[NIMSDK sharedSDK] systemNotificationManager] allUnreadCount:filter];
    UILabel *label = [_backView viewWithTag:500];
    label.text = [NSString stringWithFormat:@"%ld",systemCount];
    if (systemCount > 0) {
        label.hidden = NO;
    }else{
        label.hidden = YES;
    }
}

-(void)reloadGroup{
    NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(15),@(16),@(17),@(18)];
    NSInteger systemCount = [[[NIMSDK sharedSDK] systemNotificationManager] allUnreadCount:filter];
    UILabel *label = [_backView viewWithTag:500 +1];
    label.text = [NSString stringWithFormat:@"%ld",systemCount];
    if (systemCount > 0) {
        label.hidden = NO;
    }else{
        label.hidden = YES;
    }
}

@end
