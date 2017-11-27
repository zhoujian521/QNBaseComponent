//
//  WMCusHelper.m
//  ChannelSoftWeMarketing
//
//  Created by BJQingniuJJ on 2017/6/6.
//  Copyright © 2017年 channelsoftios. All rights reserved.
//

#import "WMCusHelper.h"
#import "WMHelper.h"
//#import "WMLoginModel.h"
//#import "QNFileTool.h"
//#import "WMCusGradeModel.h"
//#import "WMCusMetaHelper.h"

@implementation WMCusHelper


+ (NSString *)getCustomerSex:(NSNumber *)sex{
    switch ([sex integerValue]) {
        case 0:
            return @"未知";
            break;
        case 1:
            return @"男";
            break;
        case 2:
            return @"女";
            break;
            
        default:
            return @"未知";
            break;
    }
    return @"未知";
}

// 根据客户的沟通意向 获取沟通意向 对应的图片
+ (NSString *)getCusCusGradeImgWithCusGrade:(NSNumber *)cusGrade{
    switch ([cusGrade integerValue]) {
        case 0:
            return @"wyx_cusGrade_wei";
            break;
        case 1:
            return @"wyx_cusGrade_you";
            break;
        case 2:
            return @"wyx_cusGrade_yue";
            break;
        case 3:
            return @"wyx_cusGrade_dai";
            break;
        case 4:
            return @"wyx_cusGrade_wu";
            break;
            
        default:
            return @"wyx_cusGrade_dai";
            break;
    }
    return @"wyx_cusGrade_dai";
}

/**
 根据客户的沟通意向 获取沟通意向 字典表模型
 
 @param cusGrade 沟通意向
 @return WMCusGradeModel 字典表模型
 */
//+ (WMCusGradeModel *)getCusCusGradeModelWithCusGrade:(NSNumber *)cusGrade{
//    
//    NSArray *cusGradeArray = [WMCusMetaHelper shareHelper].userMetaInfo.cusGrade;
//    for (WMCusGradeModel *cusGradeModel in cusGradeArray) {
//        if ([cusGradeModel.cusGradeId isEqual:cusGrade]) {
//            return cusGradeModel;
//        }
//    }
//    return [cusGradeArray firstObject];
//}

// 根据客户的沟通意向 获取沟通意向 对应的图片
// 1:意向客户（有意向）2:成单客户（约见面）3:待跟踪客户（待联系）4:无意向客户（无意向）5:全部
+ (NSString *)getCusDetailCusGradeImgWithCusGrade:(NSNumber *)cusGrade{
    switch ([cusGrade integerValue]) {
        case 0:
            
            return @"wyx_wei";
            break;
        case 1:
            return @"wyx_youyi";
            break;
        case 2:
            return @"wyx_yue";
            break;
        case 3:
            return @"wyx_dai";
            break;
        case 4:
            return @"wyx_wu";
            break;
        case 5:
            return @"wyx_huishou";
            break;
            
        default:
            return @"wyx_dai";
            break;
    }
    return @"wyx_dai";
}

+ (NSString *)titleShortName:(int)type {
    NSString *title = @"";
    
    switch (type) {
        case 0:
            title = @"未";
            break;
        case 1:
            title = @"待";
            break;
        case 2:
            title = @"跟";
            break;
        case 3:
            title = @"无";
            break;
        case 4:
            title = @"无效";
            break;
        case 5:
            title = @"同行";
            break;
        default:
            title = @"";
            break;
    }
    
    return title;
}




+ (NSString *)getContactTimeWithRecentTime:(NSNumber *)recentTime{
//                if (![recentTime integerValue]) {
//                    return @"";
//                }
//                NSLog(@"recentTime ---> %@",recentTime);
//                NSString *formatter = @"yyyy-MM-dd HH:mm";
//                NSString *contactTime = [WMHelper getFormatTimeWithFormat:formatter timerIntervar:[recentTime longLongValue]];
//                NSString *nowDate = [WMHelper getDataWithformat:formatter date:[NSDate date]];
//                if ([[contactTime substringToIndex:4] isEqualToString:[nowDate substringToIndex:4]]) {
//                    return [contactTime substringFromIndex:5];
//                }
//                return contactTime;
    return @"  ";
}








@end
