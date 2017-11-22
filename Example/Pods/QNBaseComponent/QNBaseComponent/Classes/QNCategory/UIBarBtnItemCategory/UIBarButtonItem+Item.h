//
//  UIBarButtonItem+Item.h
//  Project
//
//  Created by Jason_Mac on 14/9/7.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (instancetype)barButtonItemWithImage:(UIImage *)image highLightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

+ (instancetype)barButtonItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

+ (instancetype)barButtonWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
