// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCSessionConfigurateProtocol.h
// Indicator
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"

// __M_A_C_R_O__

//: typedef NS_ENUM(NSUInteger, NIMKitSessionState) {
typedef NS_ENUM(NSUInteger, NIMKitSessionState) {
    //: NIMKitSessionStateNormal = 0,
    NIMKitSessionStateNormal = 0,
    //: NIMKitSessionStateSelect,
    NIMKitSessionStateSelect,
//: };
};

//: @protocol NIMSessionInteractorDelegate <NSObject>
@protocol InputSignalTable <NSObject>

//: - (void)didFetchMessageData;
- (void)addSelected;

//: - (void)didRefreshMessageData;
- (void)buttonQuick;

//: - (void)didPullUpMessageData;
- (void)withTime;


//: @end
@end

//: @protocol NIMSessionInteractor <NSObject>
@protocol WriterSContentSumeractor <NSObject>

//网络接口
//: - (void)sendMessage:(NIMMessage *)message;
- (void)info:(NIMMessage *)message;

//: - (void)sendMessage:(NIMMessage *)message toMessage:(NIMMessage *)toMessage;
- (void)gesture:(NIMMessage *)message recording:(NIMMessage *)toMessage;

//: - (void)sendMessage:(NIMMessage *)message completion:(void(^)(NSError * error))completion;
- (void)menu:(NIMMessage *)message voice:(void(^)(NSError * error))completion;

//: - (void)sendMessage:(NIMMessage *)message
- (void)with:(NIMMessage *)message
          //: toMessage:(NIMMessage *)toMessage
          textDoing:(NIMMessage *)toMessage
         //: completion:(void(^)(NSError * error))completion;
         monitorAcrossCompletion:(void(^)(NSError * error))completion;


//: - (void)sendMessageReceipt:(NSArray *)messages;
- (void)languageManager:(NSArray *)messages;

//: - (void)addQuickComment:(NIMQuickComment *)comment
- (void)file:(NIMQuickComment *)comment
             //: completion:(void(^)(NSError *error))completion;
             nim:(void(^)(NSError *error))completion;

//: - (void)addQuickComment:(NIMQuickComment *)comment
- (void)size:(NIMQuickComment *)comment
              //: toMessage:(NIMMessage *)toMessage
              titleQuantity:(NIMMessage *)toMessage
             //: completion:(void(^)(NSError *error))completion;
             actionCompletion:(void(^)(NSError *error))completion;

//: - (void)delQuickComment:(NIMQuickComment *)comment
- (void)save:(NIMQuickComment *)comment
          //: targetMessage:(NIMMessage *)message
          speedyWithoutCompletion:(NIMMessage *)message
             //: completion:(void(^)(NSError *error))completion;
             message:(void(^)(NSError *error))completion;


//界面操作接口
//: - (void)addMessages:(NSArray *)messages;
- (void)supplement:(NSArray *)messages;

//: - (void)insertMessages:(NSArray *)messages;
- (void)view:(NSArray *)messages;

//: - (BBBMessageModel *)updateMessage:(NIMMessage *)message;
- (AccumulationCenter *)text:(NIMMessage *)message;

//: - (BBBMessageModel *)deleteMessage:(NIMMessage *)message;
- (AccumulationCenter *)wireMessage:(NIMMessage *)message;

//: - (void)addPinForMessage:(NIMMessage *)message;
- (void)sight:(NIMMessage *)message;

//: - (void)removePinForMessage:(NIMMessage *)message;
- (void)detoxicate:(NIMMessage *)message;

//数据接口
//: - (NSArray *)items;
- (NSArray *)image;

//: - (void)markRead:(BOOL)needMarkDataModel;
- (void)tinkleRead:(BOOL)needMarkDataModel;

//: - (BBBMessageModel *)findMessageModel:(NIMMessage *)message;
- (AccumulationCenter *)agendaItem:(NIMMessage *)message;

//: - (BOOL)shouldHandleReceipt;
- (BOOL)edgeCall;

//: - (void)checkReceipts:(NSArray<NIMMessageReceipt *> *)receipts;
- (void)more:(NSArray<NIMMessageReceipt *> *)receipts;

//: - (void)resetMessages:(void (^)(NSError *error))handler;
- (void)distance:(void (^)(NSError *error))handler;

//: - (void)loadMessages:(void (^)(NSArray *messages, NSError *error))handler;
- (void)imageTextMessages:(void (^)(NSArray *messages, NSError *error))handler;

//: - (void)pullUpMessages:(void(^)(NSArray *messages, NSError *error))handler;
- (void)save:(void(^)(NSArray *messages, NSError *error))handler;

//: - (NSInteger)findMessageIndex:(NIMMessage *)message;
- (NSInteger)socialRank:(NIMMessage *)message;

//: - (BOOL)messageCanBeSelected:(NIMMessage *)message;
- (BOOL)temp:(NIMMessage *)message;

//: - (void)loadMessagePins:(void (^)(NSError *error))handler;
- (void)byPins:(void (^)(NSError *error))handler;

//: - (void)willDisplayMessageModel:(BBBMessageModel *)model;
- (void)canModel:(AccumulationCenter *)model;

//排版接口

//: - (void)resetLayout;
- (void)circle;

//: - (void)changeLayout:(CGFloat)inputHeight;
- (void)viewSize:(CGFloat)inputHeight;

//: - (void)cleanCache;
- (void)maxUser;

//: - (void)pullUp;
- (void)tingFor;

//按钮响应接口
//: - (void)mediaAudioPressed:(BBBMessageModel *)messageModel;
- (void)remove:(AccumulationCenter *)messageModel;

//: - (void)mediaPicturePressed;
- (void)color;

//: - (void)mediaShootPressed;
- (void)foilChange;

//: - (void)mediaLocationPressed;
- (void)array;

//页面状态同步接口

//: - (void)onViewWillAppear;
- (void)viewObjectAppear;

//: - (void)onViewDidDisappear;
- (void)message;

//页面状态切换接口(正常/选择)
//: - (NIMKitSessionState)sessionState;
- (NIMKitSessionState)orientation;

//: - (void)setSessionState:(NIMKitSessionState)sessionState;
- (void)setOrientation:(NIMKitSessionState)sessionState;

- (void)setReferenceMessage:(NIMMessage *)message;

//: @end
@end
