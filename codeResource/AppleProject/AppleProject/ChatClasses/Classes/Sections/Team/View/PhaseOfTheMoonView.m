
#import <Foundation/Foundation.h>
typedef struct {
    Byte qualifyProof;
    Byte *campOration;
    unsigned int intervalervention;
    bool rover;
	int unexpected;
	int helpDisability;
	int equilibrium;
} ExperienceData;

NSString *StringFromExperienceData(ExperienceData *data);


//: Group_Me
ExperienceData str_perhapsText = (ExperienceData){69, (Byte []){2, 55, 42, 48, 53, 26, 8, 32, 223}, 8, false, 177, 111, 247};


//: icon_add_normal
ExperienceData str_typicallyConcedeData = (ExperienceData){89, (Byte []){48, 58, 54, 55, 6, 56, 61, 61, 6, 55, 54, 43, 52, 56, 53, 208}, 15, false, 216, 35, 17};

// __DEBUG__
// __CLOSE_PRINT__
//
//  PhaseOfTheMoonView.m
//  NIM
//
//  Created by chris on 15/3/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamMemberListCell.h"
#import "PhaseOfTheMoonView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "BBBTeamHelper.h"
#import "LanguageChild.h"
//: #import "UserCardDataSourceProtocol.h"
#import "UserCardDataSourceProtocol.h"

//: NSString *const kTeamMember = @"kTeamMember";
NSString *const k_tagData = @"kTeamMember";
//: NSString *const kTeamMemberInfo = @"kTeamMemberInfo";
NSString *const k_errorValue = @"kTeamMemberInfo";

//: @interface NIMTeamMemberView : UIView{
@interface PartView : UIView{

}

//: @property(nonatomic,strong) BBBAvatarImageView *imageView;
@property(nonatomic,strong) AvatarControl *imageView;

//: @property (nonatomic,strong) UIImageView *roleImageView;
@property (nonatomic,strong) UIImageView *roleImageView;

//: @property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *titleLabel;

//: @property(nonatomic,strong) NSDictionary *member;
@property(nonatomic,strong) NSDictionary *member;

//: @end
@end



//: @implementation NIMTeamMemberView
@implementation PartView
//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        //: _titleLabel.font = [UIFont systemFontOfSize:12.f];
        _titleLabel.font = [UIFont systemFontOfSize:12.f];
        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];
        //: _imageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
        _imageView = [[AvatarControl alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];
        //: _roleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _roleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //: [self addSubview:_roleImageView];
        [self addSubview:_roleImageView];
    }
    //: return self;
    return self;
}

//: - (void)setMember:(NSDictionary *)member{
- (void)setMember:(NSDictionary *)member{
    //: _member = member;
    _member = member;
    //: CCCKitInfo *info = member[kTeamMemberInfo];
    TitleInfo *info = member[k_errorValue];
    //: id<NIMKitCardHeaderData>user = member[kTeamMember];
    id<WithChild>user = member[k_tagData];
    //: NSURL *avatarURL;
    NSURL *avatarURL;
    //: if (info.avatarUrlString.length) {
    if (info.avatarUrlString.length) {
        //: avatarURL = [NSURL URLWithString:info.avatarUrlString];
        avatarURL = [NSURL URLWithString:info.avatarUrlString];
    }
    //: [_imageView nim_setImageWithURL:avatarURL placeholderImage:info.avatarImage];
    [_imageView title:avatarURL sumeract:info.avatarImage];

    //: NSString *showName = (info.showName ?: @"");
    NSString *showName = (info.showName ?: @"");
    //: if ([user isMyUserId]) {
    if ([user showBecome]) {
        //: showName = [NTESLanguageManager getTextWithKey:@"Group_Me"];
        showName = [MaxInformation off:StringFromExperienceData(&str_perhapsText)];//@"我".nim_localized;
    }
    //: _titleLabel.text = showName;
    _titleLabel.text = showName;
    //: _roleImageView.image = [BBBTeamHelper imageWithMemberType:user.userType];
    _roleImageView.image = [LanguageChild beVoice:user.at];
}


//: - (CGSize)sizeThatFits:(CGSize)size{
- (CGSize)sizeThatFits:(CGSize)size{
    //: return CGSizeMake(38, 53);
    return CGSizeMake(38, 53);
}



//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [self.titleLabel sizeToFit];
    [self.titleLabel sizeToFit];
    //: self.titleLabel.nim_width = _titleLabel.nim_width > self.nim_width ? self.nim_width : _titleLabel.nim_width;
    self.titleLabel.nim_width = _titleLabel.nim_width > self.nim_width ? self.nim_width : _titleLabel.nim_width;
    //: self.imageView.nim_centerX = self.nim_width * .5f;
    self.imageView.nim_centerX = self.nim_width * .5f;
    //: self.titleLabel.nim_centerX = self.nim_width * .5f;
    self.titleLabel.nim_centerX = self.nim_width * .5f;
    //: self.titleLabel.nim_bottom = self.nim_height;
    self.titleLabel.nim_bottom = self.nim_height;
    //: self.roleImageView.nim_size = CGSizeMake(16, 16);
    self.roleImageView.nim_size = CGSizeMake(16, 16);
    //: self.roleImageView.nim_bottom = self.imageView.nim_bottom;
    self.roleImageView.nim_bottom = self.imageView.nim_bottom;
    //: self.roleImageView.nim_right = self.imageView.nim_right;
    self.roleImageView.nim_right = self.imageView.nim_right;
}
//: @end
@end

//: const CGFloat kBBBTeamMemberListCellItemWidth = 49.f;
const CGFloat k_totalTitle = 49.f;
//: const CGFloat kBBBTeamMemberListCellItemPadding = 44.f;
const CGFloat k_submitText = 44.f;

//: @interface BBBTeamMemberListCell()
@interface PhaseOfTheMoonView()

//: @property(nonatomic,strong) NSMutableArray *icons;
@property(nonatomic,strong) NSMutableArray *icons;

//: @property(nonatomic, strong) UIButton *addBtn;
@property(nonatomic, strong) UIButton *addBtn;

//: @end
@end

//: @implementation BBBTeamMemberListCell
@implementation PhaseOfTheMoonView
//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: _icons = [[NSMutableArray alloc] init];
        _icons = [[NSMutableArray alloc] init];
        //: _addBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        _addBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        //: [_addBtn addTarget:self action:@selector(onPress:) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn addTarget:self action:@selector(changed:) forControlEvents:UIControlEventTouchUpInside];
        //: _addBtn.userInteractionEnabled = NO;
        _addBtn.userInteractionEnabled = NO;
        //: [self.contentView addSubview:_addBtn];
        [self.contentView addSubview:_addBtn];
    }
    //: return self;
    return self;
}

//: - (NSInteger)maxShowMemberCount {
- (NSInteger)maxShowMemberCount {
    //: CGFloat width = (self.nim_width != [UIScreen mainScreen].bounds.size.width) ? [UIScreen mainScreen].bounds.size.width : self.nim_width;
    CGFloat width = (self.nim_width != [UIScreen mainScreen].bounds.size.width) ? [UIScreen mainScreen].bounds.size.width : self.nim_width;
    //: NSInteger maxShowCount = (width - kBBBTeamMemberListCellItemPadding) / kBBBTeamMemberListCellItemWidth;
    NSInteger maxShowCount = (width - k_submitText) / k_totalTitle;
    //: return maxShowCount;
    return maxShowCount;
}

//: - (void)setInfos:(NSMutableArray<NSDictionary *> *)infos {
- (void)setInfos:(NSMutableArray<NSDictionary *> *)infos {
    //: NSInteger count = 0;
    NSInteger count = 0;

    //invite button
    //: if (!_disableInvite) {
    if (!_disableInvite) {
        //: NIMTeamMemberView *view = [self fetchMemeberView:0];
        PartView *view = [self all:0];
        //: UIImage *addImage = [UIImage imageNamed:@"icon_add_normal"];
        UIImage *addImage = [UIImage imageNamed:StringFromExperienceData(&str_typicallyConcedeData)];
        //: [view.imageView setImage:addImage];
        [view.imageView setImage:addImage];
        //: view.roleImageView.image = nil;
        view.roleImageView.image = nil;
        //: view.titleLabel.text = @"邀请".nim_localized;
        view.titleLabel.text = @"邀请".trapLocalized;
        //: count = 1;
        count = 1;
    }
    //: self.addBtn.userInteractionEnabled = (count != 0);
    self.addBtn.userInteractionEnabled = (count != 0);

    //icons
    //: for (UIView *view in _icons) {
    for (UIView *view in _icons) {
        //: [view removeFromSuperview];
        [view removeFromSuperview];
    }

    //: NSInteger maxShowCount = self.maxShowMemberCount;
    NSInteger maxShowCount = self.maxShowMemberCount;
    //: NSInteger iconCount = infos.count > maxShowCount-count ? maxShowCount : infos.count+count;
    NSInteger iconCount = infos.count > maxShowCount-count ? maxShowCount : infos.count+count;
    //: for (NSInteger i = 0; i < iconCount; i++) {
    for (NSInteger i = 0; i < iconCount; i++) {
        //: NIMTeamMemberView *view = [self fetchMemeberView:i];
        PartView *view = [self all:i];
        //: if (!count || i != 0) {
        if (!count || i != 0) {
            //: NSInteger memberIndex = i - count;
            NSInteger memberIndex = i - count;
            //: view.member = infos[memberIndex];
            view.member = infos[memberIndex];
        }
        //: [self.contentView addSubview:view];
        [self.contentView addSubview:view];
        //: [view setNeedsLayout];
        [view setNeedsLayout];
    }
    //: [self bringSubviewToFront:self.addBtn];
    [self bringSubviewToFront:self.addBtn];
}

//: - (void)onPress:(id)sender{
- (void)changed:(id)sender{
    //: if ([self.delegate respondsToSelector:@selector(didSelectAddOpeartor)]) {
    if ([self.delegate respondsToSelector:@selector(upBlock)]) {
        //: [self.delegate didSelectAddOpeartor];
        [self.delegate upBlock];
    }
}

//: - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //: CGRect hitRect = self.addBtn.frame;
    CGRect hitRect = self.addBtn.frame;
    //: return CGRectContainsPoint(hitRect, point) ? self.addBtn : [super hitTest:point withEvent:event];
    return CGRectContainsPoint(hitRect, point) ? self.addBtn : [super hitTest:point withEvent:event];
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _addBtn.frame = CGRectMake(0, 0, self.nim_width *.20f, self.nim_height);
    _addBtn.frame = CGRectMake(0, 0, self.nim_width *.20f, self.nim_height);
    //: CGFloat left = 20.f;
    CGFloat left = 20.f;
    //: CGFloat top = 17.f;
    CGFloat top = 17.f;
    //: self.textLabel.nim_left = left;
    self.textLabel.nim_left = left;
    //: self.textLabel.nim_top = top;
    self.textLabel.nim_top = top;
    //: self.detailTextLabel.nim_top = top;
    self.detailTextLabel.nim_top = top;
    //: self.accessoryView.nim_top = top;
    self.accessoryView.nim_top = top;

    //: CGFloat spacing = 12.f;
    CGFloat spacing = 12.f;
    //: CGFloat bottom = 10.f;
    CGFloat bottom = 10.f;
    //: for (NIMTeamMemberView *view in _icons) {
    for (PartView *view in _icons) {
        //: view.nim_left = left;
        view.nim_left = left;
        //: left += view.nim_width;
        left += view.nim_width;
        //: left += spacing;
        left += spacing;
        //: view.nim_bottom = self.nim_height - bottom;
        view.nim_bottom = self.nim_height - bottom;
    }
}


//: #pragma mark - Private
#pragma mark - Private

//: - (NIMTeamMemberView *)fetchMemeberView:(NSInteger)index{
- (PartView *)all:(NSInteger)index{
    //: if (_icons.count <= index) {
    if (_icons.count <= index) {
        //: for (int i = 0; i < index - _icons.count + 1 ; i++) {
        for (int i = 0; i < index - _icons.count + 1 ; i++) {
            //: NIMTeamMemberView *view = [[NIMTeamMemberView alloc]initWithFrame:CGRectZero];
            PartView *view = [[PartView alloc]initWithFrame:CGRectZero];
            //: view.userInteractionEnabled = NO;
            view.userInteractionEnabled = NO;
            //: [view sizeToFit];
            [view sizeToFit];
            //: [_icons addObject:view];
            [_icons addObject:view];
        }
    }
    //: return _icons[index];
    return _icons[index];
}


//: @end
@end

Byte *ExperienceDataToByte(ExperienceData *data) {
    if (data->rover) return data->campOration;
    for (int i = 0; i < data->intervalervention; i++) {
        data->campOration[i] ^= data->qualifyProof;
    }
    data->campOration[data->intervalervention] = 0;
    data->rover = true;
	if (data->intervalervention >= 3) {
		data->unexpected = data->campOration[0];
		data->helpDisability = data->campOration[1];
		data->equilibrium = data->campOration[2];
	}
    return data->campOration;
}

NSString *StringFromExperienceData(ExperienceData *data) {
    return [NSString stringWithUTF8String:(char *)ExperienceDataToByte(data)];
}
