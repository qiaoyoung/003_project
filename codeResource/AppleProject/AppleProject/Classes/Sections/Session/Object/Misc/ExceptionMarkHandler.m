// __DEBUG__
// __CLOSE_PRINT__
//
//  ExceptionMarkHandler.m
//  NIM
//
//  Created by He on 2019/10/29.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESDbExceptionHandler.h"
#import "ExceptionMarkHandler.h"
//: #import <Toast/UIView+Toast.h>
#import <Toast/UIView+Toast.h>

//: @interface NTESDbExceptionHandler ()
@interface ExceptionMarkHandler ()

//: @property (nonatomic,assign) NSUInteger count;
@property (nonatomic,assign) NSUInteger count;

//: @end
@end

//: @implementation NTESDbExceptionHandler
@implementation ExceptionMarkHandler

//: - (void)handleException:(NIMDatabaseException *)exception
- (void)handleException:(NIMDatabaseException *)exception
{
    //: self.count ++;
    self.count ++;

//    NSString * codeType = nil;
//    switch (exception.exception) {
//
//        case NIMDatabaseExceptionTypeBadDb:
//            codeType = @"数据库损坏";
//            break;
//        default:
//            break;
//        }
//
//    
//    NSString * msg = [NSString stringWithFormat:@"总次数%zu\n错误:%@\n信息:%@\n路径:%@\n",self.count, codeType,exception.message, exception.databasePath];
//    NSLog(@"handleException: %@",msg);
//    [[UIApplication sharedApplication].windows.firstObject hideToasts];
//    [[UIApplication sharedApplication].windows.firstObject makeToast:msg
//                                                  duration:3
//                                                  position:CSToastPositionCenter];
}

//: @end
@end