//
//  NSString+RemoveEmoji.h
//  ChannelSoftWeMarketing
//
//  Created by BJQingniuJJ on 2017/11/22.
//  Copyright © 2017年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)

/**
 校验 【字符串中 是否包含 Emoji 表情】

 @return BOOL
 */
- (BOOL)isIncludingEmoji;


/**
 移除字符串中的 Emoji 表情

 @return NSString
 */
- (instancetype)removedEmojiString;

@end
