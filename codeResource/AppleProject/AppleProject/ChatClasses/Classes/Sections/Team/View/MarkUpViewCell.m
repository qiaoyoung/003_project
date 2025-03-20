
#import <Foundation/Foundation.h>
typedef struct {
    Byte conCarveEstablish;
    Byte *hasten;
    unsigned int contrary;
    bool basketball;
	int schemeGoing;
	int poolSnow;
	int stepbrotherSuspect;
} WorkingTuckData;

NSString *StringFromWorkingTuckData(WorkingTuckData *data);


//: #ECECEC
WorkingTuckData str_jazzText = (WorkingTuckData){93, (Byte []){126, 24, 30, 24, 30, 24, 30, 79}, 7, false, 164, 75, 232};


//: #2BBCFB
WorkingTuckData str_mmName = (WorkingTuckData){190, (Byte []){157, 140, 252, 252, 253, 248, 252, 195}, 7, false, 176, 139, 90};


//: icon_me_arrow
WorkingTuckData str_fileEyeBareName = (WorkingTuckData){48, (Byte []){89, 83, 95, 94, 111, 93, 85, 111, 81, 66, 66, 95, 71, 125}, 13, false, 66, 14, 124};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MarkUpViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONGroupEditTableViewCell.h"
#import "MarkUpViewCell.h"

//: @implementation ZMONGroupEditTableViewCell
@implementation MarkUpViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];

        //: [self initSubviews];
        [self initNoteChild];
    }
    //: return self;
    return self;
}

//: - (void)initSubviews {
- (void)initNoteChild {
    //: [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.iconImageView];
    //: [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.titleLabel];
    //: [self.contentView addSubview:self.arrowsImageView];
    [self.contentView addSubview:self.arrowsImageView];
    //: [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentLabel];
    //: [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.lineView];

    //: self.iconImageView.frame = CGRectMake(15, 12, 24, 24);
    self.iconImageView.frame = CGRectMake(15, 12, 24, 24);
    //: self.arrowsImageView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 30 - 15 - 12, 29, 12, 12);
    self.arrowsImageView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 30 - 15 - 12, 29, 12, 12);
    //: self.titleLabel.frame = CGRectMake(self.iconImageView.right+16, 12, 250, 21);
    self.titleLabel.frame = CGRectMake(self.iconImageView.right+16, 12, 250, 21);
    //: self.contentLabel.frame = CGRectMake(self.titleLabel.left+5, self.titleLabel.bottom+5, [[UIScreen mainScreen] bounds].size.width-80, 15);
    self.contentLabel.frame = CGRectMake(self.titleLabel.left+5, self.titleLabel.bottom+5, [[UIScreen mainScreen] bounds].size.width-80, 15);
    //: self.lineView.frame = CGRectMake(self.contentLabel.left, 64.5, [[UIScreen mainScreen] bounds].size.width-80, 0.5);
    self.lineView.frame = CGRectMake(self.contentLabel.left, 64.5, [[UIScreen mainScreen] bounds].size.width-80, 0.5);


}

//: - (UIView *)lineView
- (UIView *)lineView
{
    //: if(!_lineView){
    if(!_lineView){
        //: _lineView = [[UIView alloc]init];
        _lineView = [[UIView alloc]init];
        //: _lineView.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
        _lineView.backgroundColor = [UIColor direction:StringFromWorkingTuckData(&str_jazzText)];
    }
    //: return _lineView;
    return _lineView;
}

//: - (UIImageView *)iconImageView {
- (UIImageView *)iconImageView {
    //: if (!_iconImageView) {
    if (!_iconImageView) {
        //: _iconImageView = [[UIImageView alloc] init];
        _iconImageView = [[UIImageView alloc] init];
        //: _iconImageView.contentMode = UIViewContentModeScaleToFill;
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    //: return _iconImageView;
    return _iconImageView;
}

//: - (UIImageView *)arrowsImageView {
- (UIImageView *)arrowsImageView {
    //: if (!_arrowsImageView) {
    if (!_arrowsImageView) {
        //: _arrowsImageView = [[UIImageView alloc] init];
        _arrowsImageView = [[UIImageView alloc] init];
        //: _arrowsImageView.contentMode = UIViewContentModeScaleToFill;
        _arrowsImageView.contentMode = UIViewContentModeScaleToFill;
        //: _arrowsImageView.image = [UIImage imageNamed:@"icon_me_arrow"];
        _arrowsImageView.image = [UIImage imageNamed:StringFromWorkingTuckData(&str_fileEyeBareName)];
    }
    //: return _arrowsImageView;
    return _arrowsImageView;
}

//: - (UILabel *)titleLabel {
- (UILabel *)titleLabel {
    //: if (!_titleLabel) {
    if (!_titleLabel) {
        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        //: _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
        //: _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    //: return _titleLabel;
    return _titleLabel;
}

//: - (UILabel *)contentLabel {
- (UILabel *)contentLabel {
    //: if (!_contentLabel) {
    if (!_contentLabel) {
        //: _contentLabel = [[UILabel alloc] init];
        _contentLabel = [[UILabel alloc] init];
        //: _contentLabel.font = [UIFont systemFontOfSize:12.f];
        _contentLabel.font = [UIFont systemFontOfSize:12.f];
        //: _contentLabel.textColor = [UIColor colorWithHexString:@"#2BBCFB"];
        _contentLabel.textColor = [UIColor direction:StringFromWorkingTuckData(&str_mmName)];
        //: _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        //: _contentLabel.numberOfLines = 1;
        _contentLabel.numberOfLines = 1;
        //: _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    //: return _contentLabel;
    return _contentLabel;
}



//: @end
@end

Byte *WorkingTuckDataToByte(WorkingTuckData *data) {
    if (data->basketball) return data->hasten;
    for (int i = 0; i < data->contrary; i++) {
        data->hasten[i] ^= data->conCarveEstablish;
    }
    data->hasten[data->contrary] = 0;
    data->basketball = true;
	if (data->contrary >= 3) {
		data->schemeGoing = data->hasten[0];
		data->poolSnow = data->hasten[1];
		data->stepbrotherSuspect = data->hasten[2];
	}
    return data->hasten;
}

NSString *StringFromWorkingTuckData(WorkingTuckData *data) {
    return [NSString stringWithUTF8String:(char *)WorkingTuckDataToByte(data)];
}
