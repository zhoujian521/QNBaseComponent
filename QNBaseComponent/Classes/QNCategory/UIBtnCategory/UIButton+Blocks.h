//
//  UIButton+Blocks.h
//  UIButtonBlock
//
//  Created by 姚琪 on 16/1/8.
//  Copyright © 2016年 chemao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIButtonTapedBlock)(_Nullable id sender);

@interface UIButton (Blocks)

@property (nonatomic, copy, nullable) UIButtonTapedBlock tapedBlock;

- (void)buttonTapBlockWithControlEvents:(UIControlEvents)controlEvents action:(nullable UIButtonTapedBlock)block;

@end

typedef void(^UISwitchTapedBlock)(_Nullable id sender);

@interface UISwitch (Blocks)

@property (nonatomic, copy, nullable) UISwitchTapedBlock tapedBlock;

- (void)switchTapBlockWithControlEvents:(UIControlEvents)controlEvents action:(nullable UIButtonTapedBlock)block;

@end
