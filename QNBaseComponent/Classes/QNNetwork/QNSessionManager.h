//
//  QNSessionManager.h
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/27.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestType) {
    RequestTypeGet,   // Get 请求
    RequestTypePost   // Post请求
};

@interface QNSessionManager : NSObject
    
- (void)setValue:(NSString *)value forHttpField:(NSString *)field;
    
- (void)request:(RequestType )requestType urlStr: (NSString *)urlStr parameter: (NSDictionary *)param success: (void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
