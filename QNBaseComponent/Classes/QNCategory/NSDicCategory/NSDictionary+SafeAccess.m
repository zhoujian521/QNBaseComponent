//
//  NSDictionary+SafeAccess.m
//  AppHelperXQ
//
//  Created by Mike on 15/9/9.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "NSDictionary+SafeAccess.h"

@implementation NSDictionary (SafeAccess)

- (id)safeObjectForKey:(id)key
{
    id result=[self objectForKey:key];
    
    if ([result isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return result;
}
@end
