//
//  WMCusHelper.h
//  ChannelSoftWeMarketing
//
//  Created by BJQingniuJJ on 2017/6/6.
//  Copyright © 2017年 channelsoftios. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "WMCusGradeModel.h"

@interface WMCusHelper : NSObject

#warning mark --- 即将废弃 ---
/**
 根据客户的沟通意向 获取沟通意向 字典表模型
 
 @param cusGrade 沟通意向
 @return WMCusGradeModel 字典表模型
 */
 // + (WMCusGradeModel *)getCusCusGradeModelWithCusGrade:(NSNumber *)cusGrade;


#warning mark --- 马上废弃 ---
/**
 获取客户性别
 
 @param sex 性别 0:中性  1:男  2:女
 @return 未知 男 女
 */
+ (NSString *)getCustomerSex:(NSNumber *)sex;

/**
 根据客户的沟通意向 获取沟通意向 对应的图片
 
 @param cusGrade 沟通意向
 @return wyx_cusGrade_?
 */
+ (NSString *)getCusCusGradeImgWithCusGrade:(NSNumber *)cusGrade;

// 根据客户的沟通意向 获取沟通意向 对应的图片
// 1:意向客户（有意向）2:成单客户（约见面）3:待跟踪客户（待联系）4:无意向客户（无意向）5:全部
+ (NSString *)getCusDetailCusGradeImgWithCusGrade:(NSNumber *)cusGrade;

/**
 获取 最后一次联系时间
 
 @param recentTime 最后一次联系时间
 @return 最后一次联系时间
 */
+ (NSString *)getContactTimeWithRecentTime:(NSNumber *)recentTime;

@end
