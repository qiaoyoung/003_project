// __DEBUG__
// __CLOSE_PRINT__
//
//  UIScrollView+From.h
//  NIM
//
//  Created by chris on 16/1/24.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef enum NTESScrollViewDirection {
typedef enum NTESScrollViewDirection {
    //: NTESScrollViewDirectionNone,
    NTESScrollViewDirectionNone,
    //: NTESScrollViewDirectionRight,
    NTESScrollViewDirectionRight,
    //: NTESScrollViewDirectionLeft,
    NTESScrollViewDirectionLeft,
    //: NTESScrollViewDirectionUp,
    NTESScrollViewDirectionUp,
    //: NTESScrollViewDirectionDown,
    NTESScrollViewDirectionDown,
//: } NTESScrollViewDirection;
} NTESScrollViewDirection;


//: @interface UIScrollView (Direction)
@interface UIScrollView (Icon)

//: - (void)startObservingDirection;
- (void)assemblage;
//: - (void)stopObservingDirection;
- (void)show;

//: @property (readonly, nonatomic) NTESScrollViewDirection horizontalScrollingDirection;
@property (readonly, nonatomic) NTESScrollViewDirection horizontalScrollingDirection;
//: @property (readonly, nonatomic) NTESScrollViewDirection verticalScrollingDirection;
@property (readonly, nonatomic) NTESScrollViewDirection verticalScrollingDirection;

//: @end
@end