//
//  UILabel+CalculateSize.h
//  Label的宽和高计算
//
//  Created by Mike on 15/12/9.
//  Copyright © 2015年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CalculateSize)

- (void)adjustsSizeDependOn_text_font_preferredMaxLayoutWidth;

- (void)adjustsSizeDependOn_text_font_withWidth:(CGFloat)width;

-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

- (UILabel *)initWithText:(NSString *)text Font:(UIFont *)font textColor:(UIColor *)textColor;
@end
