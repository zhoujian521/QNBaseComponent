//
//  QNComHelper.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/23.
//  ZJ:【青牛->基础组件->通用工具类】

#import <Foundation/Foundation.h>

@interface QNComHelper : NSObject

/**
校验是否允许使用照相机

 @return BOOL
 */
+ (BOOL)isCameraOpen;

/**
 校验是否允许使用麦克风

 @return BOOL
 */
+ (BOOL)isAudioOpen;

/**
 校验是否允许使用相册

 @return BOOL
 */
+ (BOOL)isAlbumOpen;


/**
 校验【当前 某】控制器是否正在显示

 @param viewController 【当前 某】控制器
 @return BOOL
 */
+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController;

/**
 提性设置相关

 @param isOn 声音开关
 @param isShakeOn 震动开关
 */
+ (void)setLocalNotificationSound:(BOOL)isOn shake:(BOOL)isShakeOn;

/**
 iOS 判断手机型号

 @return 手机型号
 */
//+ (NSString *)iphoneType;

/**
 获取 高度固定式->字符串的宽度
 
 @param value 字符串
 @param fontSize 字号
 @param height 区域高度
 @return 字符串的宽度
 */
+ (CGFloat )widthWithText:(NSString *)value fontSize:(CGFloat )fontSize height:(CGFloat)height;

/**
 获取 高度固定式->字符串的宽度
 
 @param value 字符串
 @param fontSize 字号
 @param width 区域宽度
 @return 字符串的高度
 */
+ (CGFloat )heightWithText:(NSString *)value fontSize:(CGFloat )fontSize width:(CGFloat)width;

/**
 字符串删除 某部分 特定字符串
 
 @param text 全部字符串
 @param subtext 需要删除的字符串
 @return 处理后的字符串
 */
+ (NSString *)substringWithText:(NSString *)text rangetext:(NSString *)subtext;

@end
