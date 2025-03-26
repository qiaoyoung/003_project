
#import <Foundation/Foundation.h>

NSString *StringFromSculptThreadData(Byte *data);


//: time_ntes
Byte str_badlySpeciallyTitle[] = {25, 9, 3, 115, 101, 116, 110, 95, 101, 109, 105, 116, 71};


//: _ntes
Byte str_recentSharedSendValue[] = {62, 5, 12, 185, 235, 67, 50, 220, 231, 231, 49, 199, 115, 101, 116, 110, 95, 132};

// __DEBUG__
// __CLOSE_PRINT__
//
//  SignalCellFactory.m
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMessageCellFactory.h"
#import "SignalCellFactory.h"

//: @implementation NTESMessageCellFactory
@implementation SignalCellFactory

//: - (NTESMergeMessageCell *)ntesCellInTable:(UITableView*)tableView
- (FiveMessageCell *)ofImport:(UITableView*)tableView
                         //: forMessageMode:(BBBMessageModel *)model {
                         mode:(AccumulationCenter *)model {
    //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
    id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
    //: NSString *identity = [[layoutConfig cellContent:model] stringByAppendingString:@"_ntes"];
    NSString *identity = [[layoutConfig total:model] stringByAppendingString:StringFromSculptThreadData(str_recentSharedSendValue)];
    //: CCCMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    StatusViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    //: if (!cell) {
    if (!cell) {
        //: NSString *clz = @"NTESMergeMessageCell";
        NSString *clz = @"FiveMessageCell";
        //: [tableView registerClass:NSClassFromString(clz) forCellReuseIdentifier:identity];
        [tableView registerClass:NSClassFromString(clz) forCellReuseIdentifier:identity];
        //: cell = [tableView dequeueReusableCellWithIdentifier:identity];
        cell = [tableView dequeueReusableCellWithIdentifier:identity];
    }
    //: return (NTESMergeMessageCell *)cell;
    return (FiveMessageCell *)cell;
}

//: - (NTESTimestampCell *)ntesCellInTable:(UITableView *)tableView
- (InformationTimestampCell *)name:(UITableView *)tableView
                            //: forTimeModel:(BBBTimestampModel *)model {
                            buttonDoing:(FromTap *)model {
    //: NSString *identity = @"time_ntes";
    NSString *identity = StringFromSculptThreadData(str_badlySpeciallyTitle);
    //: NTESTimestampCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    InformationTimestampCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    //: if (!cell) {
    if (!cell) {
        //: NSString *clz = @"NTESTimestampCell";
        NSString *clz = @"InformationTimestampCell";
        //: [tableView registerClass:NSClassFromString(clz) forCellReuseIdentifier:identity];
        [tableView registerClass:NSClassFromString(clz) forCellReuseIdentifier:identity];
        //: cell = [tableView dequeueReusableCellWithIdentifier:identity];
        cell = [tableView dequeueReusableCellWithIdentifier:identity];
    }
    //: [cell refreshData:model];
    [cell queryed:model];
    //: return (NTESTimestampCell *)cell;
    return (InformationTimestampCell *)cell;
}

//: @end
@end

Byte * SculptThreadDataToCache(Byte *data) {
    int speciallyValueAmble = data[0];
    int militaryQuarters = data[1];
    int keyFrom = data[2];
    if (!speciallyValueAmble) return data + keyFrom;
    for (int i = 0; i < militaryQuarters / 2; i++) {
        int begin = keyFrom + i;
        int end = keyFrom + militaryQuarters - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[keyFrom + militaryQuarters] = 0;
    return data + keyFrom;
}

NSString *StringFromSculptThreadData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SculptThreadDataToCache(data)];
}  
