// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionTableDelegate.h
// Indicator
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "UserSessionConfigurateProtocol.h"
#import "UserSessionConfigurateProtocol.h"
//: #import "UserMessageCellProtocol.h"
#import "UserMessageCellProtocol.h"

//: @interface CCCSessionTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>
@interface AddTable : NSObject<UITableViewDelegate,UITableViewDataSource>

//: @property (nonatomic,weak) id<NIMSessionInteractor> interactor;
@property (nonatomic,weak) id<WriterSContentSumeractor> interactor;

//: @property (nonatomic,weak) id<CCCMessageCellDelegate> delegate;
@property (nonatomic,weak) id<StateAddLight> delegate;

//: @end
@end
