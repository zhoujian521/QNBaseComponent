//
//  NSArray+Json.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//

#import "NSArray+Json.h"

@implementation NSArray (Json)

- (NSString *)jsonString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return str;
}

@end
