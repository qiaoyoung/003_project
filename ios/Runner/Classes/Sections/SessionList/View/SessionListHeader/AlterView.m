
#import <Foundation/Foundation.h>

NSString *StringFromCommonData(Byte *data);


//: 正在使用密聊未知版本
Byte str_cornerFromData[] = {17, 30, 35, 13, 89, 180, 181, 254, 19, 72, 92, 3, 29, 9, 208, 198, 8, 191, 203, 7, 224, 226, 10, 183, 203, 8, 210, 169, 11, 164, 173, 9, 191, 205, 10, 194, 200, 10, 172, 171, 9, 191, 207, 38};


//: 正在使用密聊
Byte str_clientThatChangeTitle[] = {20, 18, 88, 11, 122, 107, 106, 92, 240, 249, 204, 62, 5, 251, 61, 244, 0, 60, 21, 23, 63, 236, 0, 61, 7, 222, 64, 217, 226, 240};


//: 正在使用密聊未知版本 (%@)
Byte str_fromTableTitle[] = {43, 35, 7, 6, 189, 26, 237, 180, 170, 236, 163, 175, 235, 196, 198, 238, 155, 175, 236, 182, 141, 239, 136, 145, 237, 163, 177, 238, 166, 172, 238, 144, 143, 237, 163, 179, 39, 47, 44, 71, 48, 198};


//: 当前网络不可用
Byte str_kickText[] = {53, 21, 52, 7, 190, 209, 172, 25, 241, 199, 25, 189, 193, 27, 241, 197, 27, 239, 208, 24, 236, 193, 25, 195, 227, 27, 200, 220, 237};


//: 网络正在切换,识别中....
Byte str_statusLinkName[] = {54, 32, 11, 5, 158, 242, 200, 156, 242, 198, 167, 241, 184, 174, 240, 167, 179, 240, 147, 146, 241, 152, 173, 55, 243, 186, 145, 240, 147, 182, 239, 195, 184, 57, 57, 57, 57, 224};


//: 当前网络不可用，请检查网络设置
Byte str_numberViewData[] = {38, 45, 81, 8, 5, 53, 158, 252, 54, 14, 228, 54, 218, 222, 56, 14, 226, 56, 12, 237, 53, 9, 222, 54, 224, 0, 56, 229, 249, 64, 13, 221, 57, 0, 8, 55, 244, 209, 55, 240, 246, 56, 14, 226, 56, 12, 237, 57, 255, 15, 56, 14, 255, 39};


//: 登录失败
Byte str_sizeKeyData[] = {40, 12, 88, 9, 81, 75, 115, 202, 81, 63, 241, 19, 61, 21, 237, 61, 252, 9, 64, 12, 253, 168};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSessionListHeader.m
//  NIM
//
//  Created by chris on 15/3/23.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESListHeader.h"
#import "AlterView.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "Reachability.h"
#import "Reachability.h"
//: #import "NTESClientUtil.h"
#import "LineSize.h"

//: @interface NTESListHeader()
@interface AlterView()

//: @end
@end


//: @implementation NTESListHeader
@implementation AlterView

//: - (void)refreshWithType:(NTESListHeaderType)type value:(id)value{
- (void)changeToIcon:(NTESListHeaderType)type voice:(id)value{
    //: switch (type) {
    switch (type) {
        //: case ListHeaderTypeCommonText:
        case ListHeaderTypeCommonText:
            //: [self refreshWithCommonText:value];
            [self broadcastAlbum:value];
            //: break;
            break;
        //: case ListHeaderTypeNetStauts:
        case ListHeaderTypeNetStauts:
            //: [self refreshWithNetStatus:[value integerValue]];
            [self linkStatus:[value integerValue]];
            //: break;
            break;
        //: case ListHeaderTypeLoginClients:
        case ListHeaderTypeLoginClients:
            //: [self refreshWithClients:value];
            [self smart:value];
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: [self sizeToFit];
    [self sizeToFit];
}


//: - (CGSize)sizeThatFits:(CGSize)size{
- (CGSize)sizeThatFits:(CGSize)size{
    //: CGFloat height = 0;
    CGFloat height = 0;
    //: for (UIView *subView in self.subviews) {
    for (UIView *subView in self.subviews) {
        //: [subView sizeToFit];
        [subView sizeToFit];
        //: height += subView.height;
        height += subView.height;
    }
    //: return CGSizeMake(self.width,height);
    return CGSizeMake(self.width,height);
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat top = 0;
    CGFloat top = 0;
    //: for (UIView *subView in self.subviews) {
    for (UIView *subView in self.subviews) {
        //: subView.top = top;
        subView.top = top;
        //: top = top + subView.height;
        top = top + subView.height;
        //: subView.centerX = self.width * .5f;
        subView.centerX = self.width * .5f;
    }
}


//: #pragma mark - Private
#pragma mark - Private
//: - (void)refreshWithClients:(NSArray *)clients{
- (void)smart:(NSArray *)clients{
    //: NSString *text = nil;
    NSString *text = nil;
    //: if (clients.count) {
    if (clients.count) {
        //目前的踢人逻辑是web和pc不能共存，移动端不能共存，所以这里取第一个显示就可以了
        //: NIMLoginClient *client = clients.firstObject;
        NIMLoginClient *client = clients.firstObject;
        //: NSString *name = [NTESClientUtil clientName:client.type];
        NSString *name = [LineSize randomStickText:client.type];

        //: if (client.customClientType != 0) {
        if (client.customClientType != 0) {
            //: text = name.length? [NSString stringWithFormat:@"%@ %@（%@）",
            text = name.length? [NSString stringWithFormat:@"%@ %@（%@）",
                                 //: @"正在使用密聊".ntes_localized,
                                 StringFromCommonData(str_clientThatChangeTitle).language,
                                 //: name, @(client.customClientType)] : [NSString stringWithFormat:@"正在使用密聊未知版本 (%@)".ntes_localized, @(client.customClientType)];
                                 name, @(client.customClientType)] : [NSString stringWithFormat:StringFromCommonData(str_fromTableTitle).language, @(client.customClientType)];
        //: } else {
        } else {
            //: text = name.length? [NSString stringWithFormat:@"%@ %@",
            text = name.length? [NSString stringWithFormat:@"%@ %@",
                                 //: @"正在使用密聊".ntes_localized,
                                 StringFromCommonData(str_clientThatChangeTitle).language,
                                 //: name] : @"正在使用密聊未知版本".ntes_localized;
                                 name] : StringFromCommonData(str_cornerFromData).language;
        }

    }
    //: [self addRow:ListHeaderTypeLoginClients content:text viewClassName:@"NTESMutiClientsHeaderView"];
    [self should:ListHeaderTypeLoginClients length:text status_strong:@"TeamView"];
}


//: - (void)refreshWithNetStatus:(NIMLoginStep)step{
- (void)linkStatus:(NIMLoginStep)step{
    //: NSString *text = nil;
    NSString *text = nil;
    //: switch (step) {
    switch (step) {
        //: case NIMLoginStepLinkFailed:
        case NIMLoginStepLinkFailed:
        //: case NIMLoginStepLoseConnection:
        case NIMLoginStepLoseConnection:
            //: text = @"当前网络不可用，请检查网络设置".ntes_localized;
            text = StringFromCommonData(str_numberViewData).language;
            //: break;
            break;
        //: case NIMLoginStepLoginFailed:
        case NIMLoginStepLoginFailed:
            //: text = @"登录失败".ntes_localized;
            text = StringFromCommonData(str_sizeKeyData).language;
            //: break;
            break;
        //: case NIMLoginStepNetChanged:
        case NIMLoginStepNetChanged:
        {
            //: if ([[Reachability reachabilityForInternetConnection] isReachable])
            if ([[Reachability reachabilityForInternetConnection] isReachable])
            {
                //: text = @"网络正在切换,识别中....".ntes_localized;
                text = StringFromCommonData(str_statusLinkName).language;
            }
            //: else
            else
            {
                //: text = @"当前网络不可用".ntes_localized;
                text = StringFromCommonData(str_kickText).language;
            }
        }
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: [self addRow:ListHeaderTypeNetStauts content:text viewClassName:@"NTESTextHeaderView"];
    [self should:ListHeaderTypeNetStauts length:text status_strong:@"SightControl"];
}

//: - (void)refreshWithCommonText:(NSString *)text{
- (void)broadcastAlbum:(NSString *)text{
    //: [self addRow:ListHeaderTypeCommonText content:text viewClassName:@"NTESTextHeaderView"];
    [self should:ListHeaderTypeCommonText length:text status_strong:@"SightControl"];
}


//参数viewClassName的Class 必须是UIControl的子类并实现<NTESSessionListHeaderView>协议
//: - (void)addRow:(NTESListHeaderType)type content:(NSString *)content viewClassName:(NSString *)viewClassName{
- (void)should:(NTESListHeaderType)type length:(NSString *)content status_strong:(NSString *)viewClassName{
    //: UIControl<NTESListHeaderView> *rowView = (UIControl<NTESListHeaderView> *)[self viewWithTag:type];
    UIControl<CenterView> *rowView = (UIControl<CenterView> *)[self viewWithTag:type];
    //: if ([content length])
    if ([content length])
    {
        //: if (!rowView) {
        if (!rowView) {
            //: Class clazz = NSClassFromString(viewClassName);
            Class clazz = NSClassFromString(viewClassName);
            //: rowView = [[clazz alloc] initWithFrame:CGRectMake(0, 0, self.width, 0)];
            rowView = [[clazz alloc] initWithFrame:CGRectMake(0, 0, self.width, 0)];
            //: rowView.backgroundColor = [self fillBackgroundColor:type];
            rowView.backgroundColor = [self uncolored:type];
            //: __block NSInteger insert = self.subviews.count;
            __block NSInteger insert = self.subviews.count;
            //: [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                //: UIView *view = obj;
                UIView *view = obj;
                //: if (view.tag > type) {
                if (view.tag > type) {
                    //: insert = idx;
                    insert = idx;
                    //: *stop = YES;
                    *stop = YES;
                }
            //: }];
            }];
            //: rowView.tag = type;
            rowView.tag = type;
            //: [self insertSubview:rowView atIndex:insert];
            [self insertSubview:rowView atIndex:insert];
            //: [rowView addTarget:self action:@selector(didSelectRow:) forControlEvents:UIControlEventTouchUpInside];
            [rowView addTarget:self action:@selector(overQuestion:) forControlEvents:UIControlEventTouchUpInside];
        }
        //: [rowView setContentText:content];
        [rowView setRecentIndex:content];
    }
    //: else
    else
    {
        //: [rowView removeFromSuperview];
        [rowView removeFromSuperview];
    }
}


//: - (void)didSelectRow:(id)sender{
- (void)overQuestion:(id)sender{
    //: UIControl *view = sender;
    UIControl *view = sender;
    //: if ([self.delegate respondsToSelector:@selector(didSelectRowType:)]) {
    if ([self.delegate respondsToSelector:@selector(barInput:)]) {
        //: [self.delegate didSelectRowType:view.tag];
        [self.delegate barInput:view.tag];
    }
}


//: - (UIColor *)fillBackgroundColor:(NTESListHeaderType)type{
- (UIColor *)uncolored:(NTESListHeaderType)type{
    //: NSDictionary *dict = @{
    NSDictionary *dict = @{
                           //: @(ListHeaderTypeNetStauts) : [UIColor colorWithRed:((float)((0xFFE3E3 & 0xFF0000) >> 16))/255.0 green:((float)((0xFFE3E3 & 0x00FF00) >> 8))/255.0 blue:((float)(0xFFE3E3 & 0x0000FF))/255.0 alpha:1.0],
                           @(ListHeaderTypeNetStauts) : [UIColor colorWithRed:((float)((0xFFE3E3 & 0xFF0000) >> 16))/255.0 green:((float)((0xFFE3E3 & 0x00FF00) >> 8))/255.0 blue:((float)(0xFFE3E3 & 0x0000FF))/255.0 alpha:1.0],
                           //: @(ListHeaderTypeCommonText) : [UIColor colorWithRed:((float)((0xff6347 & 0xFF0000) >> 16))/255.0 green:((float)((0xff6347 & 0x00FF00) >> 8))/255.0 blue:((float)(0xff6347 & 0x0000FF))/255.0 alpha:1.0],
                           @(ListHeaderTypeCommonText) : [UIColor colorWithRed:((float)((0xff6347 & 0xFF0000) >> 16))/255.0 green:((float)((0xff6347 & 0x00FF00) >> 8))/255.0 blue:((float)(0xff6347 & 0x0000FF))/255.0 alpha:1.0],
                           //: @(ListHeaderTypeLoginClients) : [UIColor colorWithRed:((float)((0xff6347 & 0xFF0000) >> 16))/255.0 green:((float)((0xff6347 & 0x00FF00) >> 8))/255.0 blue:((float)(0xff6347 & 0x0000FF))/255.0 alpha:1.0]
                           @(ListHeaderTypeLoginClients) : [UIColor colorWithRed:((float)((0xff6347 & 0xFF0000) >> 16))/255.0 green:((float)((0xff6347 & 0x00FF00) >> 8))/255.0 blue:((float)(0xff6347 & 0x0000FF))/255.0 alpha:1.0]
                           //: };
                           };
    //: return dict[@(type)];
    return dict[@(type)];
}

//: @end
@end

Byte * CommonDataToCache(Byte *data) {
    int sendDate = data[0];
    int tingDateChange = data[1];
    Byte withKey = data[2];
    int fileMedia = data[3];
    if (!sendDate) return data + fileMedia;
    for (int i = fileMedia; i < fileMedia + tingDateChange; i++) {
        int value = data[i] - withKey;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[fileMedia + tingDateChange] = 0;
    return data + fileMedia;
}

NSString *StringFromCommonData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)CommonDataToCache(data)];
}
