//
//  UIImage+GetImage.h
//  koudaiAppstore
//
//  Created by Mike on 15/11/16.
//  Copyright © 2015年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImageScale) {
    ImageScaleDependSystem = 0,
    ImageScaleOneFold = 1,
    ImageScaleTwoFold,
    ImageScaleThreeFold
};

@interface UIImage (GetImage)

//+ (UIImage *)imageWithLocalName:(NSString *)name;
//+ (UIImage *)imageWithName:(NSString *)name;
//+ (UIImage *)JPGImageWithName:(NSString *)image;
//+ (NSData *)GIFImageWithName:(NSString *)image;
//+ (NSArray *)imagesArrayWithGIFData:(NSData *)gifData imageScale:(ImageScale)imageScale;
//- (UIImage *)scaledToSize:(CGSize)newSize;
//+ (UIImage *)getTheLaunchImage;

// 纯色背景
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
