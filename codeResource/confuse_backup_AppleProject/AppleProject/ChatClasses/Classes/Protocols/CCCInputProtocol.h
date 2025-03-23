//
//  CCCInputProtocol.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BBBMediaItem;


@protocol NIMInputActionDelegate <NSObject>

@optional
- (BOOL)onTapMediaItem:(BBBMediaItem *)item;

- (void)onTextChanged:(id)sender;

- (void)onSendText:(NSString *)text
           atUsers:(NSArray *)atUsers;

- (void)onSelectChartlet:(NSString *)chartletId
                 catalog:(NSString *)catalogId;

- (void)onSelectEmoticon:(id)emoticon;

- (void)onCancelRecording;

- (void)onStopRecording;

- (void)onStartRecording;

- (void)onTapMoreBtn:(id)sender;

- (void)onTapEmoticonBtn:(id)sender;

- (void)onTapAudioBtn:(id)sender;

- (void)onTapAlbunBtn:(id)sender;

- (void)onTapCameraBtn:(id)sender;

- (void)didReplyCancelled;


@end


