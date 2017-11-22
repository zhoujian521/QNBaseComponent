//
//  QNBasicConfiguration.h
//  Pods
//
//  Created by BJQingniuJJ on 2017/11/22.
//  ZJ:【青牛-基础-配置】组件

#ifndef QNBasicConfiguration_h
#define QNBasicConfiguration_h

// 常量

// 变量

// 宏
/******************************【iOS 强弱引用】***********************************/
#define weakself(type)  __weak typeof(type) weak##type = type;
#define strongSelf(type) __strong typeof(type) type = weak##type;

/******************************【iOS 校验是否为空】***********************************/
#define isNilOrNull(obj) (obj == nil || [obj isEqual:[NSNull null]])

/******************************【iOS 系统版本判断】***********************************/
#define MKSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] compare:version options:NSCaseInsensitiveSearch]  >= NSOrderedSame )
#define IOS8_OR_LATER MKSystemVersionGreaterOrEqualThan(@"8.0")
#define IOS9_OR_LATER MKSystemVersionGreaterOrEqualThan(@"9.0")

/******************************【iOS 手机屏幕适配】***********************************/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


// 判断是否是 【iphone4】
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是 【iphone5】
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是 【iphone6】
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen]currentMode].size) : NO)
// 判断是否是 【iphone6Plus】
#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/******************************【iOS 适配iPhoneX】***********************************/
// 判断是否是 【iPhone X】
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f + 34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

/******************************【iOS 适配iOS 11】***********************************/
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
if (@available(iOS 11.0,*))  {\
scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
self.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \


#endif /* QNBasicConfiguration_h */
