//
//  ZMONGroupEditTableViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONGroupEditTableViewCell.h"

@implementation ZMONGroupEditTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.arrowsImageView];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.lineView];

    self.iconImageView.frame = CGRectMake(15, 12, 24, 24);
    self.arrowsImageView.frame = CGRectMake(SCREEN_WIDTH - 30 - 15 - 12, 29, 12, 12);
    self.titleLabel.frame = CGRectMake(self.iconImageView.right+16, 12, 250, 21);
    self.contentLabel.frame = CGRectMake(self.titleLabel.left+5, self.titleLabel.bottom+5, SCREEN_WIDTH-80, 15);
    self.lineView.frame = CGRectMake(self.contentLabel.left, 64.5, SCREEN_WIDTH-80, 0.5);

    
}

- (UIView *)lineView
{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGB_COLOR_String(@"#ECECEC");
    }
    return _lineView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _iconImageView;
}

- (UIImageView *)arrowsImageView {
    if (!_arrowsImageView) {
        _arrowsImageView = [[UIImageView alloc] init];
        _arrowsImageView.contentMode = UIViewContentModeScaleToFill;
        _arrowsImageView.image = [UIImage imageNamed:@"icon_me_arrow"];
    }
    return _arrowsImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:12.f];
        _contentLabel.textColor = ThemeColor;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 1;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _contentLabel;
}



@end
