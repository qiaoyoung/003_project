// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMListCollectionCell.m
// Indicator
//
//  Created by He on 2020/4/13.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCQuickCommentCell.h"
#import "AdministrativeDivisionReusableView.h"
//: #import "AAAKitQuickCommentUtil.h"
#import "CaseOfMaxTeam.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIColor+AppleProjectKit.h"
#import "UIColor+Indicator.h"

//: @interface CCCQuickCommentCell ()
@interface AdministrativeDivisionReusableView ()

//: @property (nonatomic, strong) M80AttributedLabel *textLabel;
@property (nonatomic, strong) MessageEnableTextView *textLabel;
//: @property (nonatomic, strong) UIView *divider;
@property (nonatomic, strong) UIView *divider;

//: @end
@end

//: @implementation CCCQuickCommentCell
@implementation AdministrativeDivisionReusableView


//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: _textLabel = [AAAKitQuickCommentUtil newCommentLabel];
        _textLabel = [CaseOfMaxTeam afterKey];
        //: [self.contentView addSubview:_textLabel];
        [self.contentView addSubview:_textLabel];
        //: self.layer.cornerRadius = 12.0;
        self.layer.cornerRadius = 12.0;
        //: self.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.3];
        self.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.3];

        //: _divider = [[UIView alloc] initWithFrame:CGRectZero];
        _divider = [[UIView alloc] initWithFrame:CGRectZero];
        //: _divider.backgroundColor = UIColor.lightGrayColor;
        _divider.backgroundColor = UIColor.lightGrayColor;
        //: [self.contentView addSubview:_divider];
        [self.contentView addSubview:_divider];

    }
    //: return self;
    return self;
}

//: - (void)refreshWithData:(NSArray *)comments model:(BBBMessageModel *)data
- (void)streetSmartDataReloadStochasticProcess:(NSArray *)comments mottle:(AccumulationCenter *)data
{
    //: self.textLabel.textColor = data.shouldShowLeft ? [UIColor colorWithHex:0x000000 alpha:1] : [UIColor colorWithHex:0xFFFFFF alpha:1];
    self.textLabel.textColor = data.shouldShowLeft ? [UIColor heatherMixtureWithAlpha:0x000000 to:1] : [UIColor heatherMixtureWithAlpha:0xFFFFFF to:1];
    //: [self.textLabel nim_setText:[AAAKitQuickCommentUtil commentsContent:comments]];
    [self.textLabel showName:[CaseOfMaxTeam my:comments]];
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.textLabel.nim_width = self.nim_width - NIMKitCommentUtilCellContentPadding * 2;
    self.textLabel.nim_width = self.nim_width - k_methodData * 2;
    //: self.textLabel.nim_height = self.textLabel.intrinsicContentSize.height;
    self.textLabel.nim_height = self.textLabel.intrinsicContentSize.height;
    //: self.textLabel.nim_centerY = self.nim_height * .5f;
    self.textLabel.nim_centerY = self.nim_height * .5f;
    //: self.textLabel.nim_left = NIMKitCommentUtilCellPadding;
    self.textLabel.nim_left = k_rejectStatusEventData;

    //: self.divider.nim_width = 0.5;
    self.divider.nim_width = 0.5;
    //: self.divider.nim_height = self.contentView.nim_height - 8;
    self.divider.nim_height = self.contentView.nim_height - 8;
    //: self.divider.nim_centerY = self.contentView.nim_height * 0.5;
    self.divider.nim_centerY = self.contentView.nim_height * 0.5;
    //: self.divider.nim_left = 22;
    self.divider.nim_left = 22;
}

//: @end
@end