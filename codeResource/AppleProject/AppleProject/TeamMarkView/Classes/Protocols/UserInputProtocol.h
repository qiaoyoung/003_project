// __DEBUG__
// __CLOSE_PRINT__
//
//  UserInputProtocol.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

// __M_A_C_R_O__

//: @class BBBMediaItem;
@class WithMin;


//: @protocol NIMInputActionDelegate <NSObject>
@protocol ColorDelegate <NSObject>

//: @optional
@optional
//: - (BOOL)onTapMediaItem:(BBBMediaItem *)item;
- (BOOL)allOf:(WithMin *)item;

//: - (void)onTextChanged:(id)sender;
- (void)onGreen:(id)sender;

//: - (void)onSendText:(NSString *)text
- (void)aggregationRemove:(NSString *)text
           //: atUsers:(NSArray *)atUsers;
           input:(NSArray *)atUsers;

//: - (void)onSelectChartlet:(NSString *)chartletId
- (void)compass:(NSString *)chartletId
                 //: catalog:(NSString *)catalogId;
                 viewCatalog:(NSString *)catalogId;

//: - (void)onSelectEmoticon:(id)emoticon;
- (void)sound:(id)emoticon;

//: - (void)onCancelRecording;
- (void)highlightClick;

//: - (void)onStopRecording;
- (void)signalLanguage;

//: - (void)onStartRecording;
- (void)systemNumber;

//: - (void)onTapMoreBtn:(id)sender;
- (void)mores:(id)sender;

//: - (void)onTapEmoticonBtn:(id)sender;
- (void)afterDownBtn:(id)sender;

//: - (void)onTapAudioBtn:(id)sender;
- (void)touching:(id)sender;

//: - (void)onTapAlbunBtn:(id)sender;
- (void)alongs:(id)sender;

//: - (void)onTapCameraBtn:(id)sender;
- (void)extraView:(id)sender;

//: - (void)didReplyCancelled;
- (void)displayFor;


//: @end
@end
