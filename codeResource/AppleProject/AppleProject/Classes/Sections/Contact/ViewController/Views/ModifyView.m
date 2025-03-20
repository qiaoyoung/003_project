
#import <Foundation/Foundation.h>

NSString *StringFromFromData(Byte *data);        


//: contact_my_tag_activity_my_friend
Byte str_messageWithData[] = {94, 33, 27, 12, 26, 52, 102, 182, 49, 126, 45, 81, 72, 84, 83, 89, 70, 72, 89, 68, 82, 94, 68, 89, 70, 76, 68, 70, 72, 89, 78, 91, 78, 89, 94, 68, 82, 94, 68, 75, 87, 78, 74, 83, 73, 219};


//: 666666
Byte str_clientStatusTitle[] = {83, 6, 36, 4, 18, 18, 18, 18, 18, 18, 163};


//: contact_fragment_group
Byte str_kickDataValue[] = {51, 22, 16, 13, 163, 92, 187, 232, 122, 81, 62, 232, 107, 83, 95, 94, 100, 81, 83, 100, 79, 86, 98, 81, 87, 93, 85, 94, 100, 79, 87, 98, 95, 101, 96, 76};


//: #875FFA
Byte str_sizeKickValue[] = {86, 7, 8, 9, 68, 236, 130, 19, 233, 27, 48, 47, 45, 62, 62, 57, 247};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ModifyView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactHeaderView.h"
#import "ModifyView.h"
//: #import "UIButton+ImageTitleSpacing.h"
#import "UIButton+Instrumentality.h"

//: @interface NTESContactHeaderView ()<UITextFieldDelegate>
@interface ModifyView ()<UITextFieldDelegate>
//: @property (nonatomic ,strong) UIView *sliderView;
@property (nonatomic ,strong) UIView *sliderView;
//: @property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UIView *backView;
//: @property (nonatomic ,strong) UIButton *mesBtn;
@property (nonatomic ,strong) UIButton *mesBtn;
//: @property (nonatomic ,strong) UIButton *resqBtn;
@property (nonatomic ,strong) UIButton *resqBtn;
//: @end
@end

//: @implementation NTESContactHeaderView
@implementation ModifyView

//: -(instancetype)initWithFrame:(CGRect)frame{
-(instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: [self initUI];
        [self initMessage];
        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    //: return self;
    return self;
}

//: -(void)initUI{
-(void)initMessage{

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

    //: UIView *sliderView = [[UIView alloc]initWithFrame:CGRectMake(15, 20, [[UIScreen mainScreen] bounds].size.width-30, 60)];
    UIView *sliderView = [[UIView alloc]initWithFrame:CGRectMake(15, 20, [[UIScreen mainScreen] bounds].size.width-30, 60)];
    //: sliderView.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    sliderView.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    //: sliderView.layer.cornerRadius = 30;
    sliderView.layer.cornerRadius = 30;
//    sliderView.backgroundColor = [UIColor clearColor];
    //: [self addSubview:sliderView];
    [self addSubview:sliderView];
    //: _sliderView = sliderView;
    _sliderView = sliderView;

    //: _mesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _mesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _mesBtn.frame = CGRectMake(8, 10, 162, 40);
    _mesBtn.frame = CGRectMake(8, 10, 162, 40);
    //: _mesBtn.tag = 200;
    _mesBtn.tag = 200;
    //: _mesBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
    _mesBtn.backgroundColor = [UIColor direction:StringFromFromData(str_sizeKickValue)];
    //: _mesBtn.layer.cornerRadius = 20;
    _mesBtn.layer.cornerRadius = 20;
    //: _mesBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _mesBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //: [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //: [_mesBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_my_tag_activity_my_friend"] forState:UIControlStateNormal];
    [_mesBtn setTitle:[MaxInformation off:StringFromFromData(str_messageWithData)] forState:UIControlStateNormal];
    //: [_mesBtn addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_mesBtn addTarget:self action:@selector(sizeMedia:) forControlEvents:UIControlEventTouchUpInside];
    //: [sliderView addSubview:_mesBtn];
    [sliderView addSubview:_mesBtn];

    //: _resqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _resqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _resqBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-30-8-170, 10, 162, 40);
    _resqBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-30-8-170, 10, 162, 40);
    //: _resqBtn.tag = 201;
    _resqBtn.tag = 201;
//    resqBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
    //: _resqBtn.layer.cornerRadius = 20;
    _resqBtn.layer.cornerRadius = 20;
    //: _resqBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _resqBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //: [_resqBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    [_resqBtn setTitleColor:[UIColor direction:StringFromFromData(str_clientStatusTitle)] forState:UIControlStateNormal];
    //: [_resqBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_fragment_group"] forState:UIControlStateNormal];
    [_resqBtn setTitle:[MaxInformation off:StringFromFromData(str_kickDataValue)] forState:UIControlStateNormal];
    //: [_resqBtn addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_resqBtn addTarget:self action:@selector(sizeMedia:) forControlEvents:UIControlEventTouchUpInside];
    //: [sliderView addSubview:_resqBtn];
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
//            lineView.backgroundColor = [UIColor colorWithPatternImage:[LandHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
//            button.selected = YES;
//        } else if (i == 1){
//            [button setImage:[UIImage imageNamed:@"ic_group"] forState:(UIControlStateNormal)];
//            [button setImage:[UIImage imageNamed:@"ic_group_current"] forState:(UIControlStateSelected)];
//
//        }
//
//    }
}

//: -(void)sliderButtonClick:(UIButton *)sender{
-(void)sizeMedia:(UIButton *)sender{

    //: sender.selected = YES;
    sender.selected = YES;

    //: if(sender == self.mesBtn){
    if(sender == self.mesBtn){
        //: _mesBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
        _mesBtn.backgroundColor = [UIColor direction:StringFromFromData(str_sizeKickValue)];
        //: [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //: _resqBtn.backgroundColor = [UIColor clearColor];
        _resqBtn.backgroundColor = [UIColor clearColor];
        //: [_resqBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [_resqBtn setTitleColor:[UIColor direction:StringFromFromData(str_clientStatusTitle)] forState:UIControlStateNormal];
    //: }else if (sender == self.resqBtn){
    }else if (sender == self.resqBtn){
        //: _resqBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
        _resqBtn.backgroundColor = [UIColor direction:StringFromFromData(str_sizeKickValue)];
        //: [_resqBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_resqBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //: _mesBtn.backgroundColor = [UIColor clearColor];
        _mesBtn.backgroundColor = [UIColor clearColor];
        //: [_mesBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [_mesBtn setTitleColor:[UIColor direction:StringFromFromData(str_clientStatusTitle)] forState:UIControlStateNormal];
    }


    //: if (self.delegate && [self.delegate respondsToSelector:@selector(sliderWithIndex:)]) {
    if (self.delegate && [self.delegate respondsToSelector:@selector(beforeTeamIndex:)]) {
        //: [self.delegate sliderWithIndex:sender.tag -200];
        [self.delegate beforeTeamIndex:sender.tag -200];
    }

}

//: -(void)buttonClick:(UIButton *)sender{
-(void)loadded:(UIButton *)sender{
    //: NSInteger tag = sender.tag -100;
    NSInteger tag = sender.tag -100;
    //: switch (tag) {
    switch (tag) {
        //: case 0:
        case 0:
        {
            //: if (self.delegate && [self.delegate respondsToSelector:@selector(friendNotification)]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(markChild)]) {
                //: [self.delegate friendNotification];
                [self.delegate markChild];
            }
        }
            //: break;
            break;
        //: case 1:
        case 1:
        {
            //: if (self.delegate && [self.delegate respondsToSelector:@selector(friendNotification)]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(markChild)]) {
                //: [self.delegate groupNotification];
                [self.delegate currValue];
            }
        }
            //: break;
            break;
        //: case 2:
        case 2:
        {
            //: if (self.delegate && [self.delegate respondsToSelector:@selector(blackFriendList)]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(beyondTitle)]) {
                //: [self.delegate blackFriendList];
                [self.delegate beyondTitle];
            }
        }
            //: break;
            break;

        //: default:
        default:
            //: break;
            break;
    }
}



//: - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    //: if (self.delegate &&[self.delegate respondsToSelector:@selector(searchClick)]) {
    if (self.delegate &&[self.delegate respondsToSelector:@selector(everyArrayLabel)]) {
        //: [self.delegate searchClick];
        [self.delegate everyArrayLabel];
    }

    //: return NO;
    return NO;
}

//: -(void)reloadCountNumber:(NSInteger)systemCount{
-(void)status:(NSInteger)systemCount{
    //: [self reloadAddFriend];
    [self workflow];
    //: [self reloadGroup];
    [self groupKey];
}

//: -(void)reloadAddFriend{
-(void)workflow{
    //: NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    //: filter.notificationTypes = @[@(5)];
    filter.notificationTypes = @[@(5)];
    //: NSInteger systemCount = [[[NIMSDK sharedSDK] systemNotificationManager] allUnreadCount:filter];
    NSInteger systemCount = [[[NIMSDK sharedSDK] systemNotificationManager] allUnreadCount:filter];
    //: UILabel *label = [_backView viewWithTag:500];
    UILabel *label = [_backView viewWithTag:500];
    //: label.text = [NSString stringWithFormat:@"%ld",systemCount];
    label.text = [NSString stringWithFormat:@"%ld",systemCount];
    //: if (systemCount > 0) {
    if (systemCount > 0) {
        //: label.hidden = NO;
        label.hidden = NO;
    //: }else{
    }else{
        //: label.hidden = YES;
        label.hidden = YES;
    }
}

//: -(void)reloadGroup{
-(void)groupKey{
    //: NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    //: filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(15),@(16),@(17),@(18)];
    filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(15),@(16),@(17),@(18)];
    //: NSInteger systemCount = [[[NIMSDK sharedSDK] systemNotificationManager] allUnreadCount:filter];
    NSInteger systemCount = [[[NIMSDK sharedSDK] systemNotificationManager] allUnreadCount:filter];
    //: UILabel *label = [_backView viewWithTag:500 +1];
    UILabel *label = [_backView viewWithTag:500 +1];
    //: label.text = [NSString stringWithFormat:@"%ld",systemCount];
    label.text = [NSString stringWithFormat:@"%ld",systemCount];
    //: if (systemCount > 0) {
    if (systemCount > 0) {
        //: label.hidden = NO;
        label.hidden = NO;
    //: }else{
    }else{
        //: label.hidden = YES;
        label.hidden = YES;
    }
}

//: @end
@end

Byte * FromDataToCache(Byte *data) {
    int post = data[0];
    int table = data[1];
    Byte streetSmart = data[2];
    int turn = data[3];
    if (!post) return data + turn;
    for (int i = turn; i < turn + table; i++) {
        int value = data[i] + streetSmart;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[turn + table] = 0;
    return data + turn;
}

NSString *StringFromFromData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)FromDataToCache(data)];
}
