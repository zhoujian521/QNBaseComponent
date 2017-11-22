//
//  NSDictionary+Encode.m
//  AppHelperXQ
//
//  Created by Mike on 15/8/27.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "NSDictionary+Encode.h"
#import "NSString+Encryption.h"

@implementation NSDictionary (Encode)
- (NSString *)statisticsParameterEncode {
    NSArray *allKeys = self.allKeys;
    
    NSArray *sortedAllKeys = [allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString * obj2) {
//         WriteLogD("%@, %@", obj1, obj2);
        return [obj1 compare:obj2 options:NSWidthInsensitiveSearch];
    }];
    
//     WriteLogD("%@", sortedAllKeys);
    
    NSMutableString *strM = [[NSMutableString alloc] init];
    
    for (int i = 0; i < sortedAllKeys.count; i++) {
        id obj = self[sortedAllKeys[i]];
        [strM appendString:[obj description]];
    }
    
//     WriteLogD("%@", strM);
    
    NSData *data = [strM dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64 = [data base64EncodedStringWithOptions:0];
//     WriteLogD("%@", base64);
    
    NSString *md5 = [base64 md5String];
//     WriteLogD("%@", md5);
    
    return md5;
}
@end
