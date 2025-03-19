//
//  BBBKitKeyboardInfo.m
// AppleProjectKit
//
//  Created by chris on 2017/11/3.
//  Copyright © 2017年 NetEase. All rights reserved.
//

#import "BBBKitKeyboardInfo.h"

NSNotificationName const NIMKitKeyboardWillChangeFrameNotification = @"NIMKitKeyboardWillChangeFrameNotification";
NSNotificationName const NIMKitKeyboardWillHideNotification        = @"NIMKitKeyboardWillHideNotification";

@implementation BBBKitKeyboardInfo

@synthesize keyboardHeight = _keyboardHeight;

+ (instancetype)instance
{
    static BBBKitKeyboardInfo *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BBBKitKeyboardInfo alloc] init];
    });
    return instance;
}


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}


- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    CGRect endFrame   = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _isVisiable = endFrame.origin.y != [UIApplication sharedApplication].windows.firstObject.frame.size.height;
    _keyboardHeight = _isVisiable? endFrame.size.height: 0;
    [[NSNotificationCenter defaultCenter] postNotificationName:NIMKitKeyboardWillChangeFrameNotification object:nil userInfo:notification.userInfo];
}



- (void)keyboardWillHide:(NSNotification *)notification
{
    _isVisiable = NO;
    _keyboardHeight = 0;
    [[NSNotificationCenter defaultCenter] postNotificationName:NIMKitKeyboardWillHideNotification object:nil userInfo:notification.userInfo];
}




@end
