
#import <Foundation/Foundation.h>

NSString *StringFromAuraYetData(Byte *data);


//: not support model
Byte str_shouldCustomData[] = {70, 17, 40, 4, 150, 151, 156, 72, 155, 157, 152, 152, 151, 154, 156, 72, 149, 151, 140, 141, 148, 9};


//: NTESMessageTranslate
Byte str_ministrationDateTitle[] = {42, 20, 95, 14, 54, 17, 142, 32, 100, 125, 124, 110, 23, 3, 173, 179, 164, 178, 172, 196, 210, 210, 192, 198, 196, 179, 209, 192, 205, 210, 203, 192, 211, 196, 174};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionTableDelegate.m
// Indicator
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionTableAdapter.h"
#import "AddTable.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "CCCMessageCellFactory.h"
#import "TitlePressed.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"

//: @interface CCCSessionTableAdapter()
@interface AddTable()

//: @property (nonatomic,strong) CCCMessageCellFactory *cellFactory;
@property (nonatomic,strong) TitlePressed *cellFactory;

//: @end
@end

//: @implementation CCCSessionTableAdapter
@implementation AddTable

//: - (instancetype)init
- (instancetype)init
{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _cellFactory = [[CCCMessageCellFactory alloc] init];
        _cellFactory = [[TitlePressed alloc] init];
    }
    //: return self;
    return self;
}

//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //: return 1;
    return 1;
}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //: return [self.interactor items].count;
    return [self.interactor image].count;
}

//: - (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //: UITableViewCell *cell = nil;
    UITableViewCell *cell = nil;
    //: id model = [[self.interactor items] objectAtIndex:indexPath.row];
    id model = [[self.interactor image] objectAtIndex:indexPath.row];
    //: if ([model isKindOfClass:[BBBMessageModel class]]) {
    if ([model isKindOfClass:[AccumulationCenter class]]) {
        //: cell = [self.cellFactory cellInTable:tableView
        cell = [self.cellFactory findPoint:tableView
                                   //: forMessageMode:model];
                                   bottomLight:model];
        //: [(CCCMessageCell *)cell setDelegate:self.delegate];
        [(StatusViewCell *)cell setDelegate:self.delegate];
        //: [self.interactor willDisplayMessageModel:model];
        [self.interactor canModel:model];
        //: [(CCCMessageCell *)cell refreshData:model];
        [(StatusViewCell *)cell message:model];
    }
    //: else if ([model isKindOfClass:[BBBTimestampModel class]])
    else if ([model isKindOfClass:[FromTap class]])
    {
        //: cell = [self.cellFactory cellInTable:tableView
        cell = [self.cellFactory timber:tableView
                                     //: forTimeModel:model];
                                     tingAcross:model];
    }
    //: else
    else
    {
        //: NSAssert(0, @"not support model");
        NSAssert(0, StringFromAuraYetData(str_shouldCustomData));
    }
    //: return cell;
    return cell;
}

//: - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //: if ([self.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)])
    if ([self.delegate respondsToSelector:@selector(image:view:cellOf:)])
    {
        //: [self.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
        [self.delegate image:tableView view:cell cellOf:indexPath];
    }
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //: CGFloat cellHeight = 0;
    CGFloat cellHeight = 0;
    //: id modelInArray = [[self.interactor items] objectAtIndex:indexPath.row];
    id modelInArray = [[self.interactor image] objectAtIndex:indexPath.row];
    //: if ([modelInArray isKindOfClass:[BBBMessageModel class]])
    if ([modelInArray isKindOfClass:[AccumulationCenter class]])
    {
        //: BBBMessageModel *model = (BBBMessageModel *)modelInArray;
        AccumulationCenter *model = (AccumulationCenter *)modelInArray;

        // 撤回的消息 发送自定义消息
        //: if (model.message.messageType == NIMMessageTypeCustom && model.message.messageSubType == 20) {
        if (model.message.messageType == NIMMessageTypeCustom && model.message.messageSubType == 20) {
            //: return 0.f;
            return 0.f;
        }
        //: if (model.message.messageType == NIMMessageTypeCustom) {
        if (model.message.messageType == NIMMessageTypeCustom) {
            //: return 0.f;
            return 0.f;
        }

        //: NIMNotificationObject *object = model.message.messageObject;
        NIMNotificationObject *object = model.message.messageObject;
        //: if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
        if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
        {
            //: return 0.f;
            return 0.f;
        }

        //: CGSize size = [model contentSize:tableView.nim_width];
        CGSize size = [model aggregation:tableView.nim_width];
        //: CGFloat avatarMarginY = [model avatarMargin].y;
        CGFloat avatarMarginY = [model avatarMargin].y;

        //: UIEdgeInsets contentViewInsets = model.contentViewInsets;
        UIEdgeInsets contentViewInsets = model.contentViewInsets;
        //: UIEdgeInsets bubbleViewInsets = model.bubbleViewInsets;
        UIEdgeInsets bubbleViewInsets = model.bubbleViewInsets;
        //: cellHeight = size.height + contentViewInsets.top + contentViewInsets.bottom + bubbleViewInsets.top + bubbleViewInsets.bottom;
        cellHeight = size.height + contentViewInsets.top + contentViewInsets.bottom + bubbleViewInsets.top + bubbleViewInsets.bottom;
        //: if ([model needShowRepliedContent])
        if ([model frank])
        {
            //: CGSize replySize = [model replyContentSize:tableView.nim_width];
            CGSize replySize = [model standard:tableView.nim_width];
            //: UIEdgeInsets replyContentViewInsets = model.replyContentViewInsets;
            UIEdgeInsets replyContentViewInsets = model.replyContentViewInsets;
            //: UIEdgeInsets replyBubbleViewInsets = model.replyBubbleViewInsets;
            UIEdgeInsets replyBubbleViewInsets = model.replyBubbleViewInsets;
            //: cellHeight += replySize.height +
            cellHeight += replySize.height +
                            //: replyContentViewInsets.top +
                            replyContentViewInsets.top +
                            //: replyContentViewInsets.bottom +
                            replyContentViewInsets.bottom +
                            //: replyBubbleViewInsets.top +
                            replyBubbleViewInsets.top +
                            //: replyBubbleViewInsets.bottom;
                            replyBubbleViewInsets.bottom;
        }

        //: if([model.message.localExt.allKeys containsObject:@"NTESMessageTranslate"])
        if([model.message.localExt.allKeys containsObject:StringFromAuraYetData(str_ministrationDateTitle)])
        {
            //: NSString *aString = [model.message.localExt objectForKey:@"NTESMessageTranslate"];
            NSString *aString = [model.message.localExt objectForKey:StringFromAuraYetData(str_ministrationDateTitle)];

            //: M80AttributedLabel *labtran = [[M80AttributedLabel alloc]initWithFrame:CGRectZero];
            MessageEnableTextView *labtran = [[MessageEnableTextView alloc]initWithFrame:CGRectZero];
            //: [labtran nim_setText:aString];
            [labtran showName:aString];
            //: labtran.font = [UIFont systemFontOfSize:13];
            labtran.font = [UIFont systemFontOfSize:13];

            //: CGFloat msgBubbleMaxWidth = (tableView.nim_width - 130);
            CGFloat msgBubbleMaxWidth = (tableView.nim_width - 130);
            //: CGFloat bubbleLeftToContent = 14;
            CGFloat bubbleLeftToContent = 14;
            //: CGFloat contentRightToBubble = 14;
            CGFloat contentRightToBubble = 14;
            //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
            CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);

            //: CGSize replySize = [labtran sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
            CGSize replySize = [labtran sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];

            //: cellHeight += replySize.height+10;
            cellHeight += replySize.height+10;

        }




        //: if ([model needShowEmoticonsView])
        if ([model viewNeedNetShow])
        {
            //: cellHeight += model.emoticonsContainerSize.height;
            cellHeight += model.emoticonsContainerSize.height;
        }

        //: if (model.shouldShowPinContent && model.pinUserName.length) {
        if (model.shouldShowPinContent && model.pinUserName.length) {
            //: cellHeight += 22;
            cellHeight += 22;
        }

        //: if ([model needShowReplyCountContent] && model.childMessagesCount > 0)
        if ([model beginContent] && model.childMessagesCount > 0)
        {
            //: cellHeight += 25;
            cellHeight += 25;
        }


        //: cellHeight = cellHeight > (model.avatarSize.height + avatarMarginY) ? cellHeight : model.avatarSize.height + avatarMarginY;
        cellHeight = cellHeight > (model.avatarSize.height + avatarMarginY) ? cellHeight : model.avatarSize.height + avatarMarginY;


    }
    //: else if ([modelInArray isKindOfClass:[BBBTimestampModel class]])
    else if ([modelInArray isKindOfClass:[FromTap class]])
    {
        //: cellHeight = [(BBBTimestampModel *)modelInArray height];
        cellHeight = [(FromTap *)modelInArray height];
    }
    //: else
    else
    {
        //: NSAssert(0, @"not support model");
        NSAssert(0, StringFromAuraYetData(str_shouldCustomData));
    }
    //: return cellHeight;
    return cellHeight;
}

//: - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //: CGFloat currentOffsetY = scrollView.contentOffset.y;
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    //: if (currentOffsetY + scrollView.frame.size.height > scrollView.contentSize.height && scrollView.frame.size.height <= scrollView.contentSize.height && scrollView.isDragging) {
    if (currentOffsetY + scrollView.frame.size.height > scrollView.contentSize.height && scrollView.frame.size.height <= scrollView.contentSize.height && scrollView.isDragging) {

        //: [self.interactor pullUp];
        [self.interactor tingFor];
    }
}

//: @end
@end

Byte * AuraYetDataToCache(Byte *data) {
    int relateMinimum = data[0];
    int fillSession = data[1];
    Byte gather = data[2];
    int estheticDisable = data[3];
    if (!relateMinimum) return data + estheticDisable;
    for (int i = estheticDisable; i < estheticDisable + fillSession; i++) {
        int value = data[i] - gather;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[estheticDisable + fillSession] = 0;
    return data + estheticDisable;
}

NSString *StringFromAuraYetData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AuraYetDataToCache(data)];
}
