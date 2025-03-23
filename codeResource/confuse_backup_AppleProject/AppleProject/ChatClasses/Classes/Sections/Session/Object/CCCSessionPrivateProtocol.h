//
//  CCCSessionPrivateProtocol.h
// AppleProjectKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#ifndef CCCSessionPrivateProtocol_h
#define CCCSessionPrivateProtocol_h

#import "CCCSessionViewController.h"

@class NIMMessage;
@class BBBMessageModel;

@interface NIMSessionMessageOperateResult : NSObject

@property (nonatomic,copy) NSArray *indexpaths;

@property (nonatomic,copy) NSArray *messageModels;

@end

@protocol NIMSessionDataSource <NSObject>

- (NSArray *)items;

- (NIMSessionMessageOperateResult *)addMessageModels:(NSArray *)models;

- (NIMSessionMessageOperateResult *)insertMessageModels:(NSArray *)models;

- (NIMSessionMessageOperateResult *)deleteMessageModel:(BBBMessageModel *)model;

- (NIMSessionMessageOperateResult *)updateMessageModel:(BBBMessageModel *)model;

- (BBBMessageModel *)findModel:(NIMMessage *)message;

- (NSInteger)indexAtModelArray:(BBBMessageModel *)model;

- (NSArray *)deleteModels:(NSRange)range;

- (void)resetMessages:(void(^)(NSError *error))handler;

- (void)enhancedResetMessages:(void(^)(NSError *error, NSArray *))handler;

- (void)loadHistoryMessagesWithComplete:(void(^)(NSInteger index, NSArray *messages , NSError *error))handler;

- (void)loadNewMessagesWithComplete:(void(^)(NSInteger index, NSArray *messages , NSError *error))handler;

- (void)checkAttachmentState:(NSArray *)messages;

- (NSDictionary *)checkReceipts:(NSArray<NIMMessageReceipt *> *)receipts;

- (void)sendMessageReceipt:(NSArray *)messages;

- (void)cleanCache;

- (void)refreshMessageModelShowSelect:(BOOL)isShow;

- (void)loadMessagePins:(void (^)(NSError *))handler;

// 展示message之前做额外配置
- (void)willDisplayMessageModel:(BBBMessageModel *)model;

- (void)addPinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler;

- (void)removePinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler;

@end


@protocol NIMSessionLayoutDelegate <NSObject>

- (void)onRefresh;

@end

@protocol NIMSessionLayout <NSObject>

- (void)update:(NSIndexPath *)indexPath;

- (void)insert:(NSArray *)indexPaths animated:(BOOL)animated;

- (void)remove:(NSArray *)indexPaths;

- (BOOL)canInsertChatroomMessages;

- (void)calculateContent:(BBBMessageModel *)model;

- (void)reloadTable;

- (void)resetLayout;

- (void)changeLayout:(CGFloat)inputViewHeight;

- (void)setDelegate:(id<NIMSessionLayoutDelegate>)delegate;

- (void)layoutAfterRefresh;

- (void)adjustOffset:(NSInteger)row;

- (void)dismissReplyContent;

- (NSInteger)numberOfRows;

@end





@interface CCCSessionViewController(Interactor)

- (void)setInteractor:(id<NIMSessionInteractor>) interactor;

- (void)setTableDelegate:(id<UITableViewDelegate, UITableViewDataSource>) tableDelegate;

@end


#endif /* CCCSessionPrivateProtocol_h */
