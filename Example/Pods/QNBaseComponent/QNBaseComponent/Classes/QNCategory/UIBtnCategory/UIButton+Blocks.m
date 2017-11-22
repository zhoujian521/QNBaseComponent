//
//  UIButton+Blocks.m
//  UIButtonBlock
//
//  Created by 姚琪 on 16/1/8.
//  Copyright © 2016年 chemao. All rights reserved.
//

#import "UIButton+Blocks.h"
#import <objc/runtime.h>

static const void *UIButtonTapActionBlockKek      = &UIButtonTapActionBlockKek;

@implementation UIButton (Blocks)

- (void)setTapedBlock:(UIButtonTapedBlock)tapedBlock {
    objc_setAssociatedObject(self, UIButtonTapActionBlockKek, tapedBlock, OBJC_ASSOCIATION_COPY);
}

- (UIButtonTapedBlock)tapedBlock {
    return objc_getAssociatedObject(self, UIButtonTapActionBlockKek);
}

- (void)buttonTapBlockWithControlEvents:(UIControlEvents)controlEvents action:(nullable UIButtonTapedBlock)block; {
    [self addTarget:self action:@selector(buttonTaped:) forControlEvents:controlEvents];
    if (block) {
        self.tapedBlock = block;
    }
}

- (void)buttonTaped:(id)sender {
    UIButton *button = (UIButton *)sender;
    UIButtonTapedBlock tapedblock = [button tapedBlock];
    if (tapedblock) {
        tapedblock(sender);
    }
}

@end

static const void *UISwitchTapActionBlockKek      = &UISwitchTapActionBlockKek;

@implementation UISwitch (Blocks)

- (void)setTapedBlock:(UISwitchTapedBlock)tapedBlock {
    objc_setAssociatedObject(self, UISwitchTapActionBlockKek, tapedBlock, OBJC_ASSOCIATION_COPY);
}

- (UISwitchTapedBlock)tapedBlock {
    return objc_getAssociatedObject(self, UIButtonTapActionBlockKek);
}

- (void)switchTapBlockWithControlEvents:(UIControlEvents)controlEvents action:(nullable UISwitchTapedBlock)block; {
    [self addTarget:self action:@selector(switchTaped:) forControlEvents:controlEvents];
    if (block) {
        self.tapedBlock = block;
    }
}

- (void)switchTaped:(id)sender {
    UISwitch *button = (UISwitch *)sender;
    UISwitchTapedBlock tapedblock = [button tapedBlock];
    if (tapedblock) {
        tapedblock(sender);
    }
}

@end
