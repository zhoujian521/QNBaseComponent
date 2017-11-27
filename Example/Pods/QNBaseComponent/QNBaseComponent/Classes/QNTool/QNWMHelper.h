//
//  QNWMHelper.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/23.
//

#import <Foundation/Foundation.h>

@interface QNWMHelper : NSObject

#pragma mark --- 客户展示信息 ---
/**
 获取客户头像
 
 @param sex 性别 1:男  2:女  3:未知
 @return wyx_header_?
 */
+ (NSString *)getCustomerHeaderImgWithSex:(NSNumber *)sex;

/**
 根据枚举值 获取客户沟通意向 描述
 
 @param cusGrade 沟通意向
 @return 客户沟通意向
 */
+ (NSString *)getCusGrade:(NSNumber *)cusGrade;

#pragma mark --- 客户列表 客户筛选 ---
/**
 客户筛选 条件 返回后台对应的 cusGradeId
 
 @param cusGrade 1:意向客户（有意向）2:成单客户（约见面）3:待跟踪客户（待联系）4:无意向客户（无意向）5:全部
 @return cusGradeId
 */
+ (NSNumber *)getDataBaseCusGradeWithCusGrade:(NSNumber *)cusGrade;

/**
 客户筛选 条件 返回后台对应的 status
 
 @param status status  0-未拨打 1-未拨通  2-已拨通 3-全部
 @return status
 */
+ (NSNumber *)getDataBaseStatusWithStatus:(NSNumber *)status;

/**
 客户筛选 条件 返回后台对应的 sort
 
 @param sort 移动端显示sort
 @return sort
 */
+ (NSNumber *)getDataBaseSortWithSort:(NSNumber *)sort;

#pragma mark --- 保存/添加沟通小结页面 --- 录音小结路径 ---
/**
 获取录音通话小结的录音地址

 @param cusId 客户Id
 @param sessionId 会话标识
 @return 录音通话小结的录音地址
 */
+ (NSString *)getSummaryVoiceFileNameWithCusId:(NSString *)cusId sessionId:(NSString *)sessionId;

/**
 获取录音通话小结【某一类型】的录音地址

 @param fileName 文件名称
 @param type 文件类型
 @return 录音地址
 */
+ (NSString *)getSummaryVoiceFilePathWithVoiceFileName:(NSString *)fileName ofType:(NSString *)type;


/**
 录音文件 根目录

 @return 录音文件根目录
 */
+ (NSString *)rootPath;

#pragma mark --- 客户外呼模块 --- 【】 ---- 具体方法 待优化 ---
/**
 客户主号码 匿号 处理
 
 @param cusModel 客户详情Model
 @return 客户主号码
 */
//+ (NSString *)getCorrectPhoneNumbeWithCusDetailModel:(WMCusModel *)cusModel;

/**
 获取当前时间  毫秒【ms】数
 
 @return ms
 */
+ (NSString *)getNowDateMS;

/**
 客户主号码
 
 @param cusModel 客户详情Model
 @return 客户主号码
 */
//+ (NSString *)getCusShowMainTelNumWithCusModel:(WMCusModel *)cusModel;


#pragma mark --- 获客页面 --- 提醒相关 --- V3.5.3 --- 已经废弃抢单模块
// 获取坐席删除抢单提醒的时间对象
+ (NSDictionary *)getUserDeleteGrabRemindDateObject;
/**
 是否为当前坐席
 
 @param userId userId
 @return 是否
 */
+ (BOOL)isCurrentUserWithUserId:(NSString *)userId;

/**
 删除抢单提醒的时间是否为当日
 
 @param time 删除抢单提醒的时间
 @return 是否
 */
+ (BOOL)isTodayWithDeleteGrabRemindTime:(NSString *)time;

// 获取当前网络状态
+ (NSString *)getCurrentNetType;


@end







