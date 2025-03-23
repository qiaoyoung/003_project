//
//  CCCKitColorButtonCell.h
//  NIM
//
//  Created by chris on 15/3/11.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CCCKitColorButtonCellStyle){
    CCCKitColorButtonCellStyleRed,
    CCCKitColorButtonCellStyleBlue,
};

@class NIMKitColorButton;

@interface CCCKitColorButtonCell : UITableViewCell

@property (nonatomic,strong) NIMKitColorButton *button;

@end



@interface NIMKitColorButton : UIButton

@property (nonatomic,assign) CCCKitColorButtonCellStyle style;

@end
