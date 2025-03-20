// __DEBUG__
// __CLOSE_PRINT__
//
//  OpenViewController.h
//  NIM
//
//  Created by chris on 15/4/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "NTESAVMoivePlayerController.h"
#import "ShowController.h"

//: @interface NTESVideoViewItem : NSObject
@interface TeamItem : NSObject

//: @property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSString *itemId;//message Id

//: @property (nonatomic,copy) NSString *path;
@property (nonatomic,copy) NSString *path;

//: @property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *url;

//: @property (nonatomic,strong) NIMSession *session;
@property (nonatomic,strong) NIMSession *session;

//: @end
@end

//: @interface NTESVideoViewController : UIViewController
@interface OpenViewController : UIViewController

//: - (instancetype)initWithVideoViewItem:(NTESVideoViewItem *)item;
- (instancetype)initWithView:(TeamItem *)item;

//: @property (nonatomic, readonly) NTESAVMoivePlayerController *avPlayer;
@property (nonatomic, readonly) ShowController *avPlayer;

//: @end
@end