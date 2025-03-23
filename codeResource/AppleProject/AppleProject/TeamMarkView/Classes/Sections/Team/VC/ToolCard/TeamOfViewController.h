// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamOfViewController.h
// Indicator
//
//  Created by Netease on 2019/7/16.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "UserCardDataSourceProtocol.h"
#import "UserCardDataSourceProtocol.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef void(^NIMSelectedCompletion)(id <NIMKitSelectCardData> item);
typedef void(^NIMSelectedCompletion)(id <StateLanguage> item);

//: @interface BBBTeamCardSelectedViewController : UIViewController
@interface TeamOfViewController : UIViewController

//: @property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *titleString;

//: @property (nonatomic, strong) NIMSelectedCompletion resultHandle;
@property (nonatomic, strong) NIMSelectedCompletion resultHandle;

//: + (instancetype)instanceWithTitle:(NSString *)title
+ (instancetype)occurrentOf:(NSString *)title
                            //: items:(NSMutableArray <id <NIMKitSelectCardData>> *)items
                            will:(NSMutableArray <id <StateLanguage>> *)items
                           //: result:(NIMSelectedCompletion)result;
                           portion:(NIMSelectedCompletion)result;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END
