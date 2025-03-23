//
//  NTESContactTableHeader.h
//  NIM
//
//  Created by 彭爽 on 2021/9/27.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTESContactTableHeader : UIView
@property (nonatomic ,strong) UILabel *titleLabel;
@end

@interface NTESContactTableHeaderGroup : UIView
@property (nonatomic ,weak) id delegate;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UIImageView *arrowImageView;
@property (nonatomic ,assign) NSInteger section;
@end


@protocol NTESContactTableHeaderGroupDelegate <NSObject>

-(void)headerClickWith:(NSInteger)section;

@end


NS_ASSUME_NONNULL_END
