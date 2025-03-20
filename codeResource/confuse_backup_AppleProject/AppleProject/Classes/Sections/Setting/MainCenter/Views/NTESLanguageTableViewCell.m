//
//  NTESLanguageTableViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESLanguageTableViewCell.h"

@implementation NTESLanguageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"lang"]) {
     
        [self.contentView addSubview:self.labTitle];
        self.labTitle.frame = CGRectMake(15, 0, SCREEN_WIDTH-60, 44);
        [self.contentView addSubview:self.lineView];
        self.lineView.frame = CGRectMake(15, 43.5, SCREEN_WIDTH-60, 0.5);
        self.layer.cornerRadius = 12;
    }
    return self;
}


- (UILabel *)labTitle {
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] init];
        _labTitle.font = [UIFont systemFontOfSize:16.f];
        _labTitle.textColor = [UIColor blackColor];
        _labTitle.textAlignment = NSTextAlignmentLeft;
    }
    return _labTitle;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = CommonBGView_Color;
    }
    return _lineView;
}

@end
