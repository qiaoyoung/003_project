//
//  NTESFriendListTableViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/7/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESFriendListTableViewCell.h"
#import "NTESSessionUtil.h"
#import "BBBAvatarImageView.h"
#import "UIViewNimKit.h"
#import "AppleProjectKit.h"
#import "UIImage+AppleProjectKit.h"

@implementation NTESFriendListTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
//        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryNone;
        
        [self initSubviews];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"NTESFriendListTableViewCell";
    NTESFriendListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[NTESFriendListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:250/255.0 alpha:1.0];
//        cell.layer.cornerRadius = 12;
//        cell.backgroundColor = [UIColor clearColor];
        
    }
    return cell;
}

- (void)initSubviews {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.messageBtn];
    [self.contentView addSubview:self.videoBtn];
    
    self.iconImageView.frame = CGRectMake(15, 8, 40, 40);
    self.titleLabel.frame = CGRectMake(70, 0, 150, 56);

    self.messageBtn.frame = CGRectMake(SCREEN_WIDTH-15-24, 16, 24, 24);
//    self.videoBtn.frame = CGRectMake(SCREEN_WIDTH-15-24, 16, 24, 24);
    
}


- (void)refreshUser:(id<NIMGroupMemberProtocol>)member{
    self.titleLabel.text = member.showName;
    self.memberId = [member memberId];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:self.memberId option:nil];
    NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;
    
//    [self.iconImageView nim_setImageWithURL:url placeholderImage:info.avatarImage options:SDWebImageRetryFailed];
    [self.iconImageView sd_setImageWithURL:url placeholderImage:info.avatarImage];
}

- (void)reloadUserItem:(NIMUser *)user
{
    self.titleLabel.text = user.userInfo.nickName;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:user.userInfo.avatarUrl] placeholderImage:nil];
}

+ (CGFloat)getCellHeight:(NSDictionary *)information {
    return 56.f;
}

- (void)addSubview:(UIView *)view
{
    if (![view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view)
        [super addSubview:view];
}

- (void)onTouchmessageButton {
    if ([self.delegate respondsToSelector:@selector(didTouchMessageButton:)]) {
        [self.delegate didTouchMessageButton:self.memberId];
    }
}


- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 20;
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        _titleLabel.textColor = TextColor_1;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UIButton *)messageBtn {
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn addTarget:self action:@selector(onTouchmessageButton) forControlEvents:UIControlEventTouchUpInside];
        [_messageBtn setImage:[UIImage imageNamed:@"btn_message"] forState:UIControlStateNormal];
    }
    return _messageBtn;
}

- (UIButton *)videoBtn {
    if (!_videoBtn) {
        _videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_videoBtn setImage:[UIImage imageNamed:@"btn_video"] forState:UIControlStateNormal];
//        [_videoBtn addTarget:self action:@selector(onTouchVideoButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _videoBtn;
}


@end
