//
//  NIMSessionTableDelegate.h
// AppleProjectKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCSessionConfigurateProtocol.h"
#import "CCCMessageCellProtocol.h"

@interface CCCSessionTableAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) id<NIMSessionInteractor> interactor;

@property (nonatomic,weak) id<CCCMessageCellDelegate> delegate;

@end
