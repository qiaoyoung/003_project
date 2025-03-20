
#import <Foundation/Foundation.h>
typedef struct {
    Byte scanIncreasing;
    Byte *imageWorkplace;
    unsigned int plainSession;
    bool hearingRefugee;
	int mansionMagnitude;
} ImposeData;

NSString *StringFromImposeData(ImposeData *data);


//: 00:00
ImposeData str_hareContent = (ImposeData){149, (Byte []){165, 165, 175, 165, 165, 85}, 5, false, 207};


//: HH:mm
ImposeData str_schemePointByTitle = (ImposeData){81, (Byte []){25, 25, 107, 60, 60, 206}, 5, false, 45};

// __DEBUG__
// __CLOSE_PRINT__
//
//  FiveMessageCell.m
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMergeMessageCell.h"
#import "FiveMessageCell.h"
//: #import "BBBBadgeView.h"
#import "BadgeView.h"
//: #import "CCCSessionTextContentView.h"
#import "AggregationView.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESMessageModel.h"
#import "TeamMessageModel.h"

//: @interface NTESMergeMessageCell ()
@interface FiveMessageCell ()

//: @property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *line;

//: @property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *timeLab;

//: @end
@end

//: @implementation NTESMergeMessageCell
@implementation FiveMessageCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    //: if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //: [self.traningActivityIndicator removeFromSuperview];
        [self.traningActivityIndicator removeFromSuperview];
        //: [self.retryButton removeFromSuperview];
        [self.retryButton removeFromSuperview];
        //: [self.audioPlayedIcon removeFromSuperview];
        [self.audioPlayedIcon removeFromSuperview];
        //: [self.readButton removeFromSuperview];
        [self.readButton removeFromSuperview];
        //: [self.selectButton removeFromSuperview];
        [self.selectButton removeFromSuperview];
        //: [self.selectButtonMask removeFromSuperview];
        [self.selectButtonMask removeFromSuperview];
        //: [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.timeLab];
        //: [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.line];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInset = self.model.contentViewInsets;
    UIEdgeInsets contentInset = self.model.contentViewInsets;
    //: self.headImageView.origin = CGPointMake(16.0, 16.0);
    self.headImageView.origin = CGPointMake(16.0, 16.0);
    //: self.nameLabel.origin = CGPointMake(self.headImageView.right + contentInset.left, self.headImageView.top);
    self.nameLabel.origin = CGPointMake(self.headImageView.right + contentInset.left, self.headImageView.top);
    //: self.bubbleView.origin = CGPointMake(self.headImageView.right, self.nameLabel.bottom - contentInset.top + 4.0);
    self.bubbleView.origin = CGPointMake(self.headImageView.right, self.nameLabel.bottom - contentInset.top + 4.0);
    //: _line.frame = CGRectMake(self.headImageView.left, self.height - 1, self.width-2*self.headImageView.left, 1.0);
    _line.frame = CGRectMake(self.headImageView.left, self.height - 1, self.width-2*self.headImageView.left, 1.0);
    //: _timeLab.origin = CGPointMake(self.width - _timeLab.width - 16.0, self.nameLabel.top);
    _timeLab.origin = CGPointMake(self.width - _timeLab.width - 16.0, self.nameLabel.top);
}

//: - (UIView *)line {
- (UIView *)line {
    //: if (!_line) {
    if (!_line) {
        //: _line = [[UIView alloc] init];
        _line = [[UIView alloc] init];
        //: _line.backgroundColor = [UIColor systemGroupedBackgroundColor];
        _line.backgroundColor = [UIColor systemGroupedBackgroundColor];
    }
    //: return _line;
    return _line;
}
//: - (UILabel *)timeLab {
- (UILabel *)timeLab {
    //: if (!_timeLab) {
    if (!_timeLab) {
        //: _timeLab = [[UILabel alloc] init];
        _timeLab = [[UILabel alloc] init];
        //: _timeLab.backgroundColor = [UIColor clearColor];
        _timeLab.backgroundColor = [UIColor clearColor];
        //: _timeLab.opaque = YES;
        _timeLab.opaque = YES;
        //: _timeLab.font = [AppleProjectKit sharedKit].config.nickFont;
        _timeLab.font = [Indicator reach].config.nickFont;
        //: _timeLab.textColor = [AppleProjectKit sharedKit].config.nickColor;
        _timeLab.textColor = [Indicator reach].config.nickColor;
        //: _timeLab.text = @"00:00";
        _timeLab.text = StringFromImposeData(&str_hareContent);
        //: [_timeLab sizeToFit];
        [_timeLab sizeToFit];
        //: _timeLab.width += 8.0;
        _timeLab.width += 8.0;
    }
    //: return _timeLab;
    return _timeLab;
}

//: - (void)refreshData:(BBBMessageModel *)data {
- (void)message:(AccumulationCenter *)data {
    //: [super refreshData:data];
    [super message:data];

    //: NTESMessageModel *model = nil;
    TeamMessageModel *model = nil;
    //: if ([data isKindOfClass:[NTESMessageModel class]]) {
    if ([data isKindOfClass:[TeamMessageModel class]]) {
        //: model = (NTESMessageModel *)data;
        model = (TeamMessageModel *)data;
        //: _line.hidden = model.hiddenSeparatorLine;
        _line.hidden = model.hiddenSeparatorLine;

        //: NSString *timeInfo = [self timeFormatString:model.message.timestamp];
        NSString *timeInfo = [self page:model.message.timestamp];
        //: _timeLab.text = timeInfo ?: @"00:00";
        _timeLab.text = timeInfo ?: StringFromImposeData(&str_hareContent);

        //: self.bubbleView.layoutStyle = CCCSessionMessageContentViewLayoutLeft;
        self.bubbleView.layoutStyle = CCCSessionMessageContentViewLayoutLeft;
    }

    //: self.bubbleView.bubbleImageView.hidden = YES;
    self.bubbleView.bubbleImageView.hidden = YES;
    //: self.bubblesBackgroundView.hidden = YES;
    self.bubblesBackgroundView.hidden = YES;
    //: self.backgroundColor = [UIColor colorWithRed:((float)((0xfefefe & 0xFF0000) >> 16))/255.0 green:((float)((0xfefefe & 0x00FF00) >> 8))/255.0 blue:((float)(0xfefefe & 0x0000FF))/255.0 alpha:1.0];
    self.backgroundColor = [UIColor colorWithRed:((float)((0xfefefe & 0xFF0000) >> 16))/255.0 green:((float)((0xfefefe & 0x00FF00) >> 8))/255.0 blue:((float)(0xfefefe & 0x0000FF))/255.0 alpha:1.0];

    //: id bubbleView = self.bubbleView;
    id bubbleView = self.bubbleView;
    //: if ([bubbleView isKindOfClass:[CCCSessionTextContentView class]]) {
    if ([bubbleView isKindOfClass:[AggregationView class]]) {
        //: ((CCCSessionTextContentView *)bubbleView).textView.textColor = [UIColor blackColor];
        ((AggregationView *)bubbleView).textView.textColor = [UIColor blackColor];
    }
}

//: - (NSString *)timeFormatString:(NSTimeInterval)time {
- (NSString *)page:(NSTimeInterval)time {
    //: NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    //: NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //: [formatter setDateFormat:@"HH:mm"];
    [formatter setDateFormat:StringFromImposeData(&str_schemePointByTitle)];
    //: return [formatter stringFromDate: date];
    return [formatter stringFromDate: date];
}

//: @end
@end

Byte *ImposeDataToByte(ImposeData *data) {
    if (data->hearingRefugee) return data->imageWorkplace;
    for (int i = 0; i < data->plainSession; i++) {
        data->imageWorkplace[i] ^= data->scanIncreasing;
    }
    data->imageWorkplace[data->plainSession] = 0;
    data->hearingRefugee = true;
	if (data->plainSession >= 1) {
		data->mansionMagnitude = data->imageWorkplace[0];
	}
    return data->imageWorkplace;
}

NSString *StringFromImposeData(ImposeData *data) {
    return [NSString stringWithUTF8String:(char *)ImposeDataToByte(data)];
}
