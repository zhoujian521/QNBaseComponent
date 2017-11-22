//
//  NSDictionary+SafeAccess.h
//  AppHelperXQ
//
//  Created by Mike on 15/9/9.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeAccess)

// 如果从来不存入NSNull， 那么这个方法毫无意义
- (id)safeObjectForKey:(id)key;

@end
