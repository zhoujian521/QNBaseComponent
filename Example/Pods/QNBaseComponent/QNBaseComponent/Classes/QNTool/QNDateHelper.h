//
//  QNDateHelper.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/23.
//

#import <Foundation/Foundation.h>

@interface QNDateHelper : NSObject

/**
 时间戳转 【固定格式】 时间字符串
 
 @param format 时间戳格式
 @param intervar 时间间隔
 @return 时间字符串
 */
+ (NSString *)getFormatTimeWithFormat:(NSString *)format timerIntervar:(NSTimeInterval)intervar;

/**
 时间字符串
 
 @param format  时间戳格式
 @param date 时间
 @return 时间字符串
 */
+ (NSString *)getDataWithformat:(NSString *)format date:(NSDate *)date;

/**
 根据秒数获取固定格式的时间
 
 @param totalSeconds 秒数
 @return Formatted Time
 */
+ (NSString *)getTimeFormatted:(double)totalSeconds;

/**
 根据秒数获取固定格式的时间
 
 @param totalSeconds 秒数
 @return time
 */
+ (NSString *)getMinutesFormatted:(double)totalSeconds;

//字符串转日期格式
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format;

//将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChinaTime:(NSDate *)date;

//日期格式转字符串
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format;

// 比较日期大小
+ (int)compareOneDay:(NSDate *)oneDay anotherDay:(NSDate *)anotherDay;




// 时间戳转时间
+ (NSString *)formatWithTimerIntervar:(NSTimeInterval)intervar;

+ (NSString *)transformTimeWithInterVal:(NSInteger)timeInterval;
/*
 * timeType 1,今日 2，昨日 3，本周 4，上周 5，本月 6，上月
 */
+ (NSArray <NSNumber *>*)getStartTimeAndEndTimeWithType:(NSInteger)timeType;


@end
