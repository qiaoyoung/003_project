
#import <Foundation/Foundation.h>

NSString *StringFromAxData(Byte *data);        


//: icon_session_time_bg
Byte str_globalData[] = {32, 20, 5, 8, 84, 139, 90, 5, 100, 94, 106, 105, 90, 110, 96, 110, 110, 100, 106, 105, 90, 111, 100, 104, 96, 90, 93, 98, 46};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSessionTipCell.m
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionTimestampCell.h"
#import "MixViewCell.h"
//: #import "UserCellConfig.h"
#import "UserCellConfig.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBTimestampModel.h"
#import "FromTap.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCSessionTimestampCell()
@interface MixViewCell()

//: @property (nonatomic,strong) BBBTimestampModel *model;
@property (nonatomic,strong) FromTap *model;

//: @end
@end

//: @implementation CCCSessionTimestampCell
@implementation MixViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
//        self.backgroundColor = [Indicator sharedKit].config.cellBackgroundColor;
        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        //: self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //: _timeBGView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _timeBGView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //: [self.contentView addSubview:_timeBGView];
        [self.contentView addSubview:_timeBGView];
        //: _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _timeLabel.font = [UIFont boldSystemFontOfSize:10.f];
        _timeLabel.font = [UIFont boldSystemFontOfSize:10.f];
        //: _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.textColor = [UIColor whiteColor];
        //: [self.contentView addSubview:_timeLabel];
        [self.contentView addSubview:_timeLabel];
        //: [_timeBGView setImage:[[UIImage imageNamed:@"icon_session_time_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(8,20,8,20) resizingMode:UIImageResizingModeStretch]];
        [_timeBGView setImage:[[UIImage imageNamed:StringFromAxData(str_globalData)] resizableImageWithCapInsets:UIEdgeInsetsMake(8,20,8,20) resizingMode:UIImageResizingModeStretch]];

    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [_timeLabel sizeToFit];
    [_timeLabel sizeToFit];
    //: _timeLabel.center = CGPointMake(self.nim_centerX, 20);
    _timeLabel.center = CGPointMake(self.nim_centerX, 20);
    //: _timeBGView.frame = CGRectMake(_timeLabel.nim_left - 7, _timeLabel.nim_top - 2, _timeLabel.nim_width + 14, _timeLabel.nim_height + 4);
    _timeBGView.frame = CGRectMake(_timeLabel.nim_left - 7, _timeLabel.nim_top - 2, _timeLabel.nim_width + 14, _timeLabel.nim_height + 4);
}


//: - (void)refreshData:(BBBTimestampModel *)data{
- (void)queryed:(FromTap *)data{
    //: if (self.model == data) {
    if (self.model == data) {
        //: return;
        return;
    }
    //: self.model = data;
    self.model = data;
    //: if([self checkData]){
    if([self checkBackground]){
        //: BBBTimestampModel *model = (BBBTimestampModel *)data;
        FromTap *model = (FromTap *)data;
        //: [_timeLabel setText:[AAAKitUtil showTime:model.messageTime showDetail:YES]];
        [_timeLabel setText:[TypicalCenter max:model.messageTime caseDetail:YES]];
    }
}

//: - (BOOL)checkData{
- (BOOL)checkBackground{
    //: return [self.model isKindOfClass:[BBBTimestampModel class]];
    return [self.model isKindOfClass:[FromTap class]];
}

//: @end
@end

Byte * AxDataToCache(Byte *data) {
    int lengthSpitInstantly = data[0];
    int paradeEye = data[1];
    Byte firmHow = data[2];
    int analShow = data[3];
    if (!lengthSpitInstantly) return data + analShow;
    for (int i = analShow; i < analShow + paradeEye; i++) {
        int value = data[i] + firmHow;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[analShow + paradeEye] = 0;
    return data + analShow;
}

NSString *StringFromAxData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AxDataToCache(data)];
}
