//
//  NTESCardVerificationCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/26.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESCardVerificationCell.h"
#import "CCCCommonTableData.h"
@interface NTESCardVerificationCell ()<UITextViewDelegate>
@property (nonatomic,strong) NIMCommonTableRow *rowData;
@end

@implementation NTESCardVerificationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.userInteractionEnabled = NO;

//        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.textColor = [UIColor lightGrayColor];
//        _titleLabel.text = @"填写验证信息";
//        _titleLabel.font = [UIFont systemFontOfSize:14];
//        [self addSubview:_titleLabel];
//        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(15);
//            make.top.mas_offset(-10);
//            make.width.mas_equalTo(100);
//            make.height.mas_equalTo(20);
//        }];
        
//        UIView *background = [[UIView alloc] init];
//        background.backgroundColor = [UIColor whiteColor];
//        [self addSubview:background];
//        [background mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(0);
//            make.right.mas_offset(0);
//            make.top.mas_offset(0);
//            make.height.mas_equalTo(100);
//        }];
//
        
        NSString *activity_add_friend_my_is = LangKey(@"activity_add_friend_my_is");
        NSString *activity_add_friend_my_request = LangKey(@"activity_add_friend_my_request");
        
        NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:[[NIMSDK sharedSDK].loginManager currentAccount]];

        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        _textView.text = [NSString stringWithFormat:@"%@%@，%@",activity_add_friend_my_is,me.userInfo.nickName,activity_add_friend_my_request];
        _textView.returnKeyType = UIReturnKeyDone;
        [self.contentView addSubview:_textView];
        _textView.layer.masksToBounds = YES;
        _textView.layer.cornerRadius = 6.;
        _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textView.layer.borderWidth = 0.7;
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.right.mas_offset(-15);
            make.top.mas_offset(10);
            make.bottom.mas_offset(-10);
        }];
        

    }
    return self;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    [NIMUserDefaults standardUserDefaults].tempVerificationInfo = textView.text;
    
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)refreshData:(NIMCommonTableRow *)rowData tableView:(UITableView *)tableView{
    
    _rowData = rowData;
    
}
@end
