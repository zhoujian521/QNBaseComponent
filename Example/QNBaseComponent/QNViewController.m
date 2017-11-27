//
//  QNViewController.m
//  QNBaseComponent
//
//  Created by shuaijianjian on 11/20/2017.
//  Copyright (c) 2017 shuaijianjian. All rights reserved.
//

#import "QNViewController.h"
#import "NSString+Check.h"
#import "QNSessionManager.h"


@interface QNViewController ()
@property (nonatomic, strong) QNSessionManager *sessionManager;

@end

@implementation QNViewController

- (void)viewDidLoad{
    NSString *aa = @"1232dsd";
    [aa isValidateIDNumber];
    
    
    self.sessionManager = [[QNSessionManager alloc] init];
    [self.sessionManager request:RequestTypePost urlStr:@"" parameter:nil success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end
