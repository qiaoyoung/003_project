// __DEBUG__
// __CLOSE_PRINT__
//
// AppleProjectKitCommentUtil.h
// Indicator
//
//  Created by He on 2020/4/14.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class NIMQuickComment;
@class NIMQuickComment;
//: @class M80AttributedLabel;
@class MessageEnableTextView;
//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: extern const CGFloat NIMKitCommentUtilCellPadding;
extern const CGFloat k_rejectStatusEventData;

//: extern const CGFloat NIMKitCommentUtilCellContentPadding;
extern const CGFloat k_methodData;

//: extern NSString * const NIMKitQuickCommentFormat;
extern NSString * const k_boxData;


//: @interface AAAKitQuickCommentUtil : NSObject
@interface CaseOfMaxTeam : NSObject

//: + (UIFont *)commentFont;
+ (UIFont *)imbed;

//: + (NSString *)commentContent:(NIMQuickComment *)comment;
+ (NSString *)between:(NIMQuickComment *)comment;

//: + (NSString *)commentsContent:(NSArray<NIMQuickComment *> *)comments;
+ (NSString *)my:(NSArray<NIMQuickComment *> *)comments;

//: + (CGSize)itemSizeWithComment:(NIMQuickComment *)comment;
+ (CGSize)name:(NIMQuickComment *)comment;

//: + (CGSize)itemSizeWithComments:(NSArray<NIMQuickComment *> *)comments;
+ (CGSize)show:(NSArray<NIMQuickComment *> *)comments;

//: + (CGSize)containerSizeWithComments:(NSMapTable *)comments;
+ (CGSize)childComments:(NSMapTable *)comments;

//: + (NIMQuickComment * _Nullable)myCommentFromComments:(NSInteger )keyIndex
+ (NIMQuickComment * _Nullable)edge:(NSInteger )keyIndex
                                      //: keys:(NSArray *)keys
                                      carte:(NSArray *)keys
                                  //: comments:(NSMapTable *)map;
                                  switchlineTable:(NSMapTable *)map;

//: + (M80AttributedLabel *)newCommentLabel;
+ (MessageEnableTextView *)afterKey;

//: + (NSArray *)sortedKeys:(NSMapTable<NSNumber *, NIMQuickComment *> *)map;
+ (NSArray *)can:(NSMapTable<NSNumber *, NIMQuickComment *> *)map;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END