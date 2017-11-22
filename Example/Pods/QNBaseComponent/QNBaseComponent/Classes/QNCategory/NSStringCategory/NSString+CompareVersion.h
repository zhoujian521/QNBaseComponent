//
//  NSString+CompareVersion.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//

#import <Foundation/Foundation.h>

@interface NSString (CompareVersion)

/**
 比较版本 ，如果当前的大于version返回1 如果小于返回-1 如果相等返回0，注意“5.2.0”和“5.2”是相等的
 
 @param version 待比较版本
 @return 1 0 -1
 */
- (NSInteger)compareVersion:(NSString*)version;

@end
