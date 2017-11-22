//
//  NSString+Adapter.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//  ZJ:【字符串 适配器】

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSString (Adapter)

/**
 根据maxSize计算字符串size

 @param maxSize 最大区域
 @param font 字体
 @return 字符串size
 */
- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

@end
