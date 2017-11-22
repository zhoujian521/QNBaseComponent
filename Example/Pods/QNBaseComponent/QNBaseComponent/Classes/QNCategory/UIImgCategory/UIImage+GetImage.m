//
//  UIImage+GetImage.m
//  koudaiAppstore
//
//  Created by Mike on 15/11/16.
//  Copyright © 2015年 Mike. All rights reserved.
//

#import "UIImage+GetImage.h"
#import "UIColor+GetColor.h"
#import <ImageIO/CGImageSource.h>

@implementation UIImage (GetImage)

//+ (UIImage *)imageWithLocalName:(NSString *)name {
//    
//    UIImage *image = [UIImage imageWithContentsOfFile:[RESOURCE_LOCAL_FOLDER stringByAppendingPathComponent:name]];
//    return image;
//}
//
//+ (UIImage *)imageWithName:(NSString *)name {
//    
//    NSString *imageFile = name;
//    if (!IOS8_OR_LATER) {
//        imageFile = [NSString stringWithFormat:@"%@@2x.png",name];
//    }
//    
//    UIImage *image = [UIImage imageWithContentsOfFile:[RESOURCE_BUNDLE_PATH stringByAppendingPathComponent:imageFile]];
//    if (!image) {
//        image = [UIImage imageWithContentsOfFile:[RESOURCE_BUNDLE_PATH stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@2x.jpg",name]]];
//    }
//    
//    if (!image) {
//        image = [[UIImage alloc] init];
//    }
//    
//    return image;
//}
//
//+ (UIImage *)JPGImageWithName:(NSString *)image {
//    NSString *imageFile = image;
//    if ([image pathExtension].length == 0) {
//        if (IOS8_OR_LATER) {
//            imageFile = [image stringByAppendingPathExtension:@"jpg"];
//        } else {
//            imageFile = [NSString stringWithFormat:@"%@.jpg",image];
//        }
//    }
//    NSString *filePath = [RESOURCE_BUNDLE_PATH stringByAppendingPathComponent:imageFile];
//    UIImage * img = [UIImage imageWithContentsOfFile:filePath];
//    
//    if (!img) {
//        
//        //        DDLogError(@"image is nil");
//    }
//    return img;
//}
//
//+ (NSData *)GIFImageWithName:(NSString *)image {
//    if ([image pathExtension].length == 0) {
//        image = [image stringByAppendingPathExtension:@"gif"];
//    }
//    
//    NSString  *filePath = [[NSBundle mainBundle] pathForResource:[RESOURCE_BUNDLE_NAME stringByAppendingPathComponent:image] ofType:nil];
//    
//    NSData  *imageData = [NSData dataWithContentsOfFile:filePath];
//    return imageData;
//}
//
//+ (NSArray *)imagesArrayWithGIFData:(NSData *)gifData imageScale:(ImageScale)imageScale {
//    if (gifData == nil) {
//        return nil;
//    }
//    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)gifData, NULL);
//    size_t count = CGImageSourceGetCount(source);
//    
//    NSMutableArray *imagesArrM = [[NSMutableArray alloc] initWithCapacity:count];
//    
//    if (count <= 1) {
//        return @[[[UIImage alloc] initWithData:gifData]];
//    }
//    
//    for (size_t i = 0; i < count; i++) {
//        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, i, NULL);
//        if (imageRef) {
//            UIImage *image = [UIImage imageWithCGImage:imageRef scale:imageScale orientation:0];
//            [imagesArrM addObject:image];
//        }
//        CGImageRelease(imageRef);
//    }
//    CFRelease(source);
//    return imagesArrM.copy;
//}
//
//- (UIImage *)scaledToSize:(CGSize)newSize {
//    
//    CGFloat width  = newSize.width;
//    CGFloat height = newSize.height;
//    
//    CGFloat bitsPerComponent = CGImageGetBitsPerComponent(self.CGImage);
//    CGFloat bytesPerRow = CGImageGetBytesPerRow(self.CGImage);
//    CGColorSpaceRef colorSpace = CGImageGetColorSpace(self.CGImage);
//    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(self.CGImage);
//    
//    CGContextRef context = CGBitmapContextCreate(nil, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
//    
//    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
//    
//    CGContextDrawImage(context, CGRectMake(0,0,width,height), self.CGImage);
//    
//    return [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
//}
//

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    // 使用颜色创建UIImage
    CGSize imageSize = CGSizeMake(size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [[UIColor colorWithHex:@"#1d836f"] set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}

- (UIImage *)imageWithColor:(UIColor *)color{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}


@end
