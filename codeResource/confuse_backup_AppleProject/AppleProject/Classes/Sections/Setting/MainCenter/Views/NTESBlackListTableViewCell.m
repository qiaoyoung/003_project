//
//  NTESBlackListTableViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESBlackListTableViewCell.h"
#import "BBBAvatarImageView.h"
#import "UIView+NTES.h"
#import "NTESContactDataMember.h"
#import "NTESSessionUtil.h"

@implementation NTESBlackListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.layer.cornerRadius = 8;
        self.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        self.layer.shadowOffset = CGSizeMake(0,3);
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 0;
        
        [self initSubviews];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"NTESBlackListTableViewCell";
    NTESBlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[NTESBlackListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:250/255.0 alpha:1.0];
//        cell.layer.cornerRadius = 12;
//        cell.backgroundColor = [UIColor whiteColor];
        
    }
    return cell;
}

- (void)initSubviews {

    _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 40, 40)];
    _avatarImageView.layer.cornerRadius = 20;
    _avatarImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_avatarImageView];
    UITapGestureRecognizer *panGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchAvatar:)];
    [_avatarImageView addGestureRecognizer:panGesture];

    
    _cancleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _cancleBtn.frame = CGRectMake(0, 0, 70, 26);
//         _cancleBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_cancleBtn setTitle:LangKey(@"black_list_item_remove") forState:(UIControlStateNormal)];//移除
    [_cancleBtn addTarget:self action:@selector(onTouchButton) forControlEvents:(UIControlEventTouchUpInside)];
    [_cancleBtn setTitleColor:ThemeColor forState:(UIControlStateNormal)];
    _cancleBtn.layer.cornerRadius = 4;
    _cancleBtn.layer.borderWidth = 1/[UIScreen mainScreen].scale;
    _cancleBtn.layer.borderColor = ThemeColor.CGColor;
    _cancleBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:_cancleBtn];
    
//    self.cancleBtn.right = self.width - 10;
//    self.cancleBtn.centerY = self.height * .5f;
    
    [self.contentView addSubview:self.labName];
    self.labName.frame = CGRectMake(15+40+15, 10, self.width-140, 40);
}

- (void)refreshWithMember:(NTESContactDataMember *)member{
    self.member = member;
    self.labName.text = [NTESSessionUtil showNick:member.info.infoId inSession:nil];
//    [self.textLabel sizeToFit];
    NSURL *url;
    if (member.info.avatarUrlString.length) {
        url = [NSURL URLWithString:member.info.avatarUrlString];
    }
    [_avatarImageView sd_setImageWithURL:url placeholderImage:member.info.avatarImage];
}

- (void)onTouchAvatar:(id)sender{
    if ([self.delegate respondsToSelector:@selector(didTouchUserListAvatar:)]) {
        [self.delegate didTouchUserListAvatar:self.member.info.infoId];
    }
}


- (void)onTouchButton {
    if ([self.delegate respondsToSelector:@selector(didTouchCancleButton:)]) {
        [self.delegate didTouchCancleButton:self.member];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];


    self.cancleBtn.right = self.width - 10;
    self.cancleBtn.centerY = self.height * .5f;
}

- (void)addSubview:(UIView *)view
{
    if (![view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view)
        [super addSubview:view];
}


- (UILabel *)labName {
    if (!_labName) {
        _labName = [[UILabel alloc] init];
        _labName.font = [UIFont systemFontOfSize:16.f];
        _labName.textColor = TextColor_4;
        _labName.textAlignment = NSTextAlignmentLeft;
    }
    return _labName;
}





@end
