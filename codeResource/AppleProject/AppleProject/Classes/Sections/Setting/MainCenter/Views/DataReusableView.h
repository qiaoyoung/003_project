// __DEBUG__
// __CLOSE_PRINT__
//
//  DataReusableView.h
//  NIM
//
//  Created by Yan Wang on 2024/6/26.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESVideolistCollectionViewCell : UICollectionViewCell
@interface DataReusableView : UICollectionViewCell

//: @property (nonatomic, strong) UIImageView *picImg;
@property (nonatomic, strong) UIImageView *picImg;
//: @property (nonatomic, strong) UILabel *labtitle;
@property (nonatomic, strong) UILabel *labtitle;
//: @property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UIImageView *headImg;
//: @property (nonatomic, strong) UILabel *labname;
@property (nonatomic, strong) UILabel *labname;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END