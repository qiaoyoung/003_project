//
//  NIMListCollectionCell.h
// AppleProjectKit
//
//  Created by He on 2020/4/13.
//  Copyright © 2020 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NIMQuickComment;
@class BBBMessageModel;
NS_ASSUME_NONNULL_BEGIN

@interface CCCQuickCommentCell : UICollectionViewCell

- (void)refreshWithData:(NSArray *)comment model:(BBBMessageModel *)data;

@end

NS_ASSUME_NONNULL_END
