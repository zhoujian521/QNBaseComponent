//
//  WMMyTool.m
//  ChannelSoftWeMarketing
//
//  Created by channelsoftios on 16/8/19.
//  Copyright © 2016年 channelsoftios. All rights reserved.
//

#import "WMMyTool.h"
//#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//#import <CoreTelephony/CTCarrier.h>
//#import <sys/utsname.h>

//#import "WMCusModel.h"
//#import "WMCusHelper.h"
//#import "NSString+Category.h"
//#import "NSString+Hash.h"

@implementation WMMyTool

+ (NSString *)getStrWithDate:(NSDate *)date formatter:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)calculateTimeDisparityWithSecond:(NSInteger)countSecond {
    if (countSecond < 60) {
        return [NSString stringWithFormat:@"%ld 秒",(long)countSecond];
    }
    else if (60 < countSecond && countSecond < 60 * 60) {
        NSInteger minate = countSecond/60;
        NSInteger second = countSecond%60;
        return [NSString stringWithFormat:@"%ld 分 %ld 秒",(long)minate,(long)second];
    }
    else{
        NSInteger hour   = countSecond / (60*60);
        NSInteger other  = countSecond % (60*60);
        NSInteger minate = other / 60;
        NSInteger second = other % 60;
        
        return [NSString stringWithFormat:@"%ld 小时 %ld 分 %ld 秒",(long)hour,minate,(long)second];
    }
}


// Json存储
+ (void)jsonWriteToFileWithData:(NSData *)data andFileName:(NSString *)name {
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:name];//@"loginJsonFile.json"
    //==写入文件
     NSLog(@"%@",[data writeToFile:Json_path atomically:YES] ? @"Succeed":@"Failed");
}

// Json读取
+ (NSDictionary *)jsonGetFromFileWithName:(NSString *)name {
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:name];//@"loginJsonFile.json"
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject
    NSDictionary *JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:nil];
     NSLog(@"%@",JsonObject);//打印json字典
    return JsonObject;
}

#pragma mark - StringEncoding
+ (NSString *)strUrlEncoding:(NSString *)urlStr {
   return [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%<>[\\]^`{|}\"]+"].invertedSet];
}

#pragma mark - 文件的类型
// size = 0 小图； size = 1 为 中图； size = 2 为大图
+ (NSString *)selectTextTypeWithTextName:(NSString *)textName size:(NSInteger)size {
    
    NSArray *suffix = [textName componentsSeparatedByString:@"."];
    NSString *strSuf = @"txt";
    if (suffix.count > 1) {
        strSuf = suffix.lastObject;
    }
    
    if ([strSuf.lowercaseString isEqualToString:@"pdf"]) {
        return [self fileComponent:@"pdf" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"txt"]) {
        return [self fileComponent:@"txt" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"ppt"]) {
        return [self fileComponent:@"ppt" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"doc"]) {
        return [self fileComponent:@"word" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"docx"]) {
        return [self fileComponent:@"word" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"excel"]) {
        return [self fileComponent:@"excel" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"xlsx"]) {
        return [self fileComponent:@"excel" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"png"]) {
        return [self fileComponent:@"png" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"gif"]) {
        return [self fileComponent:@"gif" fileSize:size];
    }
    else if ([strSuf.lowercaseString isEqualToString:@"jpg"]) {
        return [self fileComponent:@"jpg" fileSize:size];
    }
    else {
        return [self fileComponent:@"word" fileSize:size];
    }
    
    return nil;
}

//Json删除
+ (void)jsonRemoveFromFileWithName:(NSString *)name {
    // 文件存放目录
    NSString *pngDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *FileDir = [NSString stringWithFormat:@"%@/AnnexFiles", pngDir];
    NSError *err;
    [fileMgr createDirectoryAtPath:FileDir withIntermediateDirectories:YES attributes:nil error:&err];
    NSString *FileFullPath = [FileDir stringByAppendingPathComponent:name];//@"loginJsonFile.json"
    BOOL bRet = [fileMgr fileExistsAtPath:FileFullPath];
    if (bRet) {
        //
        NSError *err;
        [fileMgr removeItemAtPath:FileFullPath error:&err];
         NSLog(@"删除本地json");
    }
}
    
+ (NSString *)fileComponent:(NSString *)fileComponent fileSize:(NSInteger)size {
    if (size == 0) {
        return  [NSString stringWithFormat:@"%@_xiao",fileComponent];;
    }
    if (size == 1) {
        return [NSString stringWithFormat:@"%@",fileComponent];
    }
    if (size == 2) {
        return fileComponent;
    }
    return [NSString stringWithFormat:@"%@",fileComponent];
}

//+ (BOOL)isSIMInstalled
//{
//    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
//
//    if (!carrier.isoCountryCode) {
//         NSLog(@"No sim present Or No cellular coverage or phone is on airplane mode.");
//        return NO;
//    }
//    return YES;
//}

#pragma mark---- 手机号码验证
+ (BOOL) isAllowedMobile:(NSString *)mobile
{
    //手机号以13，15，18，17开头，八个数字字符
    NSString *phoneRegex = @"^((17[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL) isAllowedSercet:(NSString *)secretStr {
    NSString *sectetRegex = @"^[a-zA-Z0-9_]{6,15}$";
    NSPredicate *sectetTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",sectetRegex];
    
    return [sectetTest evaluateWithObject:secretStr];

}



/**
 格式化输出转换
 
 @param string 要打印的字符串
 @return const char 格式化输出类型
 */
+ (const char*)charFormatWithString:(NSString *)string{
    return [string cStringUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    return [self logStr:[dic description]];
}

+ (NSString *)logStr:(NSString *)urlStr {
    if (![urlStr length]) {
        return nil;
    }
    NSString *tempStr1 =
    [urlStr stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListWithData:tempData
                                              options:NSPropertyListImmutable
                                               format:NULL
                                                error:NULL];
    return str;
}

+ (NSString *)titleName:(NSInteger)type {
    NSString *title = @"";
    
    switch (type) {
        case 0:
            title = @"未联系";
            break;
        case 1:
            title = @"待联系";
            break;
        case 2:
            title = @"可跟进";
            break;
        case 3:
            title = @"无意向";
            break;
        case 4:
            title = @"无效号码";
            break;
        case 5:
            title = @"同行";
            break;
        default:
            title = @"未知";
            break;
    }
    
    return title;
}


+ (NSString *)titleShortName:(int)type {
    NSString *title = @"";
    
    switch (type) {
        case 0:
            title = @"未";
            break;
        case 1:
            title = @"待";
            break;
        case 2:
            title = @"跟";
            break;
        case 3:
            title = @"无";
            break;
        case 4:
            title = @"无效";
            break;
        case 5:
            title = @"同行";
            break;
        default:
            title = @"";
            break;
    }
    
    return title;
}

+ (NSString *)getCustomerBackgroundColorWithCusGradeIndex:(int)index {
    switch (index) {
        case 0:
            return @"#ec3f31";
        case 1:
            return @"#41b0e8";
        case 2:
            return @"#4cb050";
        case 3:
            return @"#f6ab1e";
        case 4:
            return @"#c7c6c4";
        case 5:
            return @"#0958fd";
        default:
            return @"#ec3f31";
    }
    return @"#ec3f31";
}

#pragma mark - 拼接token
+ (NSString *)signMD5WithToken:(NSString *)checksum dicSequence:(NSString *)dicSequence {
    NSString *signStr = [NSString stringWithFormat:@"%@&checkSum=%@",dicSequence,checksum];
//    //    NSLog(@"待加签字符串：=》%@",signStr);
//    NSString *signmd5 = [signStr md5String];
//    //    NSLog(@"加签小写字符串：=》%@",signmd5);
//    NSString *signMD5 = [signmd5 uppercaseString];
//    //    NSLog(@"加签大写字符串：=》%@",signMD5);
    return signStr;
}



+ (void)setLocalNotificationSound:(BOOL)isOn shake:(BOOL)isShakeOn {
    
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification * loc in array) {
        if (isOn) {
            loc.soundName = @"serv_fail.mp3";
        }
        else {
            if (isShakeOn) {
                loc.soundName = @"nil.mp3";
            }
            else {
                loc.soundName = nil;
            }
        }

       // [[UIApplication sharedApplication] cancelLocalNotification:loc];
    }
}


+ (NSInteger)fileSize:(NSString *)path {
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL dir = NO;
    BOOL exists = [mgr fileExistsAtPath:path isDirectory:&dir];
    
    if (exists == NO) return 0;
    
    if (dir){
        
        NSArray *subpaths = [mgr subpathsAtPath:path];
        
        NSInteger totalByteSize = 0;
        for (NSString *subpath in subpaths){
            
            NSString *fullSubPath = [path stringByAppendingPathComponent:subpath];
            
            BOOL dir = NO;
            [mgr fileExistsAtPath:fullSubPath isDirectory:&dir];
            
            if (dir == NO){
                
                NSDictionary *attr = [mgr attributesOfItemAtPath:fullSubPath error:nil];
                totalByteSize += [attr[NSFileSize] integerValue];
            }
        }
        return totalByteSize/1024/1024;
    }
    else {//是文件
        NSDictionary *attr = [mgr attributesOfItemAtPath:path error:nil];
        return [attr[NSFileSize] integerValue]/1024/1024;
    }
}


+ (BOOL)deleteLocalMemoryWithPath:(NSString *)path fileName:(NSString *)fileName {
    return [[NSFileManager defaultManager] removeItemAtPath:[path stringByAppendingPathComponent:fileName] error:nil];
}



//+ (BOOL)clearLocalMemory {
//    
//    NSString *path = [WMCusHelper rootPath];
//    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
//
//    BOOL res;
//    for (NSString *fileName in enumerator) {
//        res = [self deleteLocalMemoryWithPath:path fileName:fileName];
//        NSLog(@"res::%d",res);
//    }
//
//    return YES;
//}
//
//
//+ (NSString *)getCorrectPhoneNumbeWithCustomerRoster:(WMCusModel *)customerRoster {
//    // 匿号标识 1-正常显示；2-匿号
//    if ([customerRoster.hiddenPhone integerValue] == 1) {
//        return customerRoster.hostNum;
//    }
//    return [customerRoster.hostNum stringSecret];
//}

@end
