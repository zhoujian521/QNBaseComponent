//
//  UILabel+CalculateSize.m
//  Label的宽和高计算
//
//  Created by Mike on 15/12/9.
//  Copyright © 2015年 Mike. All rights reserved.
//

#import "UILabel+CalculateSize.h"

@implementation UILabel (CalculateSize)

/**
 *  使用前需要将text、font、preferredMaxLayoutWidth正确赋值,同时numberOfLines=0
 */
- (void)adjustsSizeDependOn_text_font_preferredMaxLayoutWidth {
    NSString *text = self.text;
    UIFont *font = self.font;
    CGFloat maxWidth = self.preferredMaxLayoutWidth;
    [self adjustsSizeWithText:text font:font maxWidth:maxWidth];
}

- (void)adjustsSizeDependOn_text_font_withWidth:(CGFloat)width {
    NSString *text = self.text;
    UIFont *font = self.font;
    CGFloat maxWidth = width;
    [self adjustsSizeWithText:text font:font maxWidth:maxWidth];
}

- (void)adjustsSizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    CGSize size = CGSizeZero;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        size = [text boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        size = [text sizeWithFont:font constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

/*  计算文本的高
 @param str   需要计算的文本
 @param font  文本显示的字体
 @param maxSize 文本显示的范围，可以理解为limit
 
 @return 文本占用的真实宽高
 */

-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

- (UILabel *)initWithText:(NSString *)text Font:(UIFont *)font textColor:(UIColor *)textColor {
    if (self = [super init]) {
        self.text = text;
        self.font = font;
        self.textColor = textColor;
    }
    return self;
}

@end
