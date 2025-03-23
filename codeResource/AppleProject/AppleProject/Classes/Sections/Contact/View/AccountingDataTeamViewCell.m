// __DEBUG__
// __CLOSE_PRINT__
//
//  AccountingDataTeamViewCell.m
//  NIM
//
//  Created by chris on 2017/4/7.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactDataCell.h"
#import "AccountingDataTeamViewCell.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"

//: @implementation NTESContactDataCell
@implementation AccountingDataTeamViewCell

//: - (void)refreshUser:(id<NIMGroupMemberProtocol>)member
- (void)lastName:(id<UpProtocol>)member
{
    //: [super refreshUser:member];
    [super lastName:member];
    //: NSString *state = [NTESSessionUtil onlineState:self.memberId detail:NO];
    NSString *state = [ChildMark nameDetail:self.memberId detail:NO];
    //: NSString *title = @"";
    NSString *title = @"";
//    if (state.length)
//    {
//        title = [NSString stringWithFormat:@"[%@] %@",state,member.showName];
//    }
//    else
//    {
        //: title = [NSString stringWithFormat:@"%@",member.showName];
        title = [NSString stringWithFormat:@"%@",member.showTitle];
//    }

    //: self.textLabel.text = title;
    self.textLabel.text = title;
}


//: @end
@end