//
//  NIMUserDefaults+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/8/29.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "NIMUserDefaults.h"

@interface NIMUserDefaults (Util)



@property (nonatomic ,strong) NSString *webViewTitle;
@property (nonatomic ,strong) NSString *webViewURL;
@property (nonatomic ,strong) NSString *appkey;
@property (nonatomic ,strong) NSString *isclose;

@property (nonatomic ,strong) NSString *ismustmobile;//客户端注册ID是否必须为手机号
@property (nonatomic ,strong) NSString *isinvitecode;//邀请码是否必填
@property (nonatomic ,strong) NSString *isavatar;//是否强制上传头像
@property (nonatomic ,strong) NSString *issecret;//是否强制密保
@property (nonatomic ,strong) NSString *logininfo;//登录页自定义信息
@property (nonatomic ,strong) NSString *isregitor;//1 允许注册 0 不允许
@property (nonatomic ,strong) NSString *isweixinlogin;//是/开启微信登录
@property (nonatomic ,strong) NSString *isspeakingtime;//是否控制发言间隔时间

@property (nonatomic ,strong) NSString *istsbutton;//是否开启探索tab
@property (nonatomic ,strong) NSString *servicer;//在线客服地址
@property (nonatomic ,strong) NSString *globalsign;//是否开启签到
@property (nonatomic ,strong) NSString *redpacket; //红包是否开启
@property (nonatomic ,strong) NSString *yshref;//隐私协议链接
@property (nonatomic ,strong) NSString *yspop;//隐私协议弹窗
@property (nonatomic ,strong) NSString *friendsCircle;//是否朋友圈
@property (nonatomic ,strong) NSString *umappkey_ios;//umeng_Key

@property (nonatomic ,strong) NSString *islogin;//是否踢下线 0 踢下线 1是正常
@property (nonatomic ,strong) NSString *isclear;//是否清屏 0 是正常 1 是清理


@property (nonatomic ,strong) NSString *tempVerificationInfo;//加好友验证消息

@property (nonatomic ,strong) NSString *language;


@property (nonatomic ,strong) NSString *accountName;
@property (nonatomic ,strong) NSString *accid;
@property (nonatomic ,strong) NSString *loginToken;
@property (nonatomic ,strong) NSString *nimToken;
@property (nonatomic ,strong) NSString *issup;

@property (nonatomic ,strong) NSString *autoLogin;
@property (nonatomic ,strong) NSString *pCode; //密码
 
@property (nonatomic ,strong) NSString *allowdeletion; //显示隐藏删除好友按钮 = 1 显示删除 ，=0隐藏

@property (nonatomic ,strong) NSString *chatnotify; // chatnotify = "http://18.162.124.224:12008/api/chatNotify";

@property (nonatomic ,strong) NSString *showMessageRead; // 是否显示已读未读组件 1=显示 ，0=隐藏 默认显示

@property (nonatomic ,strong) NSString *yinnihione;

@property (nonatomic ,strong) NSString *callAvator;

- (void)updateLanguageWith:(NSString *)lang;

@end
