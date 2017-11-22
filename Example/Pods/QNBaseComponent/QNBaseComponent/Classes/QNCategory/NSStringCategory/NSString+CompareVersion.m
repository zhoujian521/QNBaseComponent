//
//  NSString+CompareVersion.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//

#import "NSString+CompareVersion.h"

@implementation NSString (CompareVersion)

// 比较版本 ，如果当前的大于version返回1 如果小于返回-1 如果相等返回0，注意“5.2.0”和“5.2”是相等的
- (NSInteger)compareVersion:(NSString*)version
{
    int result = 0;
    NSArray *vs0 = [self componentsSeparatedByString:@"."]; // 以"."为分隔符将version分解为数组
    NSArray *vs1 = [version componentsSeparatedByString:@"."];
    NSInteger maxSize = vs0.count > vs1.count ? vs0.count : vs1.count;
    for (int i = 0; i < maxSize; ++i) {
        int v0, v1;
        if (i >= vs0.count) {
            v0 = 0;
        } else {
            [[NSScanner scannerWithString:[vs0 objectAtIndex:i]] scanInt:&v0];
        }
        
        if (i >= vs1.count) {
            v1 = 0;
        } else {
            [[NSScanner scannerWithString:[vs1 objectAtIndex:i]] scanInt:&v1];
        }
        
        if (v0 < v1) {
            result = -1;
            break;
        } else if (v0 > v1) {
            result = 1;
            break;
        }
    }
    
    return result;
}

@end
