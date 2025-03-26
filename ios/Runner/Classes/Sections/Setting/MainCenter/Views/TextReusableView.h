// __DEBUG__
// __CLOSE_PRINT__
//
//  TextReusableView.h
//  TZImagePickerController
//
//  Created by 谭真 on 16/1/3.
//  Copyright © 2016年 谭真. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface TZTestCell : UICollectionViewCell
@interface TextReusableView : UICollectionViewCell

//: @property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *imageView;
//: @property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) UIImageView *videoImageView;
//: @property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
//: @property (nonatomic, strong) UILabel *gifLable;
@property (nonatomic, strong) UILabel *gifLable;
//: @property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger row;
//: @property (nonatomic, strong) id asset;
@property (nonatomic, strong) id asset;

//: - (UIView *)snapshotView;
- (UIView *)broadcast;

//: @end
@end