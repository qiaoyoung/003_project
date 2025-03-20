//
//  AAASetGroupNameView.m
//  NIM
//
//  Created by Yan Wang on 2024/6/28.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "AAASetGroupNameView.h"

@interface AAASetGroupNameView ()<UITextFieldDelegate>

@property (nonatomic,assign) NSInteger inputLimit;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subtitleLabel;
@property(nonatomic, strong) UIView *lineView;
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UITextField *searchField;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UIView *box;

@end

@implementation AAASetGroupNameView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self initUI];
        self.inputLimit = 30;
        
    }
    return self;
}


- (void)initUI{
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, (SCREEN_HEIGHT-272)/2, SCREEN_WIDTH-40, 232)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];
//    [UIView animateWithDuration:2.0f delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
//        _box.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 166);
//        }  completion:^(BOOL finished) {
//            _box.frame = CGRectMake(0, SCREEN_HEIGHT-166, SCREEN_WIDTH, 166);
//        }];
    
//    [_box addSubview:self.closeBtn];
//    self.closeBtn.frame = CGRectMake(15, 16, 20, 20);
    
    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(0, 20, SCREEN_WIDTH-40, 20);
    
    [_box addSubview:self.subtitleLabel];
    self.subtitleLabel.frame = CGRectMake(0, self.titleLabel.bottom+8, SCREEN_WIDTH-40, 15);
    
    

    
    [_box addSubview:self.searchView];
    self.searchView.frame = CGRectMake(20, self.subtitleLabel.bottom+15, SCREEN_WIDTH-80, 52);

    [_box addSubview:self.numLabel];
    self.numLabel.frame = CGRectMake(20, self.searchView.bottom+10, SCREEN_WIDTH-80, 20);
    
    CGFloat width = (SCREEN_WIDTH-100)/2;
    CGFloat height = 40;
    
    [_box addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(20, self.numLabel.bottom+10, width, height);
    
    [_box addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake(width+40, self.numLabel.bottom+10, width, height);
 
    
    
}

//- (void)reloadWithNickname:(NSString *)nickname
//{
//    self.titleLabel.text = @"昵称".nim_localized;
//    self.searchField.text = nickname;
//    self.numLabel.text = [NSString stringWithFormat:@"%lu/%ld",self.searchField.text.length,(long)(unsigned long)self.inputLimit];
//}

- (void)updateTheNickname{
    
    [self endEditing:YES];
//    self.box.frame = CGRectMake(0, SCREEN_HEIGHT-180, SCREEN_WIDTH, 180);
    
    self.speiceBackBlock(self.searchField.text);
    
    
//    if (!self.titleLabel.text.length) {
//        [self makeToast:@"昵称不能为空".nim_localized duration:2.0 position:CSToastPositionCenter];
//        return;
//    }
//    if (self.titleLabel.text.length > self.inputLimit) {
//        [self makeToast:@"昵称过长".nim_localized duration:2.0 position:CSToastPositionCenter];
//        return;
//    }
//    [SVProgressHUD show];
//    __weak typeof(self) wself = self;
//    [[NIMSDK sharedSDK].userManager updateMyUserInfo:@{@(NIMUserInfoUpdateTagNick) : self.titleLabel.text} completion:^(NSError *error) {
//        [SVProgressHUD dismiss];
//        if (!error) {
//            [wself makeToast:@"昵称设置成功".nim_localized
//                         duration:2
//                         position:CSToastPositionCenter];
////            [wself.navigationController popViewControllerAnimated:NO];
//            [self animationClose];
//
//        }else{
//            [wself makeToast:@"昵称设置失败，请重试".nim_localized
//                         duration:2
//                         position:CSToastPositionCenter];
//        }
//    }];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    self.box.frame = CGRectMake(0, SCREEN_HEIGHT-508, SCREEN_WIDTH, 508);
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    // 如果是删除键
//    if ([string length] == 0 && range.length > 0)
//    {
//        return YES;
//    }
    NSString *genString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (self.inputLimit && genString.length > self.inputLimit) {
        return NO;
    }
    self.numLabel.text = [NSString stringWithFormat:@"%lu/%ld",genString.length+1,(long)(unsigned long)self.inputLimit];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
//    self.titleLabel.text = textField.text;
    self.numLabel.text = [NSString stringWithFormat:@"%lu/%ld",self.titleLabel.text.length,(long)(unsigned long)self.inputLimit];
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    self.searchField.text = @"";
    self.numLabel.text = [NSString stringWithFormat:@"%lu/%ld",self.searchField.text.length,(long)(unsigned long)self.inputLimit];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    self.box.frame = CGRectMake(0, SCREEN_HEIGHT-180, SCREEN_WIDTH, 180);
    return [textField resignFirstResponder];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
//    self.box.frame = CGRectMake(0, SCREEN_HEIGHT-180, SCREEN_WIDTH, 180);
}
#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.text = LangKey(@"activity_group_nickname_title");
    }
    return _titleLabel;
}
- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:12.f];
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;
        _subtitleLabel.textColor = ThemeColor;
        _subtitleLabel.text = LangKey(@"Required");
    }
    return _subtitleLabel;
}

- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.font = [UIFont systemFontOfSize:12.f];
        _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.textColor = TextColor_2;
    }
    return _numLabel;
}


- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_closeBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
        [_closeBtn setTitle:LangKey(@"contact_tag_fragment_cancel") forState:UIControlStateNormal];
        _closeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _closeBtn.layer.borderWidth = 0.5;
        _closeBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        _closeBtn.layer.cornerRadius = 10;
        _closeBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        _closeBtn.layer.shadowOffset = CGSizeMake(0,3);
        _closeBtn.layer.shadowOpacity = 1;
        _closeBtn.layer.shadowRadius = 0;
    }
    return _closeBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn addTarget:self action:@selector(updateTheNickname) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"contact_tag_fragment_sure") forState:UIControlStateNormal];
        _sureBtn.backgroundColor = ThemeColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = DeepBtnColor.CGColor;
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowRadius = 0;
        
    }
    return _sureBtn;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = CommonBGView_Color;
    }
    return _lineView;
}

- (UIView *)searchView{
    if(!_searchView){
        _searchView = [[UIView alloc]init];
        _searchView.backgroundColor = CommonBGView_Color;
        _searchView.layer.cornerRadius = 8;
        _searchView.layer.borderWidth = 1;
        _searchView.layer.borderColor = ThemeColor.CGColor;
        
        _searchField = [[UITextField alloc]initWithFrame:CGRectMake(15, 6, SCREEN_WIDTH-80-30, 40)];
        _searchField.placeholder = LangKey(@"contact_tag_fragment_name");
        _searchField.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        _searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchField.delegate = self;
        [_searchView addSubview:_searchField];
        
    }
    return _searchView;
}

- (void)animationClose
{
    self.hidden = YES;
//    self.box.frame = CGRectMake(0, SCREEN_HEIGHT-180, SCREEN_WIDTH, 180);
//        [UIView animateWithDuration:0.3f
//                         animations:^{
//
//            self.alpha = 0.0;
//            self.box.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 180);
//                         }
//                         completion:nil];
}

- (void)animationShow
{
    self.hidden = NO;
//    self.box.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 180);
//     
//        [UIView animateWithDuration:0.3 animations:^{
//             self.alpha = 1.0;
//            self.box.frame = CGRectMake(0, SCREEN_HEIGHT-180, SCREEN_WIDTH, 180);
//            
//        } completion:nil];

     
    
}


@end
