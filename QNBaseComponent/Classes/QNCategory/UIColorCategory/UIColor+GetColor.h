//
//  UIColor+XQColor.h
//  AppHelperXQ
//
//  Created by Mike on 15/7/25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

// Method Macro
#define ColorRGB(r, g, b) ([UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f])

#define ColorRGBA(r, g, b, a) ([UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)])

// Constants
// listColor 正常：白底 篮筐 蓝字 进度色;  安装中，连接中，下载中：蓝底，白字，篮筐 进度色
// detailColor 正常： 蓝底 篮框 白字 进度色  安装中，下载中，连接中： 蓝底 篮框 白字 进度色
// 有缓存：篮筐 白底 高亮蓝色

#define MAIN_COLOR (ColorRGBA(88.0, 183.0, 223.0, 1))  // 进度条的颜色
#define ORANGE_COLOR [UIColor colorWithHex:@"#f6810f"]
#define GRAY_COLOR [UIColor colorWithHex:@"#a7a7a7"]
#define BORDER_COLOR [UIColor colorWithHex:@"#58b7df"] // 边框颜色 （列表正常文字颜色，详情底色）
#define SHARE_COLOR [UIColor colorWithHex:@"#f6f6f6"]  // 白色（安装，打开，更新）
#define BANGTEXT_COLOR [UIColor colorWithHex:@"#999999"]
#define TLTIPS_COLOR [UIColor colorWithHex:@"#f84943"]
#define BACKGROUND_COLOR [UIColor colorWithHex:@"1889c9"] //连接中，安装中，下载中的背景色
#define INSCOMPLETEBACKGROUND_COLOR [UIColor colorWithHex:@"88eaf5"] // 下载完成，未安装的应用背景色为此颜色
#define BACKGROUNDCOLOR [UIColor colorWithHex:@"#f5f5f5"]
#define BOTTOM_BACKGROUNDCOLOR [UIColor colorWithHex:@"#f2f2f2"]

// 文字颜色
#define ESSENTIALTEXT_COLOR [UIColor colorWithHex:@"#333333"]

// Class
@interface UIColor (GetColor)

// 根据0~255的数字获取color
// 根据labelName获取color

// 根据十六进制获取color 是十六进制的数字 带#号的
+ (UIColor *)colorWithHex:(NSString *)hexColor;
+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)colorWithRandom6;
+ (UIColor *)colorWithRandom;

@end
