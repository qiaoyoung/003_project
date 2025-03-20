
#import <Foundation/Foundation.h>
typedef struct {
    Byte valueBloc;
    Byte *fileName;
    unsigned int drawIn;
    bool textPerhaps;
} StrippedDownData;

NSString *StringFromStrippedDownData(StrippedDownData *data);


//:  等%zd人
StrippedDownData str_awarenessText = (StrippedDownData){55, (Byte []){23, 208, 154, 190, 18, 77, 83, 211, 141, 141, 19}, 10, false};

// __DEBUG__
// __CLOSE_PRINT__
//
// AppleProjectKitCommentUtil.m
// Indicator
//
//  Created by He on 2020/4/14.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAKitQuickCommentUtil.h"
#import "CaseOfMaxTeam.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"

//: static const CGFloat kHeightPerRow = 25.0;
static const CGFloat k_styleData = 25.0;
//: static NSInteger kMaxWidthPerRow = 0;
static NSInteger k_numberData = 0;
//: const CGFloat NIMKitCommentUtilCellPadding = 2.f;
const CGFloat k_rejectStatusEventData = 2.f;
//: const CGFloat NIMKitCommentUtilCellContentPadding = 5.f;
const CGFloat k_methodData = 5.f;
//: NSString * const NIMKitQuickCommentFormat = @"emoticon_emoji_%02ld";
NSString * const k_boxData = @"emoticon_emoji_%02ld";


//: @implementation AAAKitQuickCommentUtil
@implementation CaseOfMaxTeam

//: + (void)initialize
+ (void)initialize
{
    //: kMaxWidthPerRow = [UIScreen mainScreen].bounds.size.width * 3.5 / 5;
    k_numberData = [UIScreen mainScreen].bounds.size.width * 3.5 / 5;
}

//: + (UIFont *)commentFont
+ (UIFont *)imbed
{
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: static UIFont *instance = nil;
    static UIFont *instance = nil;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [UIFont systemFontOfSize:13];
        instance = [UIFont systemFontOfSize:13];
    //: });
    });
    //: return instance;
    return instance;
}

//: + (M80AttributedLabel *)newCommentLabel
+ (MessageEnableTextView *)afterKey
{
    //: M80AttributedLabel *textLabel = [[M80AttributedLabel alloc] init];
    MessageEnableTextView *textLabel = [[MessageEnableTextView alloc] init];
    //: textLabel.backgroundColor = [UIColor clearColor];
    textLabel.backgroundColor = [UIColor clearColor];
    //: textLabel.numberOfLines = 1;
    textLabel.numberOfLines = 1;
    //: textLabel.textAlignment = kCTTextAlignmentLeft;
    textLabel.textAlignment = kCTTextAlignmentLeft;
    //: textLabel.font = [self commentFont];
    textLabel.font = [self imbed];
    //: textLabel.lineBreakMode = kCTLineBreakByTruncatingTail;
    textLabel.lineBreakMode = kCTLineBreakByTruncatingTail;
    //: return textLabel;
    return textLabel;
}

//: + (NSString *)commentContent:(NIMQuickComment *)comment
+ (NSString *)between:(NIMQuickComment *)comment
{
    //: NSString *ID = [NSString stringWithFormat:NIMKitQuickCommentFormat, (long)comment.replyType];
    NSString *ID = [NSString stringWithFormat:k_boxData, (long)comment.replyType];
    //: NIMInputEmoticon *emoticon = [[AAAInputEmoticonManager sharedManager] emoticonByID:ID];
    LiquidEcstasyEmoticon *emoticon = [[DataOf telegram] pressed:ID];
    //: NSString *content = nil;
    NSString *content = nil;
    //: if (emoticon)
    if (emoticon)
    {
        //: if (emoticon.type == NIMEmoticonTypeUnicode) {
        if (emoticon.type == NIMEmoticonTypeUnicode) {
            //: content = emoticon.unicode;
            content = emoticon.unicode;
        //: } else {
        } else {
            //: content = emoticon.tag;
            content = emoticon.tag;
        }
    }
    //: content = [NSString stringWithFormat:@"%@", content.length ? content : @"[?]".nim_localized];
    content = [NSString stringWithFormat:@"%@", content.length ? content : @"[?]".trapLocalized];
    //: return content;
    return content;
}

//: + (NSString *)commentsContent:(NSArray<NIMQuickComment *> *)comments
+ (NSString *)my:(NSArray<NIMQuickComment *> *)comments
{
    //: NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    //: NIMQuickComment *firstComment = comments.firstObject;
    NIMQuickComment *firstComment = comments.firstObject;
    //: for (NIMQuickComment *comment in comments)
    for (NIMQuickComment *comment in comments)
    {
        //: if ([currentAccount isEqualToString:comment.from])
        if ([currentAccount isEqualToString:comment.from])
        {
            //: firstComment = comment;
            firstComment = comment;
            //: break;
            break;
        }
    }

    //: NSMutableString *string = [NSMutableString string];
    NSMutableString *string = [NSMutableString string];
    //: NSString *fristShowName = [self showNameWithCommentFrom:firstComment];
    NSString *fristShowName = [self utiliser:firstComment];
    //: [string appendFormat:@"%@  %@", [self commentContent:firstComment], fristShowName];
    [string appendFormat:@"%@  %@", [self between:firstComment], fristShowName];
    //: if (comments.count > 1)
    if (comments.count > 1)
    {
        //: [string appendFormat:@" 等%zd人", comments.count];
        [string appendFormat:StringFromStrippedDownData(&str_awarenessText), comments.count];
    }
    //: return [string copy];
    return [string copy];
}

//: + (CGSize)itemSizeWithComment:(NIMQuickComment *)comment
+ (CGSize)name:(NIMQuickComment *)comment
{
    //: static M80AttributedLabel *label = nil;
    static MessageEnableTextView *label = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: label = [self newCommentLabel];
        label = [self afterKey];
    //: });
    });

    //: [label nim_setText:[self commentContent:comment]];
    [label showName:[self between:comment]];
    //: CGSize size = [label sizeThatFits:CGSizeMake(kMaxWidthPerRow, kHeightPerRow)];
    CGSize size = [label sizeThatFits:CGSizeMake(k_numberData, k_styleData)];
    //: return CGSizeMake(size.width + NIMKitCommentUtilCellContentPadding * 2, kHeightPerRow);
    return CGSizeMake(size.width + k_methodData * 2, k_styleData);
}

//: + (CGSize)itemSizeWithComments:(NSArray<NIMQuickComment *> *)comments
+ (CGSize)show:(NSArray<NIMQuickComment *> *)comments
{
    //: if (comments.count == 0)
    if (comments.count == 0)
    {
        //: return CGSizeZero;
        return CGSizeZero;
    }

    //: static M80AttributedLabel *label = nil;
    static MessageEnableTextView *label = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: label = [self newCommentLabel];
        label = [self afterKey];
    //: });
    });

    //: [label nim_setText:[self commentsContent:comments]];
    [label showName:[self my:comments]];
    //: CGSize size = [label sizeThatFits:CGSizeMake(kMaxWidthPerRow, kHeightPerRow)];
    CGSize size = [label sizeThatFits:CGSizeMake(k_numberData, k_styleData)];
    //: return CGSizeMake(size.width + NIMKitCommentUtilCellContentPadding * 2, kHeightPerRow);
    return CGSizeMake(size.width + k_methodData * 2, k_styleData);
}

//: + (CGSize)containerSizeWithComments:(NSMapTable *)table
+ (CGSize)childComments:(NSMapTable *)table
{
    //: NSArray *keys = [self sortedKeys:table];
    NSArray *keys = [self can:table];

    //: CGFloat sumWidth = 0;
    CGFloat sumWidth = 0;
    //: CGFloat maxWidth = sumWidth;
    CGFloat maxWidth = sumWidth;
    //: NSInteger row = 1;
    NSInteger row = 1;
    //: for (NSNumber *key in keys)
    for (NSNumber *key in keys)
    {
        //: NSArray<NIMQuickComment *> *comments = [table objectForKey:key];
        NSArray<NIMQuickComment *> *comments = [table objectForKey:key];
        //: if (!comments)
        if (!comments)
        {
            //: continue;
            continue;
        }

        //: CGSize size = [self itemSizeWithComments:comments];
        CGSize size = [self show:comments];
        //: if (sumWidth + size.width + NIMKitCommentUtilCellPadding * 2 >= kMaxWidthPerRow)
        if (sumWidth + size.width + k_rejectStatusEventData * 2 >= k_numberData)
        {
            //: row ++;
            row ++;
            //: sumWidth = NIMKitCommentUtilCellPadding + size.width;
            sumWidth = k_rejectStatusEventData + size.width;
        }
        //: else
        else
        {
            //: sumWidth += NIMKitCommentUtilCellPadding + size.width;
            sumWidth += k_rejectStatusEventData + size.width;
        }

        //: if (maxWidth < sumWidth)
        if (maxWidth < sumWidth)
        {
            //: maxWidth = sumWidth;
            maxWidth = sumWidth;
        }
    }

    //: maxWidth += NIMKitCommentUtilCellPadding;
    maxWidth += k_rejectStatusEventData;

    //: return CGSizeMake(maxWidth, row * kHeightPerRow + (row + 1) * NIMKitCommentUtilCellPadding);
    return CGSizeMake(maxWidth, row * k_styleData + (row + 1) * k_rejectStatusEventData);
}

//: + (NIMQuickComment *)myCommentFromComments:(NSInteger )indexPath
+ (NIMQuickComment *)edge:(NSInteger )indexPath
                                      //: keys:(NSArray *)keys
                                      carte:(NSArray *)keys
                                  //: comments:(NSMapTable *)map
                                  switchlineTable:(NSMapTable *)map
{
    //: NSNumber *number = [keys objectAtIndex:indexPath];
    NSNumber *number = [keys objectAtIndex:indexPath];
    //: NSArray *comments = [map objectForKey:number];
    NSArray *comments = [map objectForKey:number];
    //: NSString *currentAcount = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSString *currentAcount = [[NIMSDK sharedSDK].loginManager currentAccount];
    //: NIMQuickComment * mine = nil;
    NIMQuickComment * mine = nil;
    //: for (NIMQuickComment *comment in comments)
    for (NIMQuickComment *comment in comments)
    {
        //: if ([comment.from isEqualToString:currentAcount])
        if ([comment.from isEqualToString:currentAcount])
        {
            //: mine = comment;
            mine = comment;
            //: break;
            break;
        }
    }
    //: return mine;
    return mine;
}

//: + (NSString *)showNameWithCommentFrom:(NIMQuickComment *)comment
+ (NSString *)utiliser:(NIMQuickComment *)comment
{
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: NIMChatExtendBasicInfo *basicInfo = comment.basicInfo;
    NIMChatExtendBasicInfo *basicInfo = comment.basicInfo;
    //: NIMSession *session = basicInfo.session;
    NIMSession *session = basicInfo.session;
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.session = session;
    option.session = session;
    //: info = [[AppleProjectKit sharedKit] infoByUser:comment.from option:option];
    info = [[Indicator reach] indoors:comment.from harvest:option];

    //: return info.showName;
    return info.showName;
}

//: + (NSArray *)sortedKeys:(NSMapTable<NSNumber *, NIMQuickComment *> *)map
+ (NSArray *)can:(NSMapTable<NSNumber *, NIMQuickComment *> *)map
{
    //: NSArray *keys = [map.keyEnumerator.allObjects sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
    NSArray *keys = [map.keyEnumerator.allObjects sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
               //: NSArray *array1 = (NSArray *)[map objectForKey:obj1];
               NSArray *array1 = (NSArray *)[map objectForKey:obj1];
               //: NIMQuickComment *comment1 = [array1 lastObject];
               NIMQuickComment *comment1 = [array1 lastObject];

               //: NSArray *array2 = (NSArray *)[map objectForKey:obj2];
               NSArray *array2 = (NSArray *)[map objectForKey:obj2];
               //: NIMQuickComment *comment2 = [array2 lastObject];
               NIMQuickComment *comment2 = [array2 lastObject];

               //: if (comment1.timestamp > comment2.timestamp)
               if (comment1.timestamp > comment2.timestamp)
               {
                   //: return NSOrderedDescending;
                   return NSOrderedDescending;
               }
               //: else if (comment1.timestamp == comment2.timestamp)
               else if (comment1.timestamp == comment2.timestamp)
               {
                   //: return NSOrderedSame;
                   return NSOrderedSame;
               }
               //: else
               else
               {
                   //: return NSOrderedAscending;
                   return NSOrderedAscending;
               }
           //: }];
           }];
    //: return keys;
    return keys;
}

//: @end
@end

Byte *StrippedDownDataToByte(StrippedDownData *data) {
    if (data->textPerhaps) return data->fileName;
    for (int i = 0; i < data->drawIn; i++) {
        data->fileName[i] ^= data->valueBloc;
    }
    data->fileName[data->drawIn] = 0;
    data->textPerhaps = true;
    return data->fileName;
}

NSString *StringFromStrippedDownData(StrippedDownData *data) {
    return [NSString stringWithUTF8String:(char *)StrippedDownDataToByte(data)];
}
