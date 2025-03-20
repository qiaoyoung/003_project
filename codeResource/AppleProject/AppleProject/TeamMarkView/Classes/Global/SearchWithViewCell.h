// __DEBUG__
// __CLOSE_PRINT__
//
//  SearchWithViewCell.h
//  NIM
//
//  Created by chris on 15/3/11.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef NS_ENUM(NSInteger, CCCKitColorButtonCellStyle){
typedef NS_ENUM(NSInteger, CCCKitColorButtonCellStyle){
    //: CCCKitColorButtonCellStyleRed,
    CCCKitColorButtonCellStyleRed,
    //: CCCKitColorButtonCellStyleBlue,
    CCCKitColorButtonCellStyleBlue,
//: };
};

//: @class NIMKitColorButton;
@class StatusButton;

//: @interface CCCKitColorButtonCell : UITableViewCell
@interface SearchWithViewCell : UITableViewCell

//: @property (nonatomic,strong) NIMKitColorButton *button;
@property (nonatomic,strong) StatusButton *button;

//: @end
@end



//: @interface NIMKitColorButton : UIButton
@interface StatusButton : UIButton

//: @property (nonatomic,assign) CCCKitColorButtonCellStyle style;
@property (nonatomic,assign) CCCKitColorButtonCellStyle style;

//: @end
@end