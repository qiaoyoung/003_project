//
//  NTESMergeMessageCell.m
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

#import "NTESMergeMessageCell.h"
#import "BBBBadgeView.h"
#import "CCCSessionTextContentView.h"
#import "BBBAvatarImageView.h"
#import "M80AttributedLabel.h"
#import "UIView+NTES.h"
#import "NTESMessageModel.h"

@interface NTESMergeMessageCell ()

@property (nonatomic, strong) UIView *line;

@property (nonatomic, strong) UILabel *timeLab;

@end

@implementation NTESMergeMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.traningActivityIndicator removeFromSuperview];
        [self.retryButton removeFromSuperview];
        [self.audioPlayedIcon removeFromSuperview];
        [self.readButton removeFromSuperview];
        [self.selectButton removeFromSuperview];
        [self.selectButtonMask removeFromSuperview];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.line];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets contentInset = self.model.contentViewInsets;
    self.headImageView.origin = CGPointMake(16.0, 16.0);
    self.nameLabel.origin = CGPointMake(self.headImageView.right + contentInset.left, self.headImageView.top);
    self.bubbleView.origin = CGPointMake(self.headImageView.right, self.nameLabel.bottom - contentInset.top + 4.0);
    _line.frame = CGRectMake(self.headImageView.left, self.height - 1, self.width-2*self.headImageView.left, 1.0);
    _timeLab.origin = CGPointMake(self.width - _timeLab.width - 16.0, self.nameLabel.top);
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor systemGroupedBackgroundColor];
    }
    return _line;
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.backgroundColor = [UIColor clearColor];
        _timeLab.opaque = YES;
        _timeLab.font   = [AppleProjectKit sharedKit].config.nickFont;
        _timeLab.textColor = [AppleProjectKit sharedKit].config.nickColor;
        _timeLab.text = @"00:00";
        [_timeLab sizeToFit];
        _timeLab.width += 8.0;
    }
    return _timeLab;
}

- (void)refreshData:(BBBMessageModel *)data {
    [super refreshData:data];
    
    NTESMessageModel *model = nil;
    if ([data isKindOfClass:[NTESMessageModel class]]) {
        model = (NTESMessageModel *)data;
        _line.hidden = model.hiddenSeparatorLine;
        
        NSString *timeInfo = [self timeFormatString:model.message.timestamp];
        _timeLab.text = timeInfo ?: @"00:00";
        
        self.bubbleView.layoutStyle = CCCSessionMessageContentViewLayoutLeft;
    }
    
    self.bubbleView.bubbleImageView.hidden = YES;
    self.bubblesBackgroundView.hidden = YES;
    self.backgroundColor = UIColorFromRGB(0xfefefe);
    
    id bubbleView = self.bubbleView;
    if ([bubbleView isKindOfClass:[CCCSessionTextContentView class]]) {
        ((CCCSessionTextContentView *)bubbleView).textView.textColor = [UIColor blackColor];
    }
}

- (NSString *)timeFormatString:(NSTimeInterval)time {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate: date];
}

@end
