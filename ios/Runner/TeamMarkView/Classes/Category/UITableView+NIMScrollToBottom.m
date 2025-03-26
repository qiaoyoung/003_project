// __DEBUG__
// __CLOSE_PRINT__
//
//  UITableView+NTESScrollToBottom.m
//  NIMDemo
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UITableView+NIMScrollToBottom.h"
#import "UITableView+NIMScrollToBottom.h"

//: @implementation UITableView (AppleProjectKit)
@implementation UITableView (Indicator)

//: - (void)nim_scrollToBottom:(BOOL)animation
- (void)valueVoice:(BOOL)animation
{
    //: dispatch_after(dispatch_time((0ull), (int64_t)(0.1 * 1000000000ull)), dispatch_get_main_queue(), ^{
    dispatch_after(dispatch_time((0ull), (int64_t)(0.1 * 1000000000ull)), dispatch_get_main_queue(), ^{
        //: NSInteger row = [self numberOfRowsInSection:0] - 1;
        NSInteger row = [self numberOfRowsInSection:0] - 1;
        //: if (row > 0)
        if (row > 0)
        {
            //: NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            //: [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animation];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animation];
        }
    //: });
    });
}


//: @end
@end