//
//  UIButton+CustomerBlocks.h
//  UIButtonBlock
//
//  Created by 姚琪 on 16/1/8.
//  Copyright © 2016年 chemao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CustomerBlocks)

@property (nonatomic, copy) void(^actionBlock)(id);

@end
