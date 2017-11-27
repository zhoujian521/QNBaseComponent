//
//  ChatMsgTool.m
//  XMPPUI
//
//  Created by BJQingniuJJ on 17/3/6.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import "ChatMsgTool.h"
#import "QNFileHelper.h"
//#import <AudioToolbox/AudioToolbox.h>
//#import <AVFoundation/AVFoundation.h>

@implementation ChatMsgTool
//BOOL _isAlivibale;
#pragma mark --- 语音相关 ---
//生成录音文件路径
+ (NSString*)getPathByFileName:(NSString *)fileName ofType:(NSString *)type{
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];;
    NSString *path = [directory stringByAppendingPathComponent:@"WYXIMCache/WYXVoiceCache"];
    [QNFileHelper createDirectoryIfNotExists:path];

    NSString *fileDirectory = [[[path stringByAppendingPathComponent:fileName]
                                stringByAppendingPathExtension:type]
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return fileDirectory;
}

+ (NSString*)getImagePathWithfileName:(NSString *)fileName ofType:(NSString *)type{
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];;
    NSString *path = [directory stringByAppendingPathComponent:@"WYXIMCache/WYXImageCache"];
    [QNFileHelper createDirectoryIfNotExists:path];
    NSString *fileDirectory = [[[path stringByAppendingPathComponent:fileName]
                                stringByAppendingPathExtension:type]
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    return fileDirectory;
}

//保存图片
+ (NSString *)saveImageDocuments:(UIImage *)image msgId:(NSString *)msgId colleagueId:(NSString *)colleagueId{
    //拿到图片
    UIImage *saveImage = image;
    //设置一个图片的存储路径
    NSString *imagePath = [self getImagePathWithfileName:msgId ofType:@"png"];

    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(saveImage) writeToFile:imagePath atomically:YES];
    return imagePath;
}

























//获取录音文件路径 区别添加。wav
+ (NSString *)documentPathWith:(NSString *)fileName{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
}





#warning mark --- 不再使用 ---
+ (NSString *)getImagePathWithMsgId:(NSString *)msgId colleagueId:(NSNumber *)colleagueId{
    //设置一个图片的存储路径
    NSString *subPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];

    //文件夹名
    NSString *fileName = [ChatMsgTool tableNameWithColleagueId:colleagueId];
    //文件夹路径
    NSString *filePath = [subPath stringByAppendingPathComponent:fileName];

    NSString *imagePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",msgId]];
    return imagePath;
}



#pragma mark - 获取音频文件信息
//+ (NSString *)getVoiceFileInfoByPath:(NSString *)aFilePath convertTime:(NSTimeInterval)aConTime{
//
//    NSInteger size = [self getFileSize:aFilePath]/1024;
//    NSString *info = [NSString stringWithFormat:@"文件名:%@\n文件大小:%ldkb\n",aFilePath.lastPathComponent,(long)size];
//
//    NSRange range = [aFilePath rangeOfString:@"wav"];
//    if (range.length > 0) {
//        AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL URLWithString:aFilePath] error:nil];
//        info = [info stringByAppendingFormat:@"文件时长:%f\n",play.duration];
//    }
//
//    if (aConTime > 0)
//        info = [info stringByAppendingFormat:@"转换时间:%f",aConTime];
//    return info;
//}

#pragma mark - 获取文件大小
+ (NSInteger) getFileSize:(NSString*) path{
    NSFileManager * filemanager = [[NSFileManager alloc]init];
    if([filemanager fileExistsAtPath:path]){
        NSDictionary * attributes = [filemanager attributesOfItemAtPath:path error:nil];
        NSNumber *theFileSize;
        if ( (theFileSize = [attributes objectForKey:NSFileSize]) )
            return  [theFileSize intValue];
        else
            return -1;
    }
    else{
        return -1;
    }
}

//根据录音文件名获取录音文件地址
+ (NSString *)voiceFilePathWithVoiceFileName:(NSString *)fileName{
    NSString *kCache = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path =  [kCache stringByAppendingPathComponent:fileName];
    return path;
}

//获取当前时间戳
+ (NSString *)getCurentTime{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *time = [NSString stringWithFormat:@"%.0f", a];
    return time;
}


//获取MsgId
+(NSString *)getCurentMsgIdWithColleagueId:(NSString *)colleagueId {
                //    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:KloginDataDic];
                //    NSString *entId = userDic[@"entNum"];
                //    NSString *useId = userDic[@"username"];
                //    NSString *userJid = [NSString stringWithFormat:@"%@_%@",entId,useId];
                //
                //    NSString *subUserJidMsgId = [userJid stringByAppendingString:@"_"];
                //
                //    NSString *msgId = [subUserJidMsgId stringByAppendingString:[self getCurentTime]];
                //#pragma -- mark -- md5加密 -- 在此处 转换 ---
                //    return msgId;
    return @"  ";
}


// 读取并存贮到相册
+ (UIImage *)getDocumentImageWithMsgId:(NSString *)msgId colleagueId:(NSString *)colleagueId {
    // 读取沙盒路径图片
    NSString *imagePath = [self getImagePathWithfileName:msgId ofType:@"png"];
    // 拿到沙盒路径图片
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imagePath];
    // 图片保存相册
//    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    return image;
}



+ (NSString *)tableNameWithColleagueId:(NSNumber *)colleagueId{
        //    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:KloginDataDic];
        //    NSString *entId = userDic[@"entNum"];
        //    NSString *useId = userDic[@"username"];
        //    NSString *userJid = [NSString stringWithFormat:@"%@_%@",entId,useId];
        //
        //    NSString *tableId = [NSString stringWithFormat:@"%@_%@",userJid,colleagueId];
        //    NSString *tableName = [NSString stringWithFormat:@"colleagueTable_%@",tableId];
        //
        //    return tableName;
    return @" ";
}

//是否需要添加消息超时提醒
+ (BOOL)isNeedAddTimeoutRemindWithMsgTime:(NSString *)msgTime{
    NSDate *msgDate = [self getDateWithStr:msgTime];
    NSDate *nowDate = [NSDate date];
    NSTimeInterval interval = [nowDate timeIntervalSinceDate:msgDate];
    if (interval > 60 * 3) {
        return YES;
    }
    return NO;
}

//信息超时提醒信息
+ (NSString *)intervalSinceNowWithMsgtime:(NSString *)msgTime{

    NSDate *msgDate = [self getDateWithStr:msgTime];
    NSDate *nowDate = [NSDate date];
    NSTimeInterval interval = [nowDate timeIntervalSinceDate:msgDate];

    NSString *nowDateString = [self getStrWithDate:nowDate];

    NSString *nowYear = [nowDateString substringWithRange:NSMakeRange(0, 4)];
    NSString *nowMonth = [nowDateString substringWithRange:NSMakeRange(5, 2)];
    NSString *nowDay = [nowDateString substringWithRange:NSMakeRange(8, 2)];

    NSString *modelYear = [msgTime substringWithRange:NSMakeRange(0, 4)];
    NSString *modelMonth = [msgTime substringWithRange:NSMakeRange(5, 2)];
    NSString *modelDay = [msgTime substringWithRange:NSMakeRange(8, 2)];

    NSInteger yearTime = [nowYear integerValue] - [modelYear integerValue];
    NSInteger monthTime = [nowMonth integerValue] - [modelMonth integerValue];
    NSInteger dayTime = [nowDay integerValue] - [modelDay integerValue];


    NSString *string = nil;
    if (interval <= 60 * 3) {
        string = [msgTime substringWithRange:NSMakeRange(11, 5)];
    }
    else if (interval > 60 * 3 & interval <= 60 * 60 *24 & dayTime == 0){
        string = [msgTime substringWithRange:NSMakeRange(11, 5)];
    }
    else if (interval > 60 * 3 & interval <= 60 * 60 *24 & dayTime == 0){
        string = [msgTime substringWithRange:NSMakeRange(11, 5)];
    }

    else if ((dayTime == 1 & interval <= 60 *60 *24 * 2) || (dayTime != 1 & [nowDay integerValue] != 2 & monthTime == 1 & interval <= 60 *60 *24 * 2) || (dayTime != 1 & [nowDay integerValue] != 2 & monthTime != 1 & yearTime == 1 & interval <= 60 *60 *24 * 2)){
        NSString *timestr = [msgTime substringWithRange:NSMakeRange(11, 5)];
        string = [NSString stringWithFormat:@"昨天 %@",timestr];
    }
    else {
        string = [msgTime substringWithRange:NSMakeRange(5, 11)];
    }
    return string;
}

+ (NSString *)getStrWithDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSDate *)getDateWithStr:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:str];
    return date;
}

#pragma mark----  判断是否允许使用相册
+ (BOOL)isAlbumOpen{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark----  判断是否允许使用麦克风
//+ (BOOL)isAudioOpen{
//    if ([[AVAudioSession sharedInstance] respondsToSelector:@selector(requestRecordPermission:)]) {
//        _isAlivibale = YES;
//        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
//            if (granted) {
//                _isAlivibale = YES;
//            }else {
//                _isAlivibale = NO;
//            }
//        }];
//    }
//    return _isAlivibale;
//}


#pragma mark---- 判断手机型号
+(int)isIphone5later{
    if ([UIScreen mainScreen].bounds.size.height > 480.0) {
        return 88;
    }
    return 0;

}
+(BOOL)isIphone6later{
    if ([UIScreen mainScreen].bounds.size.height > 480.0+88) {
        return YES;
    }else{
        return NO;
    }

}

+(int)isIOS7later{
    if ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 7) {
        return 20;
    }
    return 0;
}

+(BOOL)isIOS8later{
    if ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 8) {
        return YES;
    }
    return NO;
}


+(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message ViewController:(UIViewController *)viewController{

    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertC addAction:action];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:nil];
}

@end
