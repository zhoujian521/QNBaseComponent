//
//  QNSessionManager.m
//  Pods-QNBaseComponent_Example
//
//  Created by BJQingniuJJ on 2017/11/27.
//

#import "QNSessionManager.h"
#import "AFNetworking.h"

@interface QNSessionManager()
    
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation QNSessionManager
    
- (void)setValue:(NSString *)value forHttpField:(NSString *)field{
    [self.sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}
    
- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        NSMutableSet *setM = [_sessionManager.responseSerializer.acceptableContentTypes mutableCopy];
        [setM addObject:@"text/plain"];
        [setM addObject:@"text/html"];
        _sessionManager.responseSerializer.acceptableContentTypes = [setM copy];
    }
    return _sessionManager;
}

- (void)request:(RequestType )requestType urlStr: (NSString *)urlStr parameter: (NSDictionary *)param success: (void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{

    void(^successBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    };
    
    void(^ failureBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    };
    
    if (requestType == RequestTypeGet) {
        [self.sessionManager GET:urlStr parameters:param progress:nil success:successBlock failure:failureBlock];
    }else {
        [self.sessionManager POST:urlStr parameters:param progress:nil success:successBlock failure:failureBlock];
    }
}

@end
