//
//  TeamAnnouncementListCell.m
//  NIM
//
//  Created by Xuhui on 15/3/31.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "BBBTeamAnnouncementListCell.h"
#import "BBBUsrInfoData.h"
#import "AAAKitUtil.h"
#import "M80AttributedLabel.h"
#import "M80AttributedLabel+AppleProjectKit.h"

@interface BBBTeamAnnouncementListCell ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIView *line;
@property (strong, nonatomic) M80AttributedLabel *contentLabel;

@end

@implementation BBBTeamAnnouncementListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
//        self.accessoryType = UITableViewCellAccessoryNone;
//        self.layer.cornerRadius = 10;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30 - 30, 20)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];

        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 39, SCREEN_WIDTH-30 - 30, 13)];
        _infoLabel.font = [UIFont systemFontOfSize:12.f];
        _infoLabel.textColor = TextColor_3;
        [self.contentView addSubview:_infoLabel];

        _line = [[UIView alloc] initWithFrame:CGRectMake(15, 64, SCREEN_WIDTH-60, .5)];
        _line.backgroundColor = RGB_COLOR_String(@"#E9ECF0");
        _line.hidden = YES;
        [self.contentView addSubview:_line];

        _contentLabel = [[M80AttributedLabel alloc] initWithFrame:CGRectMake(15, 73, SCREEN_WIDTH-30-30, 178)];
        _contentLabel.textColor = TextColor_4;
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:14.f];
        _contentLabel.autoDetectLinks = YES;
        _contentLabel.underLineForLink = YES;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.isShowTextSelection = YES;
        _contentLabel.selectable = YES;
        
        @weakify(self);
        _contentLabel.selectBlock = ^(BBBMediaItem *item) {
            @strongify(self);
            NSString *text = [self.contentLabel.text substringWithRange:self.contentLabel.selectedRange];
            if (text.length) {
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                [pasteboard setString:text];
            }
        };
        
        [self.contentView addSubview:_contentLabel];
        
        [_contentLabel new_genMediaButton];

    }
    return self;
}

- (void)refreshData:(NSDictionary *)data nick:(NSString *)nick{
    NSString *title = [data objectForKey:@"title"];
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake(15, 15, SCREEN_WIDTH - 60, _titleLabel.frame.size.height+2);
    
    _infoLabel.frame = CGRectMake(15, 8+_titleLabel.bottom, SCREEN_WIDTH - 60, 13);

    _line.frame = CGRectMake(15, _infoLabel.bottom + 15, SCREEN_WIDTH-60, .5);
    
    NSString *content = [data objectForKey:@"content"];
    [_contentLabel nim_setText:content];
    [_contentLabel sizeToFit];
    
    _contentLabel.frame = CGRectMake(15, 10 + _line.bottom, SCREEN_WIDTH - 60, _contentLabel.frame.size.height+2);
    NSNumber *time = [data objectForKey:@"time"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *dataString = [dateFormatter stringFromDate:date];
    _infoLabel.text = [NSString stringWithFormat:@"%@ %@", nick ?: @"", dataString];
}

+ (CGFloat)cellHeight:(NSString *)title
{
    CGSize size = [title boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-60, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;

    return 85 + size.height + 20;
}

@end
