//
//  UIBarButtonItem+Item.m
//  Project
//
//  Created by Jason_Mac on 14/9/7.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

#define K_BUTTON_MARGIN (8.0)

@implementation UIBarButtonItem (Item)

+ (instancetype)barButtonItemWithImage:(UIImage *)image highLightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.backgroundColor = [UIColor clearColor];
    
    [barButton setImage:image forState:UIControlStateNormal];
    [barButton setImage:image forState:UIControlStateHighlighted];
    
    [barButton addTarget:target action:action forControlEvents:controlEvents];
    
    [barButton sizeToFit];
    
    barButton.frame = CGRectMake(0, 0, 60.0f, 40.0f);
    barButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20.0f, 0, 20.0f);
    
    return [[UIBarButtonItem alloc] initWithCustomView:barButton];
}

+ (instancetype)barButtonItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {

    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSInteger fontSize = width / 26.f;
    [barButton setTitle:title forState:UIControlStateNormal];
    barButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    barButton.layer.cornerRadius = 5.f;
    barButton.layer.borderWidth = 1.0;
    barButton.layer.borderColor = tintColor.CGColor;
    [barButton setTitleColor:tintColor forState:UIControlStateNormal];
    [barButton addTarget:target action:action forControlEvents:controlEvents];
    [barButton sizeToFit];
    
    CGRect frame = barButton.frame;
    frame.size.width = barButton.frame.size.width + 2 * K_BUTTON_MARGIN;
    barButton.frame = frame;
    
    barButton.titleEdgeInsets = UIEdgeInsetsMake(0, K_BUTTON_MARGIN, 0, K_BUTTON_MARGIN);
    return [[UIBarButtonItem alloc] initWithCustomView:barButton];
}

+ (instancetype)barButtonWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [barButton setTitle:title forState:UIControlStateNormal];
    [barButton setTitleColor:tintColor forState:UIControlStateNormal];
    [barButton addTarget:target action:action forControlEvents:controlEvents];
    barButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [barButton sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:barButton];
}

@end
