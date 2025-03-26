// __DEBUG__
// __CLOSE_PRINT__
//
//  ZCHttpInterfacedConst.h
//  NIM
//
//  Created by 田玉龙 on 2022/7/30.
//  Copyright © 2022 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "CCCConfig.h"
#import "IndueColor.h"

/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */




//: extern __attribute__((visibility ("default"))) NSString * RestApi(NSString *api);
extern __attribute__((visibility ("default"))) NSString * RestApi(NSString *api);

extern __attribute__((visibility ("default"))) NSString *const k_infoData;/** Touken前缀*/

extern __attribute__((visibility ("default"))) NSString *const k_tagName;/** 加密密钥*/

extern __attribute__((visibility ("default"))) NSString *const k_viewTitle;/** 即时聊天*/


//: #pragma mark -配置
#pragma mark -配置

//上传图片


//上传文件


//密保问题列表


//注册配置


//注册页面检验配置


//公共配置


//是否上传通讯录


//上传通讯录


//获取自动注册的账号密码


//意见反馈


//加载PC后台指令


//变更清屏状态


//发现接口


//探索接口


//建群权限


//刷新当前token并返还


//当前得token和过期时间


//获取nerttoken


//获取nerttoken


//保存用户投诉



//: #pragma mark -登录/注册
#pragma mark -登录/注册

//用户登录


//注册


//手机号码注册


//发送验证码


// 销毁账号



//: #pragma mark - 分组
#pragma mark - 分组

//创建分组
//accid：userid
//action:add edit del
//id; edit del使用
//name：组名
//content：空字符串
//orderid：排序使用 默认传1


//查找所有分组用户


//获取所有分组


//分组增加用户



//: #pragma mark - 用户
#pragma mark - 用户

//用户信息编辑


//修改登录密码 type = secret  是密保重置密码 ype 不等于 secret  是常规的修改密码
//常规的三项： 旧密码  新密码+重复密码
//密保修改：问题  答案 +新密码 +重复新密码


//设备记录


//查找好友


//获取用户登录(轮询)


//是否允许加好友


//朋友圈权限


//用户信息


//添加好友请求 （首次添加还有后的会话【你已经添加了某某某，现在可以开始聊天了】被废弃，改用后台配置的会话语 ）








//: #pragma mark - 钱包
#pragma mark - 钱包

//充值


//提现


//用户密保问题


//设置密保问题


//钱包详情


//账单流水




//设置密码



//重置密码


//修改密码


//发红包


//领红包


//红包详情


//是否领过红包






//: #pragma mark - 签到
#pragma mark - 签到

//签到


//签到信息


//今日是否签到





//: #pragma mark - 朋友圈
#pragma mark - 朋友圈


//朋友圈列表


//发布视频


//发布图片


//点赞


//回复


//删除回复


//设置封面




//: #pragma mark - 群组
#pragma mark - 群组

//创建群组


//解散群租


//修改群聊名称


//修改群主


//获取群设置详情


//获取群发消息 是否可以发送文本消息 还是只能发送数字消息