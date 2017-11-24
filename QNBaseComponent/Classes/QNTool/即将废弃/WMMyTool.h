//
//  WMMyTool.h
//  ChannelSoftWeMarketing
//
//  Created by channelsoftios on 16/8/19.
//  Copyright © 2016年 channelsoftios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMMyTool : NSObject

// 计算文件大小
+ (NSInteger)fileSize:(NSString *)path;

#warning mark --- 即将废弃 请在字符串的分类中处理 ----

+ (BOOL) isAllowedMobile:(NSString *)mobile;
// 密码是否合法
+ (BOOL) isAllowedSercet:(NSString *)secretStr;

+ (NSString *)strUrlEncoding:(NSString *)urlStr;

+ (NSString *)logStr:(NSString *)urlStr;

#warning mark --- 即将废弃 请在字典的分类中处理 ----
+ (NSString *)logDic:(NSDictionary *)dic;



















#warning mark --- 即将废弃 ----
+ (NSString *)getStrWithDate:(NSDate *)date formatter:(NSString *)format;

+ (NSString *)calculateTimeDisparityWithSecond:(NSInteger)countSecond;

// 时间间隔
+ (NSString *)timeChangeWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
// 文件的类型
+ (NSString *)selectTextTypeWithTextName:(NSString *)textName size:(NSInteger)size;

// Json存储
+ (void)jsonWriteToFileWithData:(NSData *)data andFileName:(NSString *)name;
// Json读取
+ (NSDictionary *)jsonGetFromFileWithName:(NSString *)name;
// Json删除
+ (void)jsonRemoveFromFileWithName:(NSString *)name;
//
+ (BOOL)isSIMInstalled;


#warning mark --- 即将废弃 ----
/**
 格式化输出转换
 
 @param string 要打印的字符串
 @return const char 格式化输出类型
 */
+ (const char*)charFormatWithString:(NSString *)string;

+ (BOOL)deleteLocalMemoryWithPath:(NSString *)path fileName:(NSString *)fileName;

+ (NSString *)getCustomerBackgroundColorWithCusGradeIndex:(int)index;

+ (NSString *)titleName:(NSInteger)type;

+ (NSString *)titleShortName:(int)type;

#pragma mark - 拼接token
+ (NSString *)signMD5WithToken:(NSString *)checksum dicSequence:(NSString *)dicSequence;

//+ (BOOL)clearLocalMemory;

// 号码是否需要匿号
//+ (NSString *)getCorrectPhoneNumbeWithCustomerRoster:(WMCusModel *)customerRoster;

@end
