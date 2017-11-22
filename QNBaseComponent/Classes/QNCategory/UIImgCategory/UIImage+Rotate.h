//
//  UIImage+Rotate.h
//
//  Created by Mike on 15/2/15.
//  Copyright © 2015年 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Rotate)
- (UIImage *)rotate:(UIImageOrientation)orient;
- (UIImage *)rotateImageIfNeeded;
@end;
