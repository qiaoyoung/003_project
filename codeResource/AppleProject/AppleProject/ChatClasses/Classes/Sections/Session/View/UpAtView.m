
#import <Foundation/Foundation.h>

NSString *StringFromPopularityData(Byte *data);        


//: #333333
Byte str_tanRoverValue[] = {26, 7, 27, 6, 246, 12, 8, 24, 24, 24, 24, 24, 24, 43};


//: #999999
Byte str_wireDiscTropicData[] = {91, 7, 71, 12, 164, 47, 189, 186, 97, 53, 10, 31, 220, 242, 242, 242, 242, 242, 242, 99};


//: 1条回复
Byte str_franchiseTitle[] = {18, 10, 21, 7, 45, 145, 203, 28, 209, 136, 140, 208, 134, 137, 208, 143, 120, 212};


//: icon_reply
Byte str_fillTitle[] = {14, 10, 94, 13, 117, 145, 187, 55, 223, 247, 224, 209, 222, 11, 5, 17, 16, 1, 20, 7, 18, 14, 27, 112};


//: ffffff
Byte str_mediaConValue[] = {71, 6, 18, 10, 113, 101, 197, 99, 202, 116, 84, 84, 84, 84, 84, 84, 173};


//: NTESMessageTranslate
Byte str_beginningName[] = {61, 20, 83, 10, 57, 45, 96, 111, 16, 78, 251, 1, 242, 0, 250, 18, 32, 32, 14, 20, 18, 1, 31, 14, 27, 32, 25, 14, 33, 18, 164};


//: %@标记了这条消息
Byte str_titleAccomplishData[] = {27, 23, 71, 13, 136, 61, 21, 219, 174, 114, 58, 143, 42, 222, 249, 159, 89, 64, 161, 103, 105, 157, 115, 63, 161, 120, 82, 159, 86, 90, 159, 111, 65, 159, 58, 104, 13};


//: icon_pin
Byte str_depressedThirdsValue[] = {17, 8, 38, 11, 72, 250, 227, 64, 206, 199, 63, 67, 61, 73, 72, 57, 74, 67, 72, 175};


//: %zd条回复
Byte str_sharedOyValue[] = {47, 12, 56, 9, 67, 168, 59, 53, 53, 237, 66, 44, 174, 101, 105, 173, 99, 102, 173, 108, 85, 60};

// __DEBUG__
// __CLOSE_PRINT__
//
//  UpAtView.m
// Indicator
//
//  Created by He on 2020/4/10.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCAdvancedMessageCell.h"
#import "UpAtView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "CCCQuickCommentCell.h"
#import "AdministrativeDivisionReusableView.h"
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "AAAKitQuickCommentUtil.h"
#import "CaseOfMaxTeam.h"
//: #import "UIColor+AppleProjectKit.h"
#import "UIColor+Indicator.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "CCCCollectionViewLeftAlignedLayout.h"
#import "MinFlowLayout.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"

//: static NSString * const kNIMListCellReuseID = @"CCCQuickCommentCell";
static NSString * const k_arrowText = @"AdministrativeDivisionReusableView";
//: static const CGFloat kNIMAdvancedBackgroundPadding = 5;
static const CGFloat k_subValue = 5;

//: @interface CCCAdvancedMessageCell () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@interface UpAtView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

//: @property (nonatomic,strong) NSArray *objects;
@property (nonatomic,strong) NSArray *objects;

//: @property (nonatomic,strong) NSMapTable *map;
@property (nonatomic,strong) NSMapTable *map;

//: @end
@end

//: @implementation CCCAdvancedMessageCell
@implementation UpAtView

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self)
    if (self)
    {
        //: _replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_replyButton setImage:[UIImage imageNamed:@"icon_reply"] forState:UIControlStateNormal];
        [_replyButton setImage:[UIImage imageNamed:StringFromPopularityData(str_fillTitle)] forState:UIControlStateNormal];
        //: UIColor *titleColor = [UIColor colorWithHex:0x337EFF alpha:1];
        UIColor *titleColor = [UIColor heatherMixtureWithAlpha:0x337EFF to:1];
        //: [_replyButton setTitleColor:titleColor forState:UIControlStateNormal];
        [_replyButton setTitleColor:titleColor forState:UIControlStateNormal];
        //: _replyButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _replyButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_replyButton addTarget:self action:@selector(onReplyClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_replyButton addTarget:self action:@selector(holders:) forControlEvents:UIControlEventTouchUpInside];
        //: _replyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        _replyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        //: _replyButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 3);
        _replyButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 3);
        //: [self.contentView addSubview:_replyButton];
        [self.contentView addSubview:_replyButton];

        //: _pinView = [UIButton buttonWithType:UIButtonTypeCustom];
        _pinView = [UIButton buttonWithType:UIButtonTypeCustom];
        //: _pinView.enabled = NO;
        _pinView.enabled = NO;
        //: _pinView.adjustsImageWhenDisabled = NO;
        _pinView.adjustsImageWhenDisabled = NO;
        //: [_pinView setImage:[UIImage imageNamed:@"icon_pin"] forState:UIControlStateNormal];
        [_pinView setImage:[UIImage imageNamed:StringFromPopularityData(str_depressedThirdsValue)] forState:UIControlStateNormal];
        //: [_pinView setTitleColor:[UIColor colorWithRed:0 green:165/255.0 blue:85/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_pinView setTitleColor:[UIColor colorWithRed:0 green:165/255.0 blue:85/255.0 alpha:1.0] forState:UIControlStateNormal];
        //: _pinView.titleLabel.font = [UIFont systemFontOfSize:14];
        _pinView.titleLabel.font = [UIFont systemFontOfSize:14];
        //: _pinView.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        _pinView.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        //: _pinView.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 3);
        _pinView.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 3);
        //: _pinView.titleLabel.adjustsFontSizeToFitWidth = YES;
        _pinView.titleLabel.adjustsFontSizeToFitWidth = YES;
        //: _pinView.titleLabel.minimumScaleFactor = 0.7;
        _pinView.titleLabel.minimumScaleFactor = 0.7;
        //: [self.contentView addSubview:_pinView];
        [self.contentView addSubview:_pinView];

        //: _translationView = [[UIView alloc]init];
        _translationView = [[UIView alloc]init];
        //: _translationView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        _translationView.backgroundColor = [UIColor direction:StringFromPopularityData(str_mediaConValue)];
        //: _translationView.layer.cornerRadius = 8;
        _translationView.layer.cornerRadius = 8;
        //: [self.contentView addSubview:_translationView];
        [self.contentView addSubview:_translationView];

    }
    //: return self;
    return self;
}

//: - (void)refreshData:(BBBMessageModel *)data
- (void)message:(AccumulationCenter *)data
{

    //: [super refreshData:data];
    [super message:data];
    //: [self refreshPinView:data];
    [self elite:data];
    //: [self refreshReplyCountView:data];
    [self reply:data];
    //: [self refreshEmoticonsView:data];
    [self view:data];

    //: [self refreshtranslationView:data];
    [self blue:data];

    //: [self setNeedsLayout];
    [self setNeedsLayout];
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [self layoutEmoticonsContainerViewSize];
    [self show];

    //: [super layoutSubviews];
    [super layoutSubviews];

    //: [self layoutPinView];
    [self customPin];
    //: [self layoutReplyCountView];
    [self play];

    //: [self layouttranslationView];
    [self nearApp];
}

//: #pragma mark - View
#pragma mark - View

//: - (void)layouttranslationView
- (void)nearApp
{
    //: if (self.translationView.hidden)
    if (self.translationView.hidden)
    {
        //: self.translationView.frame = CGRectZero;
        self.translationView.frame = CGRectZero;
    }
    //: else
    else
    {

        //: NSString *aString = [self.model.message.localExt objectForKey:@"NTESMessageTranslate"];
        NSString *aString = [self.model.message.localExt objectForKey:StringFromPopularityData(str_beginningName)];
        //: M80AttributedLabel *labtran = [[M80AttributedLabel alloc]initWithFrame:CGRectZero];
        MessageEnableTextView *labtran = [[MessageEnableTextView alloc]initWithFrame:CGRectZero];
        //: [labtran nim_setText:aString];
        [labtran showName:aString];
        //: labtran.textColor = [UIColor colorWithHexString:@"#999999"];
        labtran.textColor = [UIColor direction:StringFromPopularityData(str_wireDiscTropicData)];
        //: labtran.font = [UIFont systemFontOfSize:13];
        labtran.font = [UIFont systemFontOfSize:13];

//        CGFloat msgBubbleMaxWidth    = self.bubbleView.nim_width;
        //: CGFloat msgBubbleMaxWidth = (self.nim_width - 130);
        CGFloat msgBubbleMaxWidth = (self.nim_width - 130);
        //: CGFloat bubbleLeftToContent = 5;
        CGFloat bubbleLeftToContent = 5;
        //: CGFloat contentRightToBubble = 5;
        CGFloat contentRightToBubble = 5;
        //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
        CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);

        //: CGSize replySize = [labtran sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
        CGSize replySize = [labtran sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];

        //: self.translationView.height = replySize.height;
        self.translationView.height = replySize.height;
        //: self.translationView.width = replySize.width+10;
        self.translationView.width = replySize.width+10;
        //: self.translationView.top = self.bubbleView.bottom+5;
        self.translationView.top = self.bubbleView.bottom+5;

        //: if (self.model.shouldShowLeft) {
        if (self.model.shouldShowLeft) {
//            self.pinView.nim_left = self.bubblesBackgroundView.nim_left;
//            self.pinView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            //: self.translationView.left = self.bubbleView.left;
            self.translationView.left = self.bubbleView.left;
        //: } else {
        } else {
            //: self.translationView.nim_right = self.bubbleView.nim_right;
            self.translationView.nim_right = self.bubbleView.nim_right;
//            self.pinView.nim_right = self.bubblesBackgroundView.nim_right;
//            self.pinView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        }



//        self.translationView.left = self.bubbleView.left;

    }
}
//: - (void)refreshtranslationView:(BBBMessageModel *)data
- (void)blue:(AccumulationCenter *)data
{
    //: if([data.message.localExt.allKeys containsObject:@"NTESMessageTranslate"])
    if([data.message.localExt.allKeys containsObject:StringFromPopularityData(str_beginningName)])
    {
        //: NSArray *viewsArray = self.translationView.subviews;
        NSArray *viewsArray = self.translationView.subviews;
        //: for (int i = 0; i < viewsArray.count; i ++) {
        for (int i = 0; i < viewsArray.count; i ++) {
            //: UIView *subview = viewsArray[i];
            UIView *subview = viewsArray[i];
            //: [subview removeFromSuperview];
            [subview removeFromSuperview];
        }

        //: M80AttributedLabel *labtran = [[M80AttributedLabel alloc]initWithFrame:CGRectZero];
        MessageEnableTextView *labtran = [[MessageEnableTextView alloc]initWithFrame:CGRectZero];
        //: [labtran nim_setText:[self.model.message.localExt objectForKey:@"NTESMessageTranslate"]];
        [labtran showName:[self.model.message.localExt objectForKey:StringFromPopularityData(str_beginningName)]];
        //: labtran.textColor = [UIColor colorWithHexString:@"#333333"];
        labtran.textColor = [UIColor direction:StringFromPopularityData(str_tanRoverValue)];
        //: labtran.font = [UIFont systemFontOfSize:13];
        labtran.font = [UIFont systemFontOfSize:13];
        //: labtran.numberOfLines = 0;
        labtran.numberOfLines = 0;
        //: [_translationView addSubview:labtran];
        [_translationView addSubview:labtran];
//        [labtran sizeToFit];

        //: CGFloat msgBubbleMaxWidth = (self.nim_width - 130);
        CGFloat msgBubbleMaxWidth = (self.nim_width - 130);
        //: CGFloat bubbleLeftToContent = 5;
        CGFloat bubbleLeftToContent = 5;
        //: CGFloat contentRightToBubble = 5;
        CGFloat contentRightToBubble = 5;
        //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
        CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
        //: CGSize replySize = [labtran sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
        CGSize replySize = [labtran sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
        //: labtran.frame = CGRectMake(5, 0, replySize.width, replySize.height);
        labtran.frame = CGRectMake(5, 0, replySize.width, replySize.height);

//        UILabel *labtran = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 0, 0)];
//        labtran.text = [self.model.message.localExt objectForKey:@"NTESMessageTranslate"];
//        labtran.numberOfLines = 0;
//        labtran.font = [UIFont systemFontOfSize:12];
//        labtran.textColor = TextColor_4;
//        [_translationView addSubview:labtran];
//        [labtran sizeToFit];

        //: _translationView.hidden = NO;
        _translationView.hidden = NO;
    }
    //: else
    else
    {
        //: _translationView.hidden = YES;
        _translationView.hidden = YES;
    }
}



//: - (void)refreshEmoticonsView:(BBBMessageModel *)data
- (void)view:(AccumulationCenter *)data
{
    //: self.emoticonsContainerView.hidden = YES;
    self.emoticonsContainerView.hidden = YES;
    //: self.emoticonsContainerView.dataSource = nil;
    self.emoticonsContainerView.dataSource = nil;
    //: self.emoticonsContainerView.delegate = nil;
    self.emoticonsContainerView.delegate = nil;
    //: self.objects = nil;
    self.objects = nil;
    //: self.map = nil;
    self.map = nil;

    //: if (data.enableQuickComments)
    if (data.enableQuickComments)
    {
        //: NSMapTable<NSNumber *, NIMQuickComment *> * result = data.quickComments;
        NSMapTable<NSNumber *, NIMQuickComment *> * result = data.quickComments;
        //: self.map = result;
        self.map = result;
        // 按最近评论优先排序
        //: self.objects = [AAAKitQuickCommentUtil sortedKeys:result];
        self.objects = [CaseOfMaxTeam can:result];
        //: [self refreshCollection:data];
        [self add:data];
    }
    //: else
    else
    {
        //: self.emoticonsContainerView = nil;
        self.emoticonsContainerView = nil;
    }
}

//: - (void)refreshCollection:(BBBMessageModel *)data
- (void)add:(AccumulationCenter *)data
{
    //: if ([data needShowEmoticonsView])
    if ([data viewNeedNetShow])
    {
        //: UICollectionView *collectionView = self.emoticonsContainerView;
        UICollectionView *collectionView = self.emoticonsContainerView;
        //: if (!collectionView)
        if (!collectionView)
        {
            //: UICollectionViewFlowLayout *flowLayout = [[CCCCollectionViewLeftAlignedLayout alloc] init];
            UICollectionViewFlowLayout *flowLayout = [[MinFlowLayout alloc] init];
            //: flowLayout.minimumLineSpacing = NIMKitCommentUtilCellPadding;
            flowLayout.minimumLineSpacing = k_rejectStatusEventData;
            //: flowLayout.minimumInteritemSpacing = NIMKitCommentUtilCellPadding;
            flowLayout.minimumInteritemSpacing = k_rejectStatusEventData;
            //: collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
            collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                //: collectionViewLayout:flowLayout];
                                                collectionViewLayout:flowLayout];
            //: [collectionView registerClass:[CCCQuickCommentCell class] forCellWithReuseIdentifier:kNIMListCellReuseID];
            [collectionView registerClass:[AdministrativeDivisionReusableView class] forCellWithReuseIdentifier:k_arrowText];
            //: self.emoticonsContainerView = collectionView;
            self.emoticonsContainerView = collectionView;
            //: [self.contentView addSubview:collectionView];
            [self.contentView addSubview:collectionView];
        }

        //: self.emoticonsContainerView.backgroundColor = [UIColor clearColor];
        self.emoticonsContainerView.backgroundColor = [UIColor clearColor];
        //: collectionView.dataSource = self;
        collectionView.dataSource = self;
        //: collectionView.delegate = self;
        collectionView.delegate = self;
        //: collectionView.hidden = NO;
        collectionView.hidden = NO;
    }
}

//: - (void)refreshPinView:(BBBMessageModel *)data
- (void)elite:(AccumulationCenter *)data
{
    //: if (data.pinUserName.length && data.shouldShowPinContent)
    if (data.pinUserName.length && data.shouldShowPinContent)
    {
        //: [_pinView setTitle:[NSString stringWithFormat:@"%@标记了这条消息".nim_localized, data.pinUserName] forState:UIControlStateNormal];
        [_pinView setTitle:[NSString stringWithFormat:StringFromPopularityData(str_titleAccomplishData).trapLocalized, data.pinUserName] forState:UIControlStateNormal];
        //: _pinView.hidden = NO;
        _pinView.hidden = NO;
    }
    //: else
    else
    {
        //: _pinView.hidden = YES;
        _pinView.hidden = YES;
    }
}

//: - (void)refreshReplyCountView:(BBBMessageModel *)data
- (void)reply:(AccumulationCenter *)data
{
    //: NSInteger count = data.childMessagesCount;
    NSInteger count = data.childMessagesCount;
    //: if (count > 0)
    if (count > 0)
    {
        //: if (count == 1)
        if (count == 1)
        {
            //: [_replyButton setTitle:@"1条回复".nim_localized forState:UIControlStateNormal];
            [_replyButton setTitle:StringFromPopularityData(str_franchiseTitle).trapLocalized forState:UIControlStateNormal];
        }
        //: else
        else
        {
            //: [_replyButton setTitle:[NSString stringWithFormat:@"%zd条回复".nim_localized, count]
            [_replyButton setTitle:[NSString stringWithFormat:StringFromPopularityData(str_sharedOyValue).trapLocalized, count]
                          //: forState:UIControlStateNormal];
                          forState:UIControlStateNormal];
        }

        //: _replyButton.hidden = NO;
        _replyButton.hidden = NO;
    }
    //: else
    else
    {
        //: _replyButton.hidden = YES;
        _replyButton.hidden = YES;
    }
}


//: #pragma mark - Layout
#pragma mark - Layout
//: - (void)layoutPinView
- (void)customPin
{
    //: if (self.pinView.hidden)
    if (self.pinView.hidden)
    {
        //: self.pinView.frame = CGRectZero;
        self.pinView.frame = CGRectZero;
    }
    //: else
    else
    {
        //: self.pinView.nim_height = self.pinView.intrinsicContentSize.height;
        self.pinView.nim_height = self.pinView.intrinsicContentSize.height;
        //: self.pinView.nim_width = self.pinView.intrinsicContentSize.width + 8;
        self.pinView.nim_width = self.pinView.intrinsicContentSize.width + 8;
        //: self.pinView.nim_top = self.bubblesBackgroundView.nim_bottom + 5.f;
        self.pinView.nim_top = self.bubblesBackgroundView.nim_bottom + 5.f;
        //: if (self.model.shouldShowLeft) {
        if (self.model.shouldShowLeft) {
            //: self.pinView.nim_left = self.bubblesBackgroundView.nim_left;
            self.pinView.nim_left = self.bubblesBackgroundView.nim_left;
            //: self.pinView.nim_width = self.contentView.nim_width - self.pinView.nim_left - 8;
            self.pinView.nim_width = self.contentView.nim_width - self.pinView.nim_left - 8;
            //: self.pinView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            self.pinView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //: } else {
        } else {
            //: self.pinView.nim_width = self.bubblesBackgroundView.nim_right - 8;
            self.pinView.nim_width = self.bubblesBackgroundView.nim_right - 8;
            //: self.pinView.nim_right = self.bubblesBackgroundView.nim_right;
            self.pinView.nim_right = self.bubblesBackgroundView.nim_right;
            //: self.pinView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            self.pinView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        }
    }
}

//: - (void)layoutReplyCountView
- (void)play
{
    //: if (self.replyButton.hidden)
    if (self.replyButton.hidden)
    {
        //: self.replyButton.frame = CGRectZero;
        self.replyButton.frame = CGRectZero;
    }
    //: else
    else
    {
        //: self.replyButton.nim_height = self.replyButton.intrinsicContentSize.height;
        self.replyButton.nim_height = self.replyButton.intrinsicContentSize.height;
        //: self.replyButton.nim_width = self.replyButton.intrinsicContentSize.width + 8;
        self.replyButton.nim_width = self.replyButton.intrinsicContentSize.width + 8;
        //: if (self.model.shouldShowLeft)
        if (self.model.shouldShowLeft)
        {
            //: self.replyButton.nim_left = self.pinView.hidden ? self.bubblesBackgroundView.nim_left : self.pinView.nim_left;
            self.replyButton.nim_left = self.pinView.hidden ? self.bubblesBackgroundView.nim_left : self.pinView.nim_left;
        }
        //: else
        else
        {
            //: self.replyButton.nim_right = self.pinView.hidden ? self.bubblesBackgroundView.nim_right : self.pinView.nim_right;
            self.replyButton.nim_right = self.pinView.hidden ? self.bubblesBackgroundView.nim_right : self.pinView.nim_right;
        }

        //: if (self.pinView.hidden)
        if (self.pinView.hidden)
        {
            //: self.replyButton.nim_top = self.bubblesBackgroundView.nim_bottom + 5.f;
            self.replyButton.nim_top = self.bubblesBackgroundView.nim_bottom + 5.f;
        }
        //: else
        else
        {
            //: self.replyButton.nim_top = self.pinView.nim_bottom + 5.f;
            self.replyButton.nim_top = self.pinView.nim_bottom + 5.f;
        }
    }
}

//: - (void)layoutEmoticonsContainerViewSize
- (void)show
{
    //: if ([self.model needShowEmoticonsView])
    if ([self.model viewNeedNetShow])
    {
        //: CGSize size = self.model.emoticonsContainerSize;
        CGSize size = self.model.emoticonsContainerSize;
        //: self.emoticonsContainerView.nim_size = CGSizeMake(size.width + 2, size.height);
        self.emoticonsContainerView.nim_size = CGSizeMake(size.width + 2, size.height);
    }
    //: else
    else
    {
        //: self.emoticonsContainerView.frame = CGRectZero;
        self.emoticonsContainerView.frame = CGRectZero;
        //: self.emoticonsContainerView = nil;
        self.emoticonsContainerView = nil;
    }
}

//: - (void)fixPositions
- (void)power
{
    //: if (self.replyedBubbleView)
    if (self.replyedBubbleView)
    {
        //: self.bubblesBackgroundView.nim_top = self.replyedBubbleView.nim_top;
        self.bubblesBackgroundView.nim_top = self.replyedBubbleView.nim_top;
    }
    //: else
    else
    {
        //: self.bubblesBackgroundView.nim_top = self.bubbleView.nim_top;
        self.bubblesBackgroundView.nim_top = self.bubbleView.nim_top;
    }

    //: if (!self.emoticonsContainerView || self.emoticonsContainerView.hidden)
    if (!self.emoticonsContainerView || self.emoticonsContainerView.hidden)
    {
        //: return;
        return;
    }

    //: CGFloat left = 0;
    CGFloat left = 0;
    //: CGFloat protraitRightToBubble = 5.f;
    CGFloat protraitRightToBubble = 5.f;
    //: if (!self.model.shouldShowLeft)
    if (!self.model.shouldShowLeft)
    {
        //: CGFloat right = self.model.shouldShowAvatar? CGRectGetMinX(self.headImageView.frame) - protraitRightToBubble : self.nim_width;
        CGFloat right = self.model.shouldShowAvatar? CGRectGetMinX(self.headImageView.frame) - protraitRightToBubble : self.nim_width;
        //: left = right - CGRectGetWidth(self.bubblesBackgroundView.bounds);
        left = right - CGRectGetWidth(self.bubblesBackgroundView.bounds);
    //: } else {
    } else {
        //: left = self.bubbleView.nim_left;
        left = self.bubbleView.nim_left;
    }

    //: self.replyedBubbleView.nim_left = left;
    self.replyedBubbleView.nim_left = left;
    //: self.bubbleView.nim_left = left;
    self.bubbleView.nim_left = left;
    //: self.emoticonsContainerView.nim_left = left + kNIMAdvancedBackgroundPadding;
    self.emoticonsContainerView.nim_left = left + k_subValue;
    //: self.bubblesBackgroundView.nim_left = left;
    self.bubblesBackgroundView.nim_left = left;

    //: self.emoticonsContainerView.nim_top = ((UIView *)self.bubbleView).nim_bottom;
    self.emoticonsContainerView.nim_top = ((UIView *)self.bubbleView).nim_bottom;
}

//: - (void)layoutBubblesBackgroundView
- (void)state
{
    //: CGFloat height = self.replyedBubbleView.nim_height + self.bubbleView.nim_height;
    CGFloat height = self.replyedBubbleView.nim_height + self.bubbleView.nim_height;
    //: height += self.emoticonsContainerView.nim_height;
    height += self.emoticonsContainerView.nim_height;

    //: CGFloat width = self.replyedBubbleView.nim_width > self.bubbleView.nim_width ? self.replyedBubbleView.nim_width : self.bubbleView.nim_width;
    CGFloat width = self.replyedBubbleView.nim_width > self.bubbleView.nim_width ? self.replyedBubbleView.nim_width : self.bubbleView.nim_width;
    //: CGFloat emoticonsWidth = self.emoticonsContainerView.nim_width + kNIMAdvancedBackgroundPadding * 2;
    CGFloat emoticonsWidth = self.emoticonsContainerView.nim_width + k_subValue * 2;
    //: width = width > emoticonsWidth ? width : emoticonsWidth;
    width = width > emoticonsWidth ? width : emoticonsWidth;
    //: self.bubblesBackgroundView.nim_size = CGSizeMake(width, height);
    self.bubblesBackgroundView.nim_size = CGSizeMake(width, height);
    //: self.bubblesBackgroundView.nim_left = self.bubbleView.nim_left;
    self.bubblesBackgroundView.nim_left = self.bubbleView.nim_left;

    //: [self fixPositions];
    [self power];
}

//: - (void)layoutReadButton{
- (void)nim{

    //: if (!self.readButton.isHidden) {
    if (!self.readButton.isHidden) {

        //: CGFloat left = self.bubbleView.nim_left;
        CGFloat left = self.bubbleView.nim_left;
        //: CGFloat bottom = self.bubbleView.nim_bottom;
        CGFloat bottom = self.bubbleView.nim_bottom;

        //: self.readButton.nim_left = left - CGRectGetWidth(self.readButton.bounds) - 2;
        self.readButton.nim_left = left - CGRectGetWidth(self.readButton.bounds) - 2;
//        self.readButton.nim_bottom = bottom;
        //: self.readButton.nim_centerY = self.bubbleView.nim_centerY;
        self.readButton.nim_centerY = self.bubbleView.nim_centerY;
    }
}

//: #pragma mark - Action
#pragma mark - Action

//: - (void)onReplyClicked:(id)sender
- (void)holders:(id)sender
{
    //: if ([self.delegate respondsToSelector:@selector(onClickReplyButton:)])
    if ([self.delegate respondsToSelector:@selector(tiptoed:)])
    {
        //: [self.delegate onClickReplyButton:self.model.message];
        [self.delegate tiptoed:self.model.message];
    }
}


//: #pragma mark - UICollectionViewDataSource
#pragma mark - UICollectionViewDataSource

//: - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //: return self.objects.count;
    return self.objects.count;
}

//: - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //: CCCQuickCommentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kNIMListCellReuseID forIndexPath:indexPath];
    AdministrativeDivisionReusableView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:k_arrowText forIndexPath:indexPath];
    //: NSNumber *number = [self.objects objectAtIndex:indexPath.item];
    NSNumber *number = [self.objects objectAtIndex:indexPath.item];
    //: NSArray *comments = [self.map objectForKey:number];
    NSArray *comments = [self.map objectForKey:number];
    //: [cell refreshWithData:comments model:self.model];
    [cell streetSmartDataReloadStochasticProcess:comments mottle:self.model];
    //: return cell;
    return cell;
}

//: #pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewDelegate

//: - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //: NSNumber *number = [self.objects objectAtIndex:indexPath.item];
    NSNumber *number = [self.objects objectAtIndex:indexPath.item];
    //: NSArray *comments = [self.map objectForKey:number];
    NSArray *comments = [self.map objectForKey:number];
    //: CGSize size = [AAAKitQuickCommentUtil itemSizeWithComments:comments];
    CGSize size = [CaseOfMaxTeam show:comments];
    //: return size;
    return size;
}

//: - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //: return UIEdgeInsetsMake(0, NIMKitCommentUtilCellPadding, 0, NIMKitCommentUtilCellPadding);
    return UIEdgeInsetsMake(0, k_rejectStatusEventData, 0, k_rejectStatusEventData);
}

//: - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //: NIMQuickComment *comment = [AAAKitQuickCommentUtil myCommentFromComments:indexPath.item
    NIMQuickComment *comment = [CaseOfMaxTeam edge:indexPath.item
                                                                 //: keys:self.objects
                                                                 carte:self.objects
                                                             //: comments:self.map];
                                                             switchlineTable:self.map];
    //: if ([self.delegate respondsToSelector:@selector(onClickEmoticon:comment:selected:)])
    if ([self.delegate respondsToSelector:@selector(readRange:commentTab:line:)])
    {
        //: BOOL hasCommentThisEmoticon = comment ? YES : NO;
        BOOL hasCommentThisEmoticon = comment ? YES : NO;
        //: if (!comment)
        if (!comment)
        {
            //: NSNumber *number = [self.objects objectAtIndex:indexPath.item];
            NSNumber *number = [self.objects objectAtIndex:indexPath.item];
            //: NSArray *comments = [self.map objectForKey:number];
            NSArray *comments = [self.map objectForKey:number];
            //: comment = [comments firstObject];
            comment = [comments firstObject];
        }
        //: [self.delegate onClickEmoticon:self.model.message
        [self.delegate readRange:self.model.message
                               //: comment:comment
                               commentTab:comment
                              //: selected:hasCommentThisEmoticon];
                              line:hasCommentThisEmoticon];
    }
}





//: @end
@end

Byte * PopularityDataToCache(Byte *data) {
    int unaffectedBucket = data[0];
    int dataJazz = data[1];
    Byte hearingNess = data[2];
    int enforceEncounter = data[3];
    if (!unaffectedBucket) return data + enforceEncounter;
    for (int i = enforceEncounter; i < enforceEncounter + dataJazz; i++) {
        int value = data[i] + hearingNess;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[enforceEncounter + dataJazz] = 0;
    return data + enforceEncounter;
}

NSString *StringFromPopularityData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)PopularityDataToCache(data)];
}
