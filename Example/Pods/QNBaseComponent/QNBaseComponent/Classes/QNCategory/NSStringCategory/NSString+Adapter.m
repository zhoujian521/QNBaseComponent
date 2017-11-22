//
//  NSString+Adapter.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//  

#import "NSString+Adapter.h"


@implementation NSString (Adapter)

/**
 根据maxSize计算字符串size
 
 @param maxSize 最大区域
 @param font 字体
 @return 字符串size
 */
- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

@end
