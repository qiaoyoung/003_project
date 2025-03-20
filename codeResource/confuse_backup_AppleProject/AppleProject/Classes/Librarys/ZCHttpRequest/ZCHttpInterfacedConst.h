//
//  ZCHttpInterfacedConst.h
//  NIM
//
//  Created by 田玉龙 on 2022/7/30.
//  Copyright © 2022 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCConfig.h"


/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever 0//开发环境
#define ProductSever 1//生产环境

UIKIT_EXTERN NSString * RestApi(NSString *api);

UIKIT_EXTERN NSString *const kToken;/** Touken前缀*/

UIKIT_EXTERN NSString *const iphone_md5_key;/** 加密密钥*/

UIKIT_EXTERN NSString *const wss_msg_prefix;/** 即时聊天*/


#pragma mark -配置

//上传图片
#define Server_upload_image          [NSString stringWithFormat:@"/other/uploadimage"]

//上传文件
#define Server_upload_file           [NSString stringWithFormat:@"/other/uploadfile"]

//密保问题列表
#define Server_regist_questionlist    [NSString stringWithFormat:@"/wallet/questionList"]

//注册配置
#define Server_regist_config          [NSString stringWithFormat:@"/user/ismustmobile"]

//注册页面检验配置
#define Server_first_regist_config    [NSString stringWithFormat:@"/validate/check_username_available"]

//公共配置
#define Server_regist_appSetting      [NSString stringWithFormat:@"/other/appSetting"]

//是否上传通讯录
#define Server_user_getBookStatus      [NSString stringWithFormat:@"/user/getBookStatus"]

//上传通讯录
#define Server_user_uploadBook       [NSString stringWithFormat:@"/user/uploadBook"]

//获取自动注册的账号密码
#define Server_regist_generateUser    [NSString stringWithFormat:@"/user/generateUser"]

//意见反馈
#define Server_other_feedback        [NSString stringWithFormat:@"/other/feedback"]

//加载PC后台指令
#define Server_other_systemSetting   [NSString stringWithFormat:@"/other/systemSetting"]

//变更清屏状态
#define Server_other_setClearStatus  [NSString stringWithFormat:@"/other/setClearStatus"]

//发现接口
#define Server_discovery_sites       [NSString stringWithFormat:@"/discovery/sites"]

//探索接口
#define Server_discovery_explorer    [NSString stringWithFormat:@"/discovery/explorer"]

//建群权限
#define Server_check_createteam      [NSString stringWithFormat:@"/user/checkcreateteam"]

//刷新当前token并返还
#define Server_token_refresh     [NSString stringWithFormat:@"/token/refresh"]

//当前得token和过期时间
#define Server_token_check     [NSString stringWithFormat:@"/token/check"]

//获取nerttoken
#define Server_getNertcToken     [NSString stringWithFormat:@"/token/getNertcToken"]

//获取nerttoken
#define Server_getNimCheckSum    [NSString stringWithFormat:@"/other/getNimCheckSum"]

//保存用户投诉
#define Server_other_saveComplaints [NSString stringWithFormat:@"/config/saveComplaints"]


#pragma mark -登录/注册

//用户登录
#define Server_user_login           [NSString stringWithFormat:@"/user/login"]

//注册
#define Server_regist_regist          [NSString stringWithFormat:@"/user/register"]

//手机号码注册
#define Server_regist_mobile          [NSString stringWithFormat:@"/user/smsregister"]

//发送验证码
#define Server_regist_sendcode        [NSString stringWithFormat:@"/user/getcaptcha"]

// 销毁账号
#define Server_delete_user            [NSString stringWithFormat:@"/user/cancel"]


#pragma mark - 分组

//创建分组
//accid：userid
//action:add edit del
//id; edit del使用
//name：组名
//content：空字符串
//orderid：排序使用 默认传1
#define Server_group_setgroup         [NSString stringWithFormat:@"/group/setgroup"]

//查找所有分组用户
#define Server_group_searchall        [NSString stringWithFormat:@"/group/"]

//获取所有分组
#define Server_group_getgroups        [NSString stringWithFormat:@"/group/getgroups"]

//分组增加用户
#define Server_group_addgroupuser     [NSString stringWithFormat:@"/group/addgroupuser"]


#pragma mark - 用户

//用户信息编辑
#define Server_user_editinfo          [NSString stringWithFormat:@"/user/edit"]

//修改登录密码 type = secret  是密保重置密码 ype 不等于 secret  是常规的修改密码
//常规的三项： 旧密码  新密码+重复密码
//密保修改：问题  答案 +新密码 +重复新密码
#define Server_user_modifyPass        [NSString stringWithFormat:@"/user/modifyPass"]

//设备记录
#define Server_user_devicelist        [NSString stringWithFormat:@"/user/devicelist"]

//查找好友
#define Server_user_search           [NSString stringWithFormat:@"/user/search"]

//获取用户登录(轮询)
#define Server_user_loginip           [NSString stringWithFormat:@"/user/loginip"]

//是否允许加好友
#define Server_user_checkAddFriendEx  [NSString stringWithFormat:@"/user/checkAddFriendEx"]

//朋友圈权限
#define Server_user_checkmoments      [NSString stringWithFormat:@"/user/checkmoments"]

//用户信息
#define Server_user_detail            [NSString stringWithFormat:@"/user/detail"]

//添加好友请求 （首次添加还有后的会话【你已经添加了某某某，现在可以开始聊天了】被废弃，改用后台配置的会话语 ）
#define Server_user_addFriend          [NSString stringWithFormat:@"/user/addFriend"]







#pragma mark - 钱包

//充值
#define Server_wallet_recharge           [NSString stringWithFormat:@"/wallet/recharge"]

//提现
#define Server_wallet_withdraw           [NSString stringWithFormat:@"/wallet/withdraw"]

//用户密保问题
#define Server_wallet_question           [NSString stringWithFormat:@"/wallet/question"]

//设置密保问题
#define Server_wallet_setAnswer           [NSString stringWithFormat:@"/wallet/setAnswer"]

//钱包详情
#define Server_wallet_detail              [NSString stringWithFormat:@"/wallet/detail"]

//账单流水
#define Server_wallet_billList            [NSString stringWithFormat:@"/wallet/billList"]



//设置密码
#define Server_wallet_setPass             [NSString stringWithFormat:@"/wallet/setPass"]


//重置密码
#define Server_wallet_resetPass           [NSString stringWithFormat:@"/wallet/resetPass"]

//修改密码
#define Server_wallet_modifyPass          [NSString stringWithFormat:@"/wallet/modifyPass"]

//发红包
#define Server_wallet_giveRed             [NSString stringWithFormat:@"/wallet/giveRed"]

//领红包
#define Server_wallet_acceptRed           [NSString stringWithFormat:@"/wallet/acceptRed"]

//红包详情
#define Server_wallet_redDetail           [NSString stringWithFormat:@"/wallet/redDetail"]

//是否领过红包
#define Server_wallet_isAcceptRed         [NSString stringWithFormat:@"/wallet/isAcceptRed"]





#pragma mark - 签到

//签到
#define Server_sign_globalsign         [NSString stringWithFormat:@"/sign/globalsign"]

//签到信息
#define Server_sign_signInfo           [NSString stringWithFormat:@"/sign/signInfo"]

//今日是否签到
#define Server_sign_isglobalsign       [NSString stringWithFormat:@"/sign/isglobalsign"]




#pragma mark - 朋友圈


//朋友圈列表
#define Server_friend_shareList         [NSString stringWithFormat:@"/friend/shareList"]

//发布视频
#define Server_friend_addvideo          [NSString stringWithFormat:@"/friend/addvideo"]

//发布图片
#define Server_friend_addimage          [NSString stringWithFormat:@"/friend/add"]

//点赞
#define Server_friend_sharePraise       [NSString stringWithFormat:@"/friend/sharePraise"]

//回复
#define Server_friend_shareReply        [NSString stringWithFormat:@"/friend/shareReply"]

//删除回复
#define Server_friend_deletereply       [NSString stringWithFormat:@"/friend/deletereply"]

//设置封面
#define Server_friend_setCover          [NSString stringWithFormat:@"/friend/setCover"]



#pragma mark - 群组

//创建群组
#define Server_team_create              [NSString stringWithFormat:@"/team/create"]

//解散群租
#define Server_team_destory             [NSString stringWithFormat:@"/team/destory"]

//修改群聊名称
#define Server_team_modifyname          [NSString stringWithFormat:@"/team/modifyname"]

//修改群主
#define Server_team_modifyowner         [NSString stringWithFormat:@"/team/modifyowner"]

//获取群设置详情
#define Server_team_getTeamSetting      [NSString stringWithFormat:@"/team/getTeamSetting"]

//获取群发消息 是否可以发送文本消息 还是只能发送数字消息
#define Server_team_getStatusSendText   [NSString stringWithFormat:@"/team/getStatusSendText"]

