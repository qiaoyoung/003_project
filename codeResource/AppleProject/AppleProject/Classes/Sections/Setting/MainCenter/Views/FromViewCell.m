
#import <Foundation/Foundation.h>

NSString *StringFromShowMaxData(Byte *data);        


//: #333333
Byte str_imposeName[] = {68, 7, 47, 6, 44, 170, 244, 4, 4, 4, 4, 4, 4, 238};


//: #2BBCFB
Byte str_schemeIndexValue[] = {4, 7, 44, 13, 74, 70, 144, 31, 107, 182, 205, 195, 247, 247, 6, 22, 22, 23, 26, 22, 46};


//: black_list_item_remove
Byte str_originAccordingName[] = {10, 22, 67, 8, 13, 85, 199, 94, 31, 41, 30, 32, 40, 28, 41, 38, 48, 49, 28, 38, 49, 34, 42, 28, 47, 34, 42, 44, 51, 34, 105};


//: _UITableViewCellSeparatorView
Byte str_threeName[] = {8, 29, 57, 10, 192, 52, 55, 30, 177, 255, 38, 28, 16, 27, 40, 41, 51, 44, 29, 48, 44, 62, 10, 44, 51, 51, 26, 44, 55, 40, 57, 40, 59, 54, 57, 29, 48, 44, 62, 204};

// __DEBUG__
// __CLOSE_PRINT__
//
//  FromViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESBlackListTableViewCell.h"
#import "FromViewCell.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESContactDataMember.h"
#import "ContactAt.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"

//: @implementation NTESBlackListTableViewCell
@implementation FromViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryType = UITableViewCellAccessoryNone;

        //: self.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //: self.layer.cornerRadius = 8;
        self.layer.cornerRadius = 8;
        //: self.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        self.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        //: self.layer.shadowOffset = CGSizeMake(0,3);
        self.layer.shadowOffset = CGSizeMake(0,3);
        //: self.layer.shadowOpacity = 1;
        self.layer.shadowOpacity = 1;
        //: self.layer.shadowRadius = 0;
        self.layer.shadowRadius = 0;

        //: [self initSubviews];
        [self initWithSubviews];
    }
    //: return self;
    return self;
}

//: + (instancetype)cellWithTableView:(UITableView *)tableView
+ (instancetype)cell:(UITableView *)tableView
{
    //: static NSString *identifier = @"NTESBlackListTableViewCell";
    static NSString *identifier = @"FromViewCell";
    //: NTESBlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    FromViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //: if (!cell)
    if (!cell)
    {
        //: cell = [[NTESBlackListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[FromViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:250/255.0 alpha:1.0];
//        cell.layer.cornerRadius = 12;
//        cell.backgroundColor = [UIColor whiteColor];

    }
    //: return cell;
    return cell;
}

//: - (void)initSubviews {
- (void)initWithSubviews {

    //: _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 40, 40)];
    _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 40, 40)];
    //: _avatarImageView.layer.cornerRadius = 20;
    _avatarImageView.layer.cornerRadius = 20;
    //: _avatarImageView.layer.masksToBounds = YES;
    _avatarImageView.layer.masksToBounds = YES;
    //: [self.contentView addSubview:_avatarImageView];
    [self.contentView addSubview:_avatarImageView];
    //: UITapGestureRecognizer *panGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchAvatar:)];
    UITapGestureRecognizer *panGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorHighlight:)];
    //: [_avatarImageView addGestureRecognizer:panGesture];
    [_avatarImageView addGestureRecognizer:panGesture];


    //: _cancleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _cancleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //: _cancleBtn.frame = CGRectMake(0, 0, 70, 26);
    _cancleBtn.frame = CGRectMake(0, 0, 70, 26);
//         _cancleBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    //: _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    //: [_cancleBtn setTitle:[NTESLanguageManager getTextWithKey:@"black_list_item_remove"] forState:(UIControlStateNormal)];
    [_cancleBtn setTitle:[MaxInformation off:StringFromShowMaxData(str_originAccordingName)] forState:(UIControlStateNormal)];//移除
    //: [_cancleBtn addTarget:self action:@selector(onTouchButton) forControlEvents:(UIControlEventTouchUpInside)];
    [_cancleBtn addTarget:self action:@selector(searchDetect) forControlEvents:(UIControlEventTouchUpInside)];
    //: [_cancleBtn setTitleColor:[UIColor colorWithHexString:@"#2BBCFB"] forState:(UIControlStateNormal)];
    [_cancleBtn setTitleColor:[UIColor direction:StringFromShowMaxData(str_schemeIndexValue)] forState:(UIControlStateNormal)];
    //: _cancleBtn.layer.cornerRadius = 4;
    _cancleBtn.layer.cornerRadius = 4;
    //: _cancleBtn.layer.borderWidth = 1/[UIScreen mainScreen].scale;
    _cancleBtn.layer.borderWidth = 1/[UIScreen mainScreen].scale;
    //: _cancleBtn.layer.borderColor = [UIColor colorWithHexString:@"#2BBCFB"].CGColor;
    _cancleBtn.layer.borderColor = [UIColor direction:StringFromShowMaxData(str_schemeIndexValue)].CGColor;
    //: _cancleBtn.layer.masksToBounds = YES;
    _cancleBtn.layer.masksToBounds = YES;
    //: [self.contentView addSubview:_cancleBtn];
    [self.contentView addSubview:_cancleBtn];

//    self.cancleBtn.right = self.width - 10;
//    self.cancleBtn.centerY = self.height * .5f;

    //: [self.contentView addSubview:self.labName];
    [self.contentView addSubview:self.labName];
    //: self.labName.frame = CGRectMake(15+40+15, 10, self.width-140, 40);
    self.labName.frame = CGRectMake(15+40+15, 10, self.width-140, 40);
}

//: - (void)refreshWithMember:(NTESContactDataMember *)member{
- (void)director:(ContactAt *)member{
    //: self.member = member;
    self.member = member;
    //: self.labName.text = [NTESSessionUtil showNick:member.info.infoId inSession:nil];
    self.labName.text = [ChildMark corner:member.info.infoId placeText:nil];
//    [self.textLabel sizeToFit];
    //: NSURL *url;
    NSURL *url;
    //: if (member.info.avatarUrlString.length) {
    if (member.info.avatarUrlString.length) {
        //: url = [NSURL URLWithString:member.info.avatarUrlString];
        url = [NSURL URLWithString:member.info.avatarUrlString];
    }
    //: [_avatarImageView sd_setImageWithURL:url placeholderImage:member.info.avatarImage];
    [_avatarImageView sd_setImageWithURL:url placeholderImage:member.info.avatarImage];
}

//: - (void)onTouchAvatar:(id)sender{
- (void)colorHighlight:(id)sender{
    //: if ([self.delegate respondsToSelector:@selector(didTouchUserListAvatar:)]) {
    if ([self.delegate respondsToSelector:@selector(ting:)]) {
        //: [self.delegate didTouchUserListAvatar:self.member.info.infoId];
        [self.delegate ting:self.member.info.infoId];
    }
}


//: - (void)onTouchButton {
- (void)searchDetect {
    //: if ([self.delegate respondsToSelector:@selector(didTouchCancleButton:)]) {
    if ([self.delegate respondsToSelector:@selector(containerExamineed:)]) {
        //: [self.delegate didTouchCancleButton:self.member];
        [self.delegate containerExamineed:self.member];
    }
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];


    //: self.cancleBtn.right = self.width - 10;
    self.cancleBtn.right = self.width - 10;
    //: self.cancleBtn.centerY = self.height * .5f;
    self.cancleBtn.centerY = self.height * .5f;
}

//: - (void)addSubview:(UIView *)view
- (void)addSubview:(UIView *)view
{
    //: if (![view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view)
    if (![view isKindOfClass:[NSClassFromString(StringFromShowMaxData(str_threeName)) class]] && view)
        //: [super addSubview:view];
        [super addSubview:view];
}


//: - (UILabel *)labName {
- (UILabel *)labName {
    //: if (!_labName) {
    if (!_labName) {
        //: _labName = [[UILabel alloc] init];
        _labName = [[UILabel alloc] init];
        //: _labName.font = [UIFont systemFontOfSize:16.f];
        _labName.font = [UIFont systemFontOfSize:16.f];
        //: _labName.textColor = [UIColor colorWithHexString:@"#333333"];
        _labName.textColor = [UIColor direction:StringFromShowMaxData(str_imposeName)];
        //: _labName.textAlignment = NSTextAlignmentLeft;
        _labName.textAlignment = NSTextAlignmentLeft;
    }
    //: return _labName;
    return _labName;
}





//: @end
@end

Byte * ShowMaxDataToCache(Byte *data) {
    int widowTown = data[0];
    int signaling = data[1];
    Byte names = data[2];
    int reform = data[3];
    if (!widowTown) return data + reform;
    for (int i = reform; i < reform + signaling; i++) {
        int value = data[i] + names;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[reform + signaling] = 0;
    return data + reform;
}

NSString *StringFromShowMaxData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ShowMaxDataToCache(data)];
}
