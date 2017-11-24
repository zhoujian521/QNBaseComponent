//
//  QNDateHelper.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/23.
//  ZJ:【青牛->基础组件->时间/日期处理相关】

#import "QNDateHelper.h"

@implementation QNDateHelper

// 时间戳转时间
+ (NSString *)getFormatTimeWithFormat:(NSString *)format timerIntervar:(NSTimeInterval)intervar{
    
    if (!format.length) {
        format = @"yyyy-MM-dd HH:mm:ss";
    }
    //因为时差问题要加8小时 == 28800 sec
    //NSTimeInterval time = [intervar doubleValue];
    NSDate *detaildate  = [NSDate dateWithTimeIntervalSince1970:intervar / 1000];
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate: detaildate];
    return strDate;
}

+ (NSString *)getDataWithformat:(NSString *)format date:(NSDate *)date{
    if (!format.length) {
        format = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormatter setDateFormat:format];
    NSString *dateText = [dateFormatter stringFromDate:date];
    return dateText;
}

+ (NSString *)getTimeFormatted:(double)totalSeconds{
    int seconds = (int)totalSeconds % 60;
    int minutes = ((int)totalSeconds / 60) % 60;
    //    int hours = (int)totalSeconds / 3600;
    //    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
    return [NSString stringWithFormat:@"%02d:%02d",minutes, seconds];
}

+ (NSString *)getMinutesFormatted:(double)totalSeconds{
    int minutes = (int)totalSeconds / 60;
    int seconds = totalSeconds - ((int)minutes * 60);
    return [NSString stringWithFormat:@"%d:%02d",minutes, seconds];
}

//日期格式转字符串
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

//字符串转日期格式
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    //    return [WMHelper worldTimeToChinaTime:date];
    return date;
}

//将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChinaTime:(NSDate *)date{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}

// 比较日期大小
+ (int)compareOneDay:(NSDate *)oneDay anotherDay:(NSDate *)anotherDay {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    } else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}





// 时间戳转时间
+ (NSString *)formatWithTimerIntervar:(NSTimeInterval)intervar {
    //因为时差问题要加8小时 == 28800 sec
    //NSTimeInterval time = [intervar doubleValue];
    NSDate *detaildate  = [NSDate dateWithTimeIntervalSince1970:intervar];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate: detaildate];
    return strDate;
}

+ (NSString *)timeChangeWithStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    
    NSUInteger duration = (NSInteger)(([endTime doubleValue] - [startTime doubleValue])/1000);
    if (duration < 60) {
        return [NSString stringWithFormat:@"00:00:%02ld",(unsigned long)duration];
    }
    else if (60 < duration && duration < 60 * 60) {
        NSInteger minate = duration/60;
        NSInteger second = duration%60;
        return [NSString stringWithFormat:@"00:%02ld:%02ld",(long)minate,(long)second];
    }
    else {
        NSInteger hour   = duration / (60*60);
        NSInteger other  = duration % (60*60);
        NSInteger minate = other / 60;
        NSInteger second = other % 60;
        
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hour,minate,(long)second];
    }
}

// timeInterval 秒数
+ (NSString *)transformTimeWithInterVal:(NSInteger)timeInterval {
    NSString *timerInterStr;
    if (timeInterval < 60) {
        timerInterStr = [NSString stringWithFormat:@"%ld\''",(long)timeInterval];
    }
    else {
        NSInteger min = timeInterval/60;
        
        timerInterStr = [NSString stringWithFormat:@"%ld\' %ld\''",(long)min,timeInterval%60];
    }
    
    return timerInterStr;
}


/*
 * timeType 1,今日 2，昨日 3，本周 4，上周 5，本月 6，上月
 */
+ (NSArray <NSNumber *>*)getStartTimeAndEndTimeWithType:(NSInteger)timeType {
    //获取客户端逻辑日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取当前时间
    NSDate *date = [NSDate date];
    //从date中读取年月日，存储在NSDateComponents对象中
    NSDateComponents *compt1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond | kCFCalendarUnitWeekday | kCFCalendarUnitWeekOfMonth | kCFCalendarUnitWeekOfYear) fromDate:date];
    
    NSInteger year = [compt1 year];//4
    NSInteger month = [compt1 month];//4
    NSInteger day = [compt1 day];
    NSInteger hour = [compt1 hour];//4
    NSInteger minute = [compt1 minute];//4
    NSInteger second = [compt1 second];
    NSInteger weekday = [compt1 weekday];
    
    NSUInteger times = (hour*60*60+minute*60+second)*1000;
    // 今日结束
    NSUInteger timeInterval = (NSUInteger)([[NSDate date] timeIntervalSince1970]*1000);
    // 今日开始
    NSUInteger todayB = timeInterval-times;
    
    //    NSDate *todayDateEnd = [NSDate dateWithTimeIntervalSince1970:timeInterval/1000.0];
    //    NSDate *todayDateStart = [NSDate dateWithTimeIntervalSince1970:todayB/1000.0];
    
    if (timeType == 1) {
        return @[@(todayB),@(timeInterval)];
    }
    // 昨日开始
    NSUInteger yestodayB = todayB-(24*60*60*1000);
    //NSDate *yestodayStart = [NSDate dateWithTimeIntervalSince1970:yestodayB/1000.0];
    // 昨日结束
    //NSDate *yestodayDateEnd = todayDateStart;
    
    if (timeType == 2) {
        return @[@(yestodayB),@(todayB)];
    }
    
    // 本周开始时间
    NSUInteger weekdayB = todayB - ((weekday-2)*24*60*60)*1000;
    //NSDate *weekdayDateStart = [NSDate dateWithTimeIntervalSince1970:weekdayB/1000.0];
    // 本周结束时间 等于当前时间
    //NSDate *weekdayDateEnd = todayDateEnd;
    
    if (timeType == 3) {
        return @[@(weekdayB),@(timeInterval)];
    }
    
    NSUInteger sevenDay = 7*24*60*60*1000;
    // 上周开始时间
    NSUInteger yesWeekdayDateB = weekdayB-sevenDay;
    //NSDate *yesWeekdayDateStart = [NSDate dateWithTimeIntervalSince1970:yesWeekdayDateBDate/1000.0];
    // 上周结束时间 等于本周开始时间
    //NSDate *yesWeekdayDateEnd = weekdayDateStart;
    
    if (timeType == 4) {
        return @[@(yesWeekdayDateB),@(weekdayB)];
    }
    
    // 本月开始时间
    NSUInteger monthIntervalB = timeInterval - (day-1)*24*60*60*1000 - times;
    //NSDate *monthDateStart = [NSDate dateWithTimeIntervalSince1970:monthIntervalB/1000.0];
    // 本月结束时间
    //NSDate *monthDateEnd = todayDateEnd;
    
    if (timeType == 5) {
        return @[@(monthIntervalB),@(timeInterval)];
    }
    
    // 上月开始时间
    NSInteger dayCount;
    if (month == 2 ||month == 4 || month == 6|| month == 8|| month == 10|| month == 12) {
        dayCount = 31;
    }
    else if (month == 1 || month == 5|| month == 7|| month == 9|| month == 11) {
        dayCount = 30;
    }
    else {
        if (year % 100 == 0) {
            if (year % 400 == 0) {
                dayCount = 29;
            }
            else {
                dayCount = 28;
            }
        }
        else {
            if (year % 4 == 0) {
                dayCount = 29;
            }
            else {
                dayCount = 28;
            }
        }
        dayCount = 28;
    }
    NSUInteger monthIntervalN = timeInterval - (dayCount+day-1)*24*60*60*1000 - times;
    //NSDate *yesmonthStart = [NSDate dateWithTimeIntervalSince1970:monthIntervalN/1000.0];
    // 上月结束时间
    //NSDate *yesmonthEnd = monthDateStart;
    
    if (timeType == 6) {
        return @[@(monthIntervalN),@(monthIntervalB)];
    }
    
    return @[[NSNumber new],[NSNumber new]];
    
    //    //创建日期字符串格式化器
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    //设置时区
    //    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    //    //设置格式化输出格式
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    //格式化输出字符串，传入要格式化的时间NSDate对象
    //
    //
    //    NSString *todayStartStr = [formatter stringFromDate:todayDateStart];
    //    NSString *todayEndStr = [formatter stringFromDate:todayDateEnd];
    //    NSLog(@"今日：start:%@\n end:%@ ",todayStartStr,todayEndStr);
    //
    //
    //    NSString *yestodayStartStr = [formatter stringFromDate:yestodayStart];
    //    NSString *yestodayEndStr = [formatter stringFromDate:yestodayDateEnd];
    //    NSLog(@"昨日：yestodayStartStr:%@\n yestodayEndStr:%@",yestodayStartStr,yestodayEndStr);
    //
    //
    //    NSString *weekdayDateStartStr = [formatter stringFromDate:weekdayDateStart];
    //    NSString *weekdayDateEndStr = [formatter stringFromDate:weekdayDateEnd];
    //    NSLog(@"本周 weekdayStartStr:%@\n weekdayDateEndStr:%@",weekdayDateStartStr,weekdayDateEndStr);
    //
    //
    //    NSString *yesWeekdayDateStartStr = [formatter stringFromDate:yesWeekdayDateStart];
    //    NSString *yesWeekdayDateEndStr = [formatter stringFromDate:yesWeekdayDateEnd];
    //    NSLog(@"上周 yesWeekdayDateEndStr%@\n yesWeekdayDateEndStr%@",yesWeekdayDateStartStr,yesWeekdayDateEndStr);
    //
    //    NSString *monthDateStartStr = [formatter stringFromDate:monthDateStart];
    //    NSString *monthDateEndStr = [formatter stringFromDate:monthDateEnd];
    //    NSLog(@"本月 monthDateStartStr%@\n monthDateEndStr%@",monthDateStartStr,monthDateEndStr);
    //
    //    NSString *yesmonthStartStr = [formatter stringFromDate:yesmonthStart];
    //    NSString *yesmonthEndStr = [formatter stringFromDate:yesmonthEnd];
    //    NSLog(@"上月 yesmonthStartStr%@\n yesmonthEndStr%@",yesmonthStartStr,yesmonthEndStr);
}


@end
