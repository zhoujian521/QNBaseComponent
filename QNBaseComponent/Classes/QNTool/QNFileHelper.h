//
//  QNFileHelper.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/22.
//  ZJ:【青牛->基础组件->文件处理相关】

#import <Foundation/Foundation.h>

@interface QNFileHelper : NSObject

/**
 如果目录不存在, 则创建
 @param path 路径
 @return 是否创建成功
 */
+ (BOOL)createDirectoryIfNotExists:(NSString *)path;

/**
 文件是否存在
 @param path 路径
 @return 是否存在
 */
+ (BOOL)fileExistsAtPath:(NSString *)path;

/**
 文件大小
 @param path 路径
 @return 文件大小
 */
+ (long long)fileSizeAtPath:(NSString *)path;

/**
 删除文件
 @param path 删除指定文件
 */
+ (void)removeFileAtPath:(NSString *)path;


/**
 移动文件

 @param fromPath 当前路径
 @param toPath 目的路径
 */
+ (void)moveFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath;

@end
