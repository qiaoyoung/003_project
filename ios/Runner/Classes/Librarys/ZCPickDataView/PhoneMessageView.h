// __DEBUG__
// __CLOSE_PRINT__
//
//  PhoneMessageView.h
//  HuaxiajiaboApp
//
//  Created by HuamoMac on 15/10/10.
//  Copyright © 2015年 HuaMo. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @protocol HMDataPickerDelegate ;
@protocol ViewDelegate ;

//: @interface HMDataPicker : UIView{
@interface PhoneMessageView : UIView{

}

//: - (id)initWithDelegate:(id<HMDataPickerDelegate>)delegate dataDict:(NSDictionary *)dataDict selectedDict:(NSDictionary *)selectedDict jsonNode:(NSString *)jsonNode;
- (id)initWithGrapplingIron:(id<ViewDelegate>)delegate ignitionKey:(NSDictionary *)dataDict fileAllocationTable:(NSDictionary *)selectedDict overInit:(NSString *)jsonNode;

//: - (void)show;
- (void)color;

//: @end
@end


//: @protocol HMDataPickerDelegate <NSObject>
@protocol ViewDelegate <NSObject>

//: - (void)dataPicker:(HMDataPicker *)dataPicker selectedDict:(NSDictionary *)selectedDict;
- (void)title:(PhoneMessageView *)dataPicker length:(NSDictionary *)selectedDict;

//: @end
@end