//
//  NTESCardVerificationCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/26.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESCardVerificationCell : UITableViewCell<CCCCommonTableViewCell>
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UITextView *textView;
@end

NS_ASSUME_NONNULL_END
