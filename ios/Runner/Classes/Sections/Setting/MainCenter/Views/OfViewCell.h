// __DEBUG__
// __CLOSE_PRINT__
//
//  OfViewCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/10.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"
//: #import "NTESUserInfoModel.h"
#import "RefreshSelected.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESMainUserInfoCell : BaseTableViewCell
@interface OfViewCell : CompartmentView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @property (nonatomic ,strong) NTESUserInfoModel *infoModel;
@property (nonatomic ,strong) RefreshSelected *infoModel;
//: @property (nonatomic ,strong) UINavigationController *nav;
@property (nonatomic ,strong) UINavigationController *nav;
//: -(void)reloadWithInformation:(NTESUserInfoModel *)infoModel;
-(void)heritage:(RefreshSelected *)infoModel;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END