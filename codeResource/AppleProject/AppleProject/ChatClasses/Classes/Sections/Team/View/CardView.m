
#import <Foundation/Foundation.h>
typedef struct {
    Byte sumroducePot;
    Byte *confidence;
    unsigned int mathematicView;
    bool imageDate;
	int conservancy;
	int tingLab;
	int maundy;
} AmbleData;

NSString *StringFromAmbleData(AmbleData *data);


//: user
AmbleData str_dialogTotalerventionData = (AmbleData){179, (Byte []){198, 192, 214, 193, 237}, 4, false, 21, 161, 165};

// __DEBUG__
// __CLOSE_PRINT__
//
//  CardView.m
// Indicator
//
//  Created by chris on 16/5/10.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamMemberCardHeaderCell.h"
#import "CardView.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UserUsrInfoData.h"
#import "UserUsrInfoData.h"
//: #import "UserCommonTableData.h"
#import "UserCommonTableData.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"

//: @interface BBBTeamMemberCardHeaderCell()
@interface CardView()

//: @property (nonatomic,strong) BBBAvatarImageView *avatarView;
@property (nonatomic,strong) AvatarControl *avatarView;

//: @property (nonatomic,strong) UILabel *nickLabel;
@property (nonatomic,strong) UILabel *nickLabel;

//: @end
@end

//: @implementation BBBTeamMemberCardHeaderCell
@implementation CardView

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: [self.contentView addSubview:self.avatarView];
        [self.contentView addSubview:self.avatarView];
        //: [self.contentView addSubview:self.nickLabel];
        [self.contentView addSubview:self.nickLabel];
    }
    //: return self;
    return self;
}

//: - (void)refreshData:(NIMCommonTableRow *)rowData tableView:(UITableView *)tableView;{
- (void)text:(ChildMessage *)rowData should_strong:(UITableView *)tableView;{
    //: CCCKitInfo *userInfo = rowData.extraInfo[@"user"];
    TitleInfo *userInfo = rowData.extraInfo[StringFromAmbleData(&str_dialogTotalerventionData)];
    //: NSLog(@"userInfo===%@",userInfo);
    //: NSURL *avatarURL;
    NSURL *avatarURL;
    //: if (userInfo.avatarUrlString.length) {
    if (userInfo.avatarUrlString.length) {
        //: avatarURL = [NSURL URLWithString:userInfo.avatarUrlString];
        avatarURL = [NSURL URLWithString:userInfo.avatarUrlString];
    }
    //: [self.avatarView nim_setImageWithURL:avatarURL placeholderImage:userInfo.avatarImage];
    [self.avatarView title:avatarURL sumeract:userInfo.avatarImage];
    //: self.nickLabel.text = userInfo.showName;
    self.nickLabel.text = userInfo.showName;
    //: [self.nickLabel sizeToFit];
    [self.nickLabel sizeToFit];
    //: self.userInteractionEnabled = NO;
    self.userInteractionEnabled = NO;
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.avatarView.nim_top = 52.f;
    self.avatarView.nim_top = 52.f;
    //: self.avatarView.nim_centerX = self.nim_width * .5f;
    self.avatarView.nim_centerX = self.nim_width * .5f;
    //: self.nickLabel.nim_centerX = self.avatarView.nim_centerX;
    self.nickLabel.nim_centerX = self.avatarView.nim_centerX;
    //: self.nickLabel.nim_top = self.avatarView.nim_bottom + 10;
    self.nickLabel.nim_top = self.avatarView.nim_bottom + 10;
}


//: - (BBBAvatarImageView *)avatarView
- (AvatarControl *)avatarView
{
    //: if (!_avatarView) {
    if (!_avatarView) {
        //: _avatarView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(125, 52, 70, 70)];
        _avatarView = [[AvatarControl alloc] initWithFrame:CGRectMake(125, 52, 70, 70)];
        //: _avatarView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _avatarView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    //: return _avatarView;
    return _avatarView;
}

//: - (UILabel *)nickLabel
- (UILabel *)nickLabel
{
    //: if (!_nickLabel) {
    if (!_nickLabel) {
        //: _nickLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nickLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _nickLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _nickLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        //: _nickLabel.font = [UIFont systemFontOfSize:17];
        _nickLabel.font = [UIFont systemFontOfSize:17];
        //: _nickLabel.textColor = [UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0];
        _nickLabel.textColor = [UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0];
    }
    //: return _nickLabel;
    return _nickLabel;
}


//: @end
@end

Byte *AmbleDataToByte(AmbleData *data) {
    if (data->imageDate) return data->confidence;
    for (int i = 0; i < data->mathematicView; i++) {
        data->confidence[i] ^= data->sumroducePot;
    }
    data->confidence[data->mathematicView] = 0;
    data->imageDate = true;
	if (data->mathematicView >= 3) {
		data->conservancy = data->confidence[0];
		data->tingLab = data->confidence[1];
		data->maundy = data->confidence[2];
	}
    return data->confidence;
}

NSString *StringFromAmbleData(AmbleData *data) {
    return [NSString stringWithUTF8String:(char *)AmbleDataToByte(data)];
}
