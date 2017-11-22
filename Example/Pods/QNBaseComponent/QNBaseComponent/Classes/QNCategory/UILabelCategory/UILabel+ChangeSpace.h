//
//  UILabel+ChangeSpace.h
//  ChannelSoftWeMarketing
//
//  Created by BJQingniuJJ on 2017/9/7.
//  Copyright © 2017年 channelsoftios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChangeSpace)

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
