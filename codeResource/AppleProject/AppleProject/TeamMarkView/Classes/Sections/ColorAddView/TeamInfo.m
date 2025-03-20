// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamInfo.m
// Indicator
//
//  Created by chris on 2017/11/3.
//  Copyright © 2017年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBKitKeyboardInfo.h"
#import "TeamInfo.h"

//: NSNotificationName const NIMKitKeyboardWillChangeFrameNotification = @"NIMKitKeyboardWillChangeFrameNotification";
NSNotificationName const k_contextTitle = @"NIMKitKeyboardWillChangeFrameNotification";
//: NSNotificationName const NIMKitKeyboardWillHideNotification = @"NIMKitKeyboardWillHideNotification";
NSNotificationName const k_characterName = @"NIMKitKeyboardWillHideNotification";

//: @implementation BBBKitKeyboardInfo
@implementation TeamInfo

//: @synthesize keyboardHeight = _keyboardHeight;
@synthesize keyboardHeight = _keyboardHeight;

//: + (instancetype)instance
+ (instancetype)margin
{
    //: static BBBKitKeyboardInfo *instance;
    static TeamInfo *instance;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[BBBKitKeyboardInfo alloc] init];
        instance = [[TeamInfo alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}


//: - (instancetype)init
- (instancetype)init
{
    //: self = [super init];
    self = [super init];
    //: if (self)
    if (self)
    {
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dates:) name:UIKeyboardWillChangeFrameNotification object:nil];
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessions:) name:UIKeyboardWillHideNotification object:nil];
    }
    //: return self;
    return self;
}


//: - (void)keyboardWillChangeFrame:(NSNotification *)notification
- (void)dates:(NSNotification *)notification
{
    //: NSDictionary *userInfo = notification.userInfo;
    NSDictionary *userInfo = notification.userInfo;
    //: CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //: _isVisiable = endFrame.origin.y != [UIApplication sharedApplication].windows.firstObject.frame.size.height;
    _isVisiable = endFrame.origin.y != [UIApplication sharedApplication].windows.firstObject.frame.size.height;
    //: _keyboardHeight = _isVisiable? endFrame.size.height: 0;
    _keyboardHeight = _isVisiable? endFrame.size.height: 0;
    //: [[NSNotificationCenter defaultCenter] postNotificationName:NIMKitKeyboardWillChangeFrameNotification object:nil userInfo:notification.userInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:k_contextTitle object:nil userInfo:notification.userInfo];
}



//: - (void)keyboardWillHide:(NSNotification *)notification
- (void)sessions:(NSNotification *)notification
{
    //: _isVisiable = NO;
    _isVisiable = NO;
    //: _keyboardHeight = 0;
    _keyboardHeight = 0;
    //: [[NSNotificationCenter defaultCenter] postNotificationName:NIMKitKeyboardWillHideNotification object:nil userInfo:notification.userInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:k_characterName object:nil userInfo:notification.userInfo];
}




//: @end
@end