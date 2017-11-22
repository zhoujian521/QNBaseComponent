//
//  UIColor+XQColor.m
//  AppHelperXQ
//
//  Created by Mike on 15/7/25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "UIColor+GetColor.h"

@implementation UIColor (GetColor)
+ (UIColor *)colorWithHex:(NSString *)hexColor;
{
    return [self colorWithHex:hexColor alpha:1];
}

+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha
{
    // String should be 6 or 7 characters if it includes '#'
    if ([hexColor length]  < 6)
        return nil;
    
    // strip # if it appears
    if ([hexColor hasPrefix:@"#"])
        hexColor = [hexColor substringFromIndex:1];
    
    // if the value isn't 6 characters at this point return
    // the color black
    if ([hexColor length] != 6)
        return nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [hexColor substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [hexColor substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [hexColor substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (UIColor *)colorWithRandom6
{
    UIColor *color = nil;
    
    switch(arc4random() % 6)
    {
        case 0: color = [UIColor colorWithHex:@"F8661F"];break;
        case 1: color = [UIColor colorWithHex:@"E9C21F"];break;
        case 2: color = [UIColor colorWithHex:@"4CBA6A"];break;
        case 3: color = [UIColor colorWithHex:@"2181CB"];break;
        case 4: color = [UIColor colorWithHex:@"2CA7EA"];break;
        case 5: color = [UIColor colorWithHex:@"87B52E"];break;
            
        default: break;
    }
    
    return color;
}

+ (UIColor *)colorWithRandom {
    return [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}

@end
