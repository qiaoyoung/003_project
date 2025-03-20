
#import <Foundation/Foundation.h>
typedef struct {
    Byte soldierBuild;
    Byte *viewCollection;
    unsigned int handleRefugee;
    bool shareowner;
	int eigenvalueOfAMatrix;
} EndeavourData;

NSString *StringFromEndeavourData(EndeavourData *data);


//: #A148FF
EndeavourData str_comingBandData = (EndeavourData){205, (Byte []){238, 140, 252, 249, 245, 139, 139, 80}, 7, false, 150};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSettingPushNotifySwitcherCell.m
//  NIM
//
//  Created by chris on 15/6/26.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCKitSwitcherCell.h"
#import "TinkleViewCell.h"
//: #import "CCCCommonTableData.h"
#import "CCCCommonTableData.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"

//: @interface CCCKitSwitcherCell ()
@interface TinkleViewCell ()

//: @end
@end

//: @implementation CCCKitSwitcherCell
@implementation TinkleViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: _switcher = [[UISwitch alloc] initWithFrame:CGRectZero];
        _switcher = [[UISwitch alloc] initWithFrame:CGRectZero];
        //: _switcher.onTintColor = [UIColor colorWithHexString:@"#A148FF"];
        _switcher.onTintColor = [UIColor direction:StringFromEndeavourData(&str_comingBandData)];
        //: [self.contentView addSubview:_switcher];
        [self.contentView addSubview:_switcher];
    }
    //: return self;
    return self;
}


//: - (void)refreshData:(NIMCommonTableRow *)rowData tableView:(UITableView *)tableView{
- (void)text:(ChildMessage *)rowData should_strong:(UITableView *)tableView{
    //: self.textLabel.text = rowData.title;
    self.textLabel.text = rowData.title;
    //: self.detailTextLabel.text = rowData.detailTitle;
    self.detailTextLabel.text = rowData.detailTitle;
    //: NSString *actionName = rowData.cellActionName;
    NSString *actionName = rowData.cellActionName;
    //: [self.switcher setOn:[rowData.extraInfo boolValue] animated:NO];
    [self.switcher setOn:[rowData.extraInfo boolValue] animated:NO];
    //: [self.switcher removeTarget:self.nim_viewController action:NULL forControlEvents:UIControlEventValueChanged];
    [self.switcher removeTarget:self.atWith action:NULL forControlEvents:UIControlEventValueChanged];
    //: if (actionName.length) {
    if (actionName.length) {
        //: SEL sel = NSSelectorFromString(actionName);
        SEL sel = NSSelectorFromString(actionName);
        //: [self.switcher addTarget:tableView.nim_viewController action:sel forControlEvents:UIControlEventValueChanged];
        [self.switcher addTarget:tableView.atWith action:sel forControlEvents:UIControlEventValueChanged];
    }
}




//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.switcher.nim_right = self.nim_width - 15;
    self.switcher.nim_right = self.nim_width - 15;
    //: self.switcher.nim_centerY = self.nim_height * .5f;
    self.switcher.nim_centerY = self.nim_height * .5f;
}

//: @end
@end

Byte *EndeavourDataToByte(EndeavourData *data) {
    if (data->shareowner) return data->viewCollection;
    for (int i = 0; i < data->handleRefugee; i++) {
        data->viewCollection[i] ^= data->soldierBuild;
    }
    data->viewCollection[data->handleRefugee] = 0;
    data->shareowner = true;
	if (data->handleRefugee >= 1) {
		data->eigenvalueOfAMatrix = data->viewCollection[0];
	}
    return data->viewCollection;
}

NSString *StringFromEndeavourData(EndeavourData *data) {
    return [NSString stringWithUTF8String:(char *)EndeavourDataToByte(data)];
}
