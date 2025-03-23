//
//  NTESVideolistCollectionViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/6/26.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESVideolistCollectionViewCell.h"
#import "UIView+NTES.h"



@implementation NTESVideolistCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    CGFloat spacing = 15;//行、列 间距
    int totalloc = 2;//列数
    CGFloat appvieww = (SCREEN_WIDTH - spacing*3)/totalloc;

    _picImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, appvieww, appvieww*1.3)];
    _picImg.image = [UIImage imageNamed:@"login_bg"];
    [self.contentView addSubview:_picImg];
    
    _labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, _picImg.bottom+12, appvieww, 15)];
    _labtitle.font = [UIFont systemFontOfSize:12.f];
    _labtitle.textColor = TextColor_4;
    _labtitle.text = @"来一个摇滚表演";
    [self.contentView addSubview:_labtitle];

    _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, _labtitle.bottom+5, 16, 16)];
    _headImg.image = [UIImage imageNamed:@"login_logo"];
    [self.contentView addSubview:_headImg];
    
    _labname = [[UILabel alloc]initWithFrame:CGRectMake(_headImg.right+5, _labtitle.bottom+5, appvieww, 16)];
    _labname.font = [UIFont systemFontOfSize:11.f];
    _labname.textColor = TextColor_2;
    _labname.text = @"中东小王子";
    [self.contentView addSubview:_labname];
    
}

@end
