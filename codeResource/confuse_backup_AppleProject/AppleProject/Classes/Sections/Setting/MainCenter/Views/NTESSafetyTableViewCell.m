//
//  NTESSafetyTableViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESSafetyTableViewCell.h"

@implementation NTESSafetyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor clearColor];
//        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryNone;
        
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.layer.cornerRadius = 8;
        self.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        self.layer.shadowOffset = CGSizeMake(0,3);
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 0;
        
        [self initSubviews];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"NTESSafetyTableViewCell";
    NTESSafetyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[NTESSafetyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:250/255.0 alpha:1.0];
//        cell.layer.cornerRadius = 12;
//        cell.backgroundColor = [UIColor whiteColor];
        
    }
    return cell;
}

- (void)initSubviews {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.arrowsImageView];
    [self.contentView addSubview:self.labGoout];
    [self.contentView addSubview:self.pushSwitch];
    [self.contentView addSubview:self.labSubtitle];
    self.labGoout.frame = CGRectMake(0, 0, SCREEN_WIDTH-30, 56);
    self.iconImageView.frame = CGRectMake(15, 16, 24, 24);
    self.arrowsImageView.frame = CGRectMake(SCREEN_WIDTH - 30 - 15 - 12, 0, 12, 12);
 
    self.titleLabel.frame = CGRectMake(self.iconImageView.right+16, 0, 150, 21);
    self.labSubtitle.frame = CGRectMake(self.titleLabel.right-40, 0, self.arrowsImageView.left - self.titleLabel.right+30, 20);
    
    self.pushSwitch.frame = CGRectMake(SCREEN_WIDTH - 30 - 15 - 50, 12, 50, 30);
    self.titleLabel.centerY = self.arrowsImageView.centerY = self.labSubtitle.centerY = self.iconImageView.centerY;
    
}


+ (CGFloat)getCellHeight:(NSDictionary *)information {
    return 56.f;
}

- (void)addSubview:(UIView *)view
{
    if (![view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view)
        [super addSubview:view];
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
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}


- (UILabel *)labGoout {
    if (!_labGoout) {
        _labGoout = [[UILabel alloc] init];
        _labGoout.font = [UIFont systemFontOfSize:16.f];
        _labGoout.textColor = [UIColor colorWithAlpha:1.0 red:255/255.0 green:72/255.0 blue:61/255.0];
//        _labGoout.textColor = [UIColor redColor];
        _labGoout.textAlignment = NSTextAlignmentCenter;
        _labGoout.text = LangKey(@"activity_comment_setting_exit");
        _labGoout.hidden = YES;
    }
    return _labGoout;
}

- (UILabel *)labSubtitle {
    if (!_labSubtitle) {
        _labSubtitle = [[UILabel alloc] init];
        _labSubtitle.font = [UIFont systemFontOfSize:14.f];
        _labSubtitle.textColor = TextColor_2;
        _labSubtitle.textAlignment = NSTextAlignmentRight;
        _labSubtitle.hidden = YES;
    }
    return _labSubtitle;
}

- (UISwitch *)pushSwitch {
    if (!_pushSwitch) {
        _pushSwitch = [[UISwitch alloc] init];
        [_pushSwitch setOnTintColor: RGB_COLOR_String(kCommonBGColor_All)];
        _pushSwitch.hidden = YES;
    }
    return _pushSwitch;
}


@end
