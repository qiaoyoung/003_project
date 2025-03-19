//
//  NTESVideolistCollectionViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/6/26.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTESVideolistCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView  *picImg;
@property (nonatomic, strong) UILabel  *labtitle;
@property (nonatomic, strong) UIImageView  *headImg;
@property (nonatomic, strong) UILabel  *labname;

@end

NS_ASSUME_NONNULL_END
