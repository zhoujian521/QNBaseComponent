//
//  QNWMHelper.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/23.
//

#import "QNWMHelper.h"
#import "QNFileHelper.h"
#import "QNDateHelper.h"
//#import "JKEncrypt.h"

@implementation QNWMHelper

/**
 获取客户头像
 
 @param sex 性别 1:男  2:女  3:未知
 @return wyx_header_?
 */

+ (NSString *)getCustomerHeaderImgWithSex:(NSNumber *)sex{
    switch ([sex integerValue]) {
        case 0:
            return @"wyx_header_sex";
            break;
        case 1:
            return @"wyx_header_man";
            break;
        case 2:
            return @"wyx_header_woman";
            break;
        case 3:
            return @"wyx_header_sex";
            break;
            
        default:
            
            break;
    }
    return @"wyx_header_sex";
}

/**
 根据枚举值 获取客户沟通意向 描述
 
 @param cusGrade 沟通意向
 @return 客户沟通意向
 */
+ (NSString *)getCusGrade:(NSNumber *)cusGrade {
    
    switch ([cusGrade integerValue]) {
        case 0:
            return @"未联系";
            break;
        case 1:
            return @"有意向";
            break;
        case 2:
            return @"约见面";
            break;
        case 3:
            return @"待联系";
            break;
        case 4:
            return @"无意向";
            break;
        default:
            return @"未联系";
            break;
    }
    
    return @"未联系";
}



+ (NSNumber *)getDataBaseCusGradeWithCusGrade:(NSNumber *)cusGrade{
    return cusGrade;
}

// status    0-未拨打 3    1-未拨通 2   2-已拨通   1     3-全部 0
+ (NSNumber *)getDataBaseStatusWithStatus:(NSNumber *)status{
    switch ([status integerValue]) {
        case 0:
            return @(99);
            break;
        case 1:
            return @(2);
            break;
        case 2:
            return @(1);
            break;
        case 3:
            return @(0);
            break;
            
        default:
            
            break;
    }
    return @(99);
}

+ (NSNumber *)getDataBaseSortWithSort:(NSNumber *)sort{
    return @([sort integerValue] + 1);
}






// 获取录音通话小结的录音地址 //@"entId_userId_cusId_summaryId/sessionId";
+ (NSString *)getSummaryVoiceFileNameWithCusId:(NSString *)cusId sessionId:(NSString *)sessionId{
    sessionId = [sessionId stringByReplacingOccurrencesOfString:@":"withString:@"_"];
//    NSDictionary *userDic = [kUserDefaults objectForKey:KloginDataDic];
//    WMLoginModel *userModel = [WMLoginModel mj_objectWithKeyValues:userDic];
//    NSString *fileName = [NSString stringWithFormat:@"%@_%@_%@_%@",userModel.entNum,userModel.userId,cusId,sessionId];
//    return fileName;
    return @"";
}

// 获取录音通话小结的录音地址
+ (NSString *)getSummaryVoiceFilePathWithVoiceFileName:(NSString *)fileName ofType:(NSString *)type {
    NSString *rootPath = self.rootPath;
    BOOL result = [QNFileHelper createDirectoryIfNotExists:rootPath];
    if (!result) {
        return @"";
    }
    NSString *fileDirectory = [[rootPath stringByAppendingPathComponent:fileName]stringByAppendingPathExtension:type];
    return fileDirectory;
}

+ (NSString *)rootPath {
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [directory stringByAppendingPathComponent:@"WYXRootPath/WYXCusResouse"];
}


// 获取坐席删除抢单提醒的时间对象
+ (NSDictionary *)getUserDeleteGrabRemindDateObject{
    // 1.关闭抢单提醒消息，显示为闭合状态
    // 2.今日有新的抢单消息提醒， 不再提示客户
    // 3.次日有新的抢单消息提醒，提示客户
    // 4.切换账户时会继续提醒
    
//    NSDictionary *userInfo = [kUserDefaults objectForKey:KloginDataDic];
//    WMLoginModel *loginModel = [WMLoginModel mj_objectWithKeyValues:userInfo];
//    NSString *deleteGrabRemindTime = [WMHelper getDataWithformat:@"yyyy-MM-dd" date:[NSDate date]];
//    // userId:                坐席id            loginModel.userId
//    // deleteGrabRemindTime:  坐席删除抢单提醒时间 deleteGrabRemindTime
//    NSDictionary *deleteGrabRemindDic = @{@"userId":loginModel.userId,
//                                          @"deleteGrabRemindTime":deleteGrabRemindTime};
//    return deleteGrabRemindDic;
    return nil;
}

/**
 是否为当前坐席
 
 @param userId userId
 @return 是否
 */
+ (BOOL)isCurrentUserWithUserId:(NSString *)userId{
//    if (![kUserDefaults boolForKey:WYXUserIsLoginSuccessed]) return NO;
//    
//    NSDictionary *userInfo = [kUserDefaults objectForKey:KloginDataDic];
//    if (![[userInfo allKeys] containsObject:@"userId"]) return NO;
//    
//    WMLoginModel *loginModel = [WMLoginModel mj_objectWithKeyValues:userInfo];
//    if ([loginModel.userId integerValue] == [userId integerValue]) {
//        return YES;
//    }
    return NO;
}

/**
 删除抢单提醒的时间是否为当日
 
 @param time 删除抢单提醒的时间
 @return 是否
 */
+ (BOOL)isTodayWithDeleteGrabRemindTime:(NSString *)time{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDate *preDate = [QNDateHelper stringToDate:time withDateFormat:@"yyyy-MM-dd"];
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:preDate];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

// 获取当前网络状态
+ (NSString *)getCurrentNetType{
//    switch ([WMCusMetaHelper shareHelper].networkType) {
//        case 0:
//            return @"暂无网络";
//            break;
//        case 1:
//            return @"2G";
//            break;
//        case 2:
//            return @"3G";
//            break;
//        case 3:
//            return @"4G";
//            break;
//        case 5:
//            return @"WiFi";
//            break;
//        default:
//            break;
//    }
    return @"暂无网络";
}



//+ (NSString *)getCorrectPhoneNumbeWithCusDetailModel:(WMCusModel *)cusModel {
//    NSString *hostNum = [NSString stringWithFormat:@"%@",cusModel.hostNum];
//    // 匿号标识 1-正常显示；2-匿号
//    if ([cusModel.hiddenPhone integerValue] == 1) {
//        return hostNum;
//    }
//    return [hostNum stringSecret];
//
//                        //    if (isNilOrNull(hostNum)) {
//                        //        return @"";
//                        //    }
//                        //    // 匿号标识 1-正常显示；2-匿号
//                        //    if ([cusModel.hiddenPhone integerValue] == 2) {
//                        //        return [hostNum stringSecret];
//                        //    }
//                        //    return hostNum;
//
//
//                        //    // 客户来源 1.电信 2.联通 3.移动 8.银联 9.第三方
//                        //    if ([cusModel.cusSource intValue] == 6 || [cusModel.cusSource intValue] == 4) {
//                        //        // 匿号标识 1-正常显示；2-匿号
//                        //        if ([cusModel.hiddenPhone integerValue]) {
//                        //            return [hostNum stringSecret];
//                        //        }
//                        //    }
//                        //    return hostNum;
//}

+ (NSString *)getNowDateMS{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *ms = [NSString stringWithFormat:@"%lld",(long long)timeInterval * 1000];
    return ms;
}

//+ (NSString *)getCusShowMainTelNumWithCusModel:(WMCusModel *)cusModel{
//    //    1:  坐席侧 -> 外显号码
//    //    1.1 非第三方:  hostNum ==> 直接外显
//    //    1.2 第三方:   hostNum + hidden【是否隐藏中间四位】 ==》 判断外显
//
//
//    // 客户来源 1.电信 2.联通 3.移动 4.电信第三方 5.嘉实临时第三方 6.联通第三方 7.联通坐席第三方 8.银联
//    if ([cusModel.cusSource integerValue] == 1 || [cusModel.cusSource integerValue] == 2) { // 非第三方
//        //    1.1 非第三方:  hostNum ==> 直接外显
//        return [NSString stringWithFormat:@"%@",cusModel.hostNum];
//    }
//    //    1.2 第三方:   hostNum + hidden【是否隐藏中间四位】 ==》 判断外显
//    // 匿号标识 1-正常显示；2-匿号
//    if ([cusModel.hiddenPhone integerValue] == 1) {
//        return [NSString stringWithFormat:@"%@",cusModel.hostNum]; //0 正常显示
//    }
//    // 1 匿号
//    NSString *hostNum = [NSString stringWithFormat:@"%@",cusModel.hostNum];
//    return [hostNum stringSecret];
//}




@end
