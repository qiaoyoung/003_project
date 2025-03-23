
#import <Foundation/Foundation.h>

NSString *StringFromChickenData(Byte *data);


//: group_mute_no
Byte str_titlePastaName[] = {96, 13, 98, 11, 252, 22, 222, 1, 1, 11, 215, 201, 212, 209, 215, 210, 193, 207, 215, 214, 199, 193, 208, 209, 9};


//: 666666
Byte str_badlyTollText[] = {68, 6, 69, 6, 167, 196, 123, 123, 123, 123, 123, 123, 14};


//: group_mute
Byte str_textTollData[] = {72, 10, 5, 9, 44, 76, 128, 189, 159, 108, 119, 116, 122, 117, 100, 114, 122, 121, 106, 140};


//: #2BBCFB
Byte str_weaponBrotherData[] = {90, 7, 39, 14, 248, 95, 139, 218, 235, 85, 60, 4, 92, 150, 74, 89, 105, 105, 106, 109, 105, 86};


//: group_remove
Byte str_leaderFessSessionData[] = {33, 12, 99, 7, 239, 135, 37, 202, 213, 210, 216, 211, 194, 213, 200, 208, 210, 217, 200, 9};

// __DEBUG__
// __CLOSE_PRINT__
//
//  BubbleViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/7/29.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONGroupMemberTableViewCell.h"
#import "BubbleViewCell.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "BBBTeamHelper.h"
#import "LanguageChild.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"

//: @interface ZMONGroupMemberTableViewCell()
@interface BubbleViewCell()

//: @property (nonatomic,strong) id<NIMKitCardHeaderData> data;
@property (nonatomic,strong) id<WithChild> data;

//: @end
@end

//: @implementation ZMONGroupMemberTableViewCell
@implementation BubbleViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {

//        self.backgroundColor = [UIColor whiteColor];
        //: self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
//        self.selectionStyle = UITableViewCellSelectionStyleGray;
        //: self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryType = UITableViewCellAccessoryNone;


        //: [self initSubviews];
        [self initAnonym];
    }
    //: return self;
    return self;
}

//: + (instancetype)cellWithTableView:(UITableView *)tableView
+ (instancetype)equalView:(UITableView *)tableView
{
    //: static NSString *identifier = @"ZMONGroupMemberTableViewCell";
    static NSString *identifier = @"BubbleViewCell";
    //: ZMONGroupMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    BubbleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //: if (!cell)
    if (!cell)
    {
        //: cell = [[ZMONGroupMemberTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[BubbleViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:250/255.0 alpha:1.0];
//        cell.layer.cornerRadius = 12;
        //: cell.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];

    }
    //: return cell;
    return cell;
}

//: - (void)initSubviews {
- (void)initAnonym {

    //: _roleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    _roleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    //: _roleImageView.layer.masksToBounds = YES;
    _roleImageView.layer.masksToBounds = YES;
    //: _roleImageView.layer.cornerRadius = 20;
    _roleImageView.layer.cornerRadius = 20;
    //: [self.contentView addSubview:_roleImageView];
    [self.contentView addSubview:_roleImageView];
    //: _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //: _titleLabel.font = [UIFont systemFontOfSize:16.f];
    _titleLabel.font = [UIFont systemFontOfSize:16.f];
    //: _titleLabel.textColor = [UIColor colorWithHexString:@"666666"];
    _titleLabel.textColor = [UIColor direction:StringFromChickenData(str_badlyTollText)];
    //: [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_titleLabel];

    //: _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //: _subtitleLabel.font = [UIFont systemFontOfSize:12.f];
    _subtitleLabel.font = [UIFont systemFontOfSize:12.f];
    //: _subtitleLabel.textColor = [UIColor colorWithHexString:@"#2BBCFB"];
    _subtitleLabel.textColor = [UIColor direction:StringFromChickenData(str_weaponBrotherData)];
    //: _subtitleLabel.hidden = YES;
    _subtitleLabel.hidden = YES;
    //: [self.contentView addSubview:_subtitleLabel];
    [self.contentView addSubview:_subtitleLabel];

    //: [self.contentView addSubview:self.muteBtn];
    [self.contentView addSubview:self.muteBtn];
    //: [self.contentView addSubview:self.removeBtn];
    [self.contentView addSubview:self.removeBtn];

}

//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        _imageViews = [[AvatarControl alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//        [self addSubview:_imageViews];
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _titleLabel.font = [UIFont systemFontOfSize:16.f];
//        _titleLabel.textColor = TextColor_2;
//        [self addSubview:_titleLabel];
//
////        _roleImageView              = [[UIImageView alloc] initWithFrame:CGRectZero];
////        [self addSubview:_roleImageView];
////        _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        _removeBtn.hidden = YES;
////        [_removeBtn setImage:[UIImage imageNamed:@"icon_avatar_del"] forState:UIControlStateNormal];
////        [_removeBtn sizeToFit];
////        [_removeBtn addTarget:self action:@selector(onTouchRemoveBtn:) forControlEvents:UIControlEventTouchUpInside];
////        [self addSubview:_removeBtn];
//    }
//    return self;
//}

//- (void)refreshData:(OnenceShould *)data
//{
//    self.data = data;
//    NSURL *url = [NSURL URLWithString:data.imageUrl];
//    [self.imageViews nim_setImageWithURL:url placeholderImage:data.imageNormal];
//    [self.imageViews addTarget:self action:@selector(onSelected:) forControlEvents:UIControlEventTouchUpInside];
//
//    NSString *showName = data.title;
//    if ([data isMyUserId]) {
//        showName = LangKey(@"Group_Me");//@"我".nim_localized;
//    }
//    self.titleLabel.text = showName;
////    self.roleImageView.image = [LanguageChild imageWithMemberType:data.userType];
//    [self.titleLabel sizeToFit];
//}

//- (void)onSelected:(id)sender{
//    if ([self.delegate respondsToSelector:@selector(cellDidSelected:)]) {
//        [self.delegate cellDidSelected:self];
//    }
//}
//

//: - (void)reloadWithUserId:(NSString *)UserId
- (void)bottom:(NSString *)UserId
{
    //: self.userId = UserId;
    self.userId = UserId;
}

//: - (void)setUserInfo:(CCCKitInfo *)userInfo
- (void)setUserInfo:(TitleInfo *)userInfo
{
    //: self.userInfo = userInfo;
    self.userInfo = userInfo;
}

//: - (void)onTouchRemoveBtn:(id)sender{
- (void)pickUp:(id)sender{

    //: if ([self.delegate respondsToSelector:@selector(cellShouldBeRemoved:)]) {
    if ([self.delegate respondsToSelector:@selector(imaged:)]) {
        //: [self.delegate cellShouldBeRemoved:self.userId];
        [self.delegate imaged:self.userId];
    }
}
//: - (void)onTouchMuteBtn:(id)sender{
- (void)indexes:(id)sender{
    //: if ([self.delegate respondsToSelector:@selector(cellShouldBeRemoved:)]) {
    if ([self.delegate respondsToSelector:@selector(imaged:)]) {
        //: [self.delegate cellShouldBeMute:self.userId mute:YES];
        [self.delegate noneStartMute:self.userId at:YES];
    }
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];

    //: self.muteBtn.frame = CGRectMake(self.width-70, 20, 20, 20);
    self.muteBtn.frame = CGRectMake(self.width-70, 20, 20, 20);
    //: self.removeBtn.frame = CGRectMake(self.width-35, 20, 20, 20);
    self.removeBtn.frame = CGRectMake(self.width-35, 20, 20, 20);

}
//: - (UIButton *)removeBtn{
- (UIButton *)removeBtn{
    //: if (!_removeBtn) {
    if (!_removeBtn) {
        //: _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_removeBtn addTarget:self action:@selector(onTouchRemoveBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_removeBtn addTarget:self action:@selector(pickUp:) forControlEvents:UIControlEventTouchUpInside];
        //: [_removeBtn setImage:[UIImage imageNamed:@"group_remove"] forState:UIControlStateNormal];
        [_removeBtn setImage:[UIImage imageNamed:StringFromChickenData(str_leaderFessSessionData)] forState:UIControlStateNormal];

    }
    //: return _removeBtn;
    return _removeBtn;
}

//: - (UIButton *)muteBtn{
- (UIButton *)muteBtn{
    //: if (!_muteBtn) {
    if (!_muteBtn) {
        //: _muteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _muteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_muteBtn addTarget:self action:@selector(onTouchMuteBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_muteBtn addTarget:self action:@selector(indexes:) forControlEvents:UIControlEventTouchUpInside];
        //: [_muteBtn setImage:[UIImage imageNamed:@"group_mute_no"] forState:UIControlStateNormal];
        [_muteBtn setImage:[UIImage imageNamed:StringFromChickenData(str_titlePastaName)] forState:UIControlStateNormal];
        //: [_muteBtn setImage:[UIImage imageNamed:@"group_mute"] forState:UIControlStateSelected];
        [_muteBtn setImage:[UIImage imageNamed:StringFromChickenData(str_textTollData)] forState:UIControlStateSelected];

    }
    //: return _muteBtn;
    return _muteBtn;
}


//: @end
@end

Byte * ChickenDataToCache(Byte *data) {
    int postSpecially = data[0];
    int tollModel = data[1];
    Byte burdenPool = data[2];
    int scanAreaCede = data[3];
    if (!postSpecially) return data + scanAreaCede;
    for (int i = scanAreaCede; i < scanAreaCede + tollModel; i++) {
        int value = data[i] - burdenPool;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[scanAreaCede + tollModel] = 0;
    return data + scanAreaCede;
}

NSString *StringFromChickenData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ChickenDataToCache(data)];
}
