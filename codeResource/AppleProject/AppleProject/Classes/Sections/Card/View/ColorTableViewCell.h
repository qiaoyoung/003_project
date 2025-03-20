// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorTableViewCell.h
//  NIM
//
//  Created by chris on 15/3/11.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "CCCCommonTableViewCell.h"
#import "CommonCell.h"

//: typedef NS_ENUM(NSInteger, ColorButtonCellStyle){
typedef NS_ENUM(NSInteger, ColorButtonCellStyle){
    //: ColorButtonCellStyleRed,
    ColorButtonCellStyleRed,
    //: ColorButtonCellStyleBlue,
    ColorButtonCellStyleBlue,
//: };
};

//: @class NTESColorButton;
@class UpControl;

//: @interface NTESColorButtonCell : UITableViewCell<CCCCommonTableViewCell>
@interface ColorTableViewCell : UITableViewCell<CommonCell>

//: @property (nonatomic,strong) NTESColorButton *button;
@property (nonatomic,strong) UpControl *button;

//: @end
@end



//: @interface NTESColorButton : UIButton
@interface UpControl : UIButton

//: @property (nonatomic,assign) ColorButtonCellStyle style;
@property (nonatomic,assign) ColorButtonCellStyle style;

//: @end
@end