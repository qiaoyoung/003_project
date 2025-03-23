//
//  NTESMainUserInfoCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "NTESUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NTESMainUserInfoCell : BaseTableViewCell
@property (nonatomic ,weak) id delegate;
@property (nonatomic ,strong) NTESUserInfoModel *infoModel;
@property (nonatomic ,strong) UINavigationController *nav;
-(void)reloadWithInformation:(NTESUserInfoModel *)infoModel;
@end

NS_ASSUME_NONNULL_END
