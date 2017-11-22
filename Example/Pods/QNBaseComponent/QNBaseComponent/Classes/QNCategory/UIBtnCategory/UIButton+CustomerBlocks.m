//
//  UIButton+CustomerBlocks.m
//  UIButtonBlock
//
//  Created by 姚琪 on 16/1/8.
//  Copyright © 2016年 chemao. All rights reserved.
//

#import "UIButton+CustomerBlocks.h"
#import <objc/runtime.h>

static const int block_key;

@interface CustomerButtonBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void(^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation CustomerButtonBlockTarget

- (id)initWithBlock:(void(^)(id sender))block {
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) {
        self.block(sender);
    }
}

@end

@implementation UIButton (CustomerBlocks)

- (void)setActionBlock:(void (^)(id))actionBlock {
    CustomerButtonBlockTarget *target = [[CustomerButtonBlockTarget alloc] initWithBlock:actionBlock];
    objc_setAssociatedObject(self, &block_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:@selector(invoke:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void (^)(id))actionBlock {
    CustomerButtonBlockTarget *target = objc_getAssociatedObject(self, &block_key);
    return target.block;
}

@end
