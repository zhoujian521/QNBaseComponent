//
//  QNSessionManager.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/27.
//

#import <Foundation/Foundation.h>
#define SessionManager [[QNSessionManager alloc] init]

typedef NS_ENUM(NSUInteger, RequestType) {
    RequestTypeGet,   // Get 请求
    RequestTypePost   // Post请求
};

@interface QNSessionManager : NSObject
    
- (void)setValue:(NSString *)value forHttpField:(NSString *)field;

/**
 后台 Api 调用

 @param requestType 接口调用类型
 @param urlStr Get=>requestUrl Post=>BaseUrl
 @param param  Get=>nil        Post=>接口调用参数
 @param success Api接口调用成功回调
 @param failure Api接口调用失败回调
 */
- (void)request:(RequestType )requestType urlStr: (NSString *)urlStr parameter: (NSDictionary *)param success: (void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
