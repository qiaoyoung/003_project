
#import <Foundation/Foundation.h>

NSString *StringFromRecordData(Byte *data);


//: NTESContactDataItem
Byte str_kickTitle[] = {40, 19, 55, 5, 150, 133, 139, 124, 138, 122, 166, 165, 171, 152, 154, 171, 123, 152, 171, 152, 128, 171, 156, 164, 74};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ContactAt.m
//  NIM
//
//  Created by chris on 15/9/21.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactDataMember.h"
#import "ContactAt.h"
//: #import "NTESSpellingCenter.h"
#import "ScoopView.h"

//: @implementation NTESContactDataMember
@implementation ContactAt

//: - (CGFloat)uiHeight{
- (CGFloat)session{
    //: return 60;
    return 60;
}

//userId和Vcname必有一个有值，根据有值的状态push进不同的页面

- (NSString *)vcName{
    //: return nil;
    return nil;
}

//: - (NSString *)reuseId{
- (NSString *)disable{
    //: return @"NTESContactDataItem";
    return StringFromRecordData(str_kickTitle);
}

//: - (NSString *)cellName{
- (NSString *)recordingOf{
    //: return @"NTESContactDataCell";
    return @"AccountingDataTeamViewCell";
}

//: - (NSString *)badge{
- (NSString *)input{
    //: return @"";
    return @"";
}

//: - (NSString *)groupTitle {
- (NSString *)groupTitle {
    //: NSString *title = [[NTESSpellingCenter sharedCenter] firstLetter:self.info.showName].capitalizedString;
    NSString *title = [[ScoopView breadbox] sessionIn:self.info.showName].capitalizedString;
    //: unichar character = [title characterAtIndex:0];
    unichar character = [title characterAtIndex:0];
    //: if (character >= 'A' && character <= 'Z') {
    if (character >= 'A' && character <= 'Z') {
        //: return title;
        return title;
    //: }else{
    }else{
        //: return @"#";
        return @"#";
    }
}

- (NSString *)userId{
    //: return self.info.infoId;
    return self.info.infoId;
}

//: - (UIImage *)icon{
- (UIImage *)length{
    //: return self.info.avatarImage;
    return self.info.avatarImage;
}

//: - (NSString *)avatarUrl{
- (NSString *)end{
    //: return self.info.avatarUrlString;
    return self.info.avatarUrlString;
}

//: - (NSString *)memberId{
- (NSString *)memberId{
    //: return self.info.infoId;
    return self.info.infoId;
}

//: - (NSString *)showName{
- (NSString *)showTitle{
    //: return self.info.showName;
    return self.info.showName;
}

//: - (BOOL)showAccessoryView{
- (BOOL)viewDisable{
    //: return NO;
    return NO;
}

- (id)sortKey {
    //: return [[NTESSpellingCenter sharedCenter] spellingForString:self.info.showName].shortSpelling;
    return [[ScoopView breadbox] unwished:self.info.showName].shortSpelling;
}

//: - (BOOL)isEqual:(id)object{
- (BOOL)isEqual:(id)object{
    //: if (![object isKindOfClass:[self class]]) {
    if (![object isKindOfClass:[self class]]) {
        //: return NO;
        return NO;
    }
    //: return [self.info.infoId isEqualToString:[[object info] infoId]];
    return [self.info.infoId isEqualToString:[[object info] infoId]];
}


//: @end
@end

Byte * RecordDataToCache(Byte *data) {
    int byTextSend = data[0];
    int indexMessage = data[1];
    Byte imageTextTable = data[2];
    int need = data[3];
    if (!byTextSend) return data + need;
    for (int i = need; i < need + indexMessage; i++) {
        int value = data[i] - imageTextTable;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[need + indexMessage] = 0;
    return data + need;
}

NSString *StringFromRecordData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)RecordDataToCache(data)];
}
