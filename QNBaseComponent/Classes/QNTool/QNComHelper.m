//
//  QNComHelper.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/23.
//

#import "QNComHelper.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <sys/utsname.h>

// 判断是否为iOS7
#define iOS7_OR_Later ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@implementation QNComHelper
BOOL _isAlivibale;

/**
 校验是否允许使用麦克风
 
 @return BOOL
 */
+ (BOOL)isAudioOpen{
    if ([[AVAudioSession sharedInstance] respondsToSelector:@selector(requestRecordPermission:)]) {
        _isAlivibale = YES;
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            if (granted) {
                _isAlivibale = YES;
            }else {
                _isAlivibale = NO;
            }
        }];
    }
    return _isAlivibale;
}


/**
 校验是否允许使用照相机
 
 @return BOOL
 */
+ (BOOL)isCameraOpen{
//    判断iOS7的宏，没有就自己写个，下边的方法是iOS7新加的，7以下调用会报错
    if(iOS7_OR_Later){
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus != AVAuthorizationStatusAuthorized){
            return NO;
        }
    }
    return YES;
}

/**
 校验是否允许使用相册
 
 @return BOOL
 */
+ (BOOL)isAlbumOpen{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}


/**
 校验【当前 某】控制器是否正在显示
 
 @param viewController 【当前 某】控制器
 @return BOOL
 */
+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController{
    return (viewController.isViewLoaded && viewController.view.window);
}

/**
 iOS 判断手机型号
 
 @return 手机型号
 */
+ (NSString *)iphoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];


    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";

    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";

    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";

    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";

    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";

    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";

    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";

    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";

    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";

    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";

    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";

    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";

    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";

    if ([platform isEqualToString:@"iPhone10,1"])  return @"iPhone 8";

    if ([platform isEqualToString:@"iPhone10,4"])  return @"iPhone 8";

    if ([platform isEqualToString:@"iPhone10,2"])  return @"iPhone 8 Plus";

    if ([platform isEqualToString:@"iPhone10,5"])  return @"iPhone 8 Plus";

    if ([platform isEqualToString:@"iPhone10,3"])  return @"iPhone X";

    if ([platform isEqualToString:@"iPhone10,6"])  return @"iPhone X";

    return platform;
}




//获取 高度固定式->字符串的宽度

+ (CGFloat )widthWithText:(NSString *)value fontSize:(CGFloat )fontSize height:(CGFloat)height{
    UIFont *font = [UIFont boldSystemFontOfSize:fontSize];
    CGRect rect = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height - 5.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font}context:nil];
    return rect.size.width ;
}

//获取 高度固定式->字符串的宽度
+ (CGFloat )heightWithText:(NSString *)value fontSize:(CGFloat )fontSize width:(CGFloat)width{
    UIFont *font = [UIFont boldSystemFontOfSize:fontSize];
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width - 5.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font}context:nil];
    return rect.size.height + 10.0f;
}

+ (NSString *)substringWithText:(NSString *)text rangetext:(NSString *)subtext{
    NSMutableString *muString = [[NSMutableString alloc] initWithString:text];
    // // 先确定要删除的字符的范围(位置，长度)
    NSRange range = [muString rangeOfString:subtext];
    // 调用删除字符方法
    [muString deleteCharactersInRange:range];
    return muString;
}

/**
 提性设置相关
 
 @param isOn 声音开关
 @param isShakeOn 震动开关
 */

+ (void)setLocalNotificationSound:(BOOL)isOn shake:(BOOL)isShakeOn {
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification * loc in array) {
        if (isOn) {
            loc.soundName = @"serv_fail.mp3";
        } else {
            if (isShakeOn) {
                loc.soundName = @"nil.mp3";
            } else {
                loc.soundName = nil;
            }
        }
        // [[UIApplication sharedApplication] cancelLocalNotification:loc];
    }
}



@end
