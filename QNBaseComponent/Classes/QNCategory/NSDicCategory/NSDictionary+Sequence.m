
//
//  NSDictionary+Sequence.m
//  NSDictionary
//
//  Created by BJQingniuJJ on 2017/8/14.
//  Copyright © 2017年 shuaijianjian. All rights reserved.
//

#import "NSDictionary+Sequence.h"

@implementation NSDictionary (Sequence)

- (NSString *)dictionarySequence {
    NSArray *allKeys = self.allKeys;
    NSArray *sortedAllKeys = [allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString * obj2) {
        return [obj1 compare:obj2 options:NSWidthInsensitiveSearch];
    }];
    
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortString in sortedAllKeys) {
        [valueArray addObject:[self objectForKey:sortString]];
    }
    
    NSMutableArray *signArray = [NSMutableArray array];
    for (int i = 0; i < sortedAllKeys.count; i++) {
        NSString *keyValueStr = [NSString stringWithFormat:@"%@=%@",sortedAllKeys[i],valueArray[i]];
        [signArray addObject:keyValueStr];
    }
//    NSLog(@"signArray => %@", signArray);
    
    NSString *dicSequence = [signArray componentsJoinedByString:@"&"];
//    NSLog(@"sign => %@",dicSequence);
    
    return dicSequence;
}




@end
