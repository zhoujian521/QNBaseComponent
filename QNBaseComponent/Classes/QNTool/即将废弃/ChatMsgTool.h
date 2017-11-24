//
//  ChatMsgTool.h
//  XMPPUI
//
//  Created by BJQingniuJJ on 17/3/6.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kTimeStringFormat @"yyyy-MM-dd HH:mm:ss"
#define kLocaleIdentifier @"en_US"

@interface ChatMsgTool : NSObject

#warning mark --- 即将废弃 ----
//获取录音文件路径 区别添加。wav
+ (NSString *)documentPathWith:(NSString *)fileName;
//生成录音文件路径
+ (NSString*)getPathByFileName:(NSString *)fileName ofType:(NSString *)type;
//根据录音文件名获取录音文件地址
+ (NSString *)voiceFilePathWithVoiceFileName:(NSString *)fileName;
//获取同事对应的文件夹
+ (NSString *)tableNameWithColleagueId:(NSNumber *)colleagueId;
//保存图片
+ (NSString *)saveImageDocuments:(UIImage *)image msgId:(NSString *)msgId colleagueId:(NSString *)colleagueId;
// 读取并存贮到相册
+ (UIImage *)getDocumentImageWithMsgId:(NSString *)msgId colleagueId:(NSString *)colleagueId;

+ (NSString *)getImagePathWithMsgId:(NSString *)msgId colleagueId:(NSString *)colleagueId;

//获取当前时间戳
+(NSString *)getCurentTime;
//获取当前消息时间戳
+(NSString *)getCurentMsgIdWithColleagueId:(NSString *)colleagueId;

+ (NSString *)getStrWithDate:(NSDate *)date;

+ (NSDate *)getDateWithStr:(NSString *)str;

//消息间隔
+ (NSString *)intervalSinceNowWithMsgtime:(NSString *)msgTime;

//是否需要添加消息超时提醒
+ (BOOL)isNeedAddTimeoutRemindWithMsgTime:(NSString *)msgTime;

+ (void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message ViewController:(UIViewController *)viewController;

@end
