//
//  FreshNetworkService.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshNetworkService.h"
#import <AFNetworking/AFNetworking.h>
#import <StreamKit/StreamKit.h>
#import <YYModel/YYModel.h>
#import <TMarco/TMarco.h>

@interface FreshNetworkModel : NSObject

@property (nonatomic,assign) NSInteger code;

@property (nonatomic,strong) id data;

@property (nonatomic,assign) BOOL success;

@property (nonatomic,copy) NSString* errmsg;

@end

@implementation FreshNetworkModel

@end

@implementation FreshNetworkService {
    AFHTTPSessionManager *_sessionManager;
}

+ (instancetype)shareInstance {
    static FreshNetworkService *service;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [self new];
    });
    return service;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL_HOST];
        _sessionManager.operationQueue.maxConcurrentOperationCount = 5;
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 20;
        [self configNetworkSettings];
    }
    return self;
}

- (void)configNetworkSettings {
    
}

- (void)accessTokenDidInvalid {
    
}

- (SKDisposable *)GET:(NSString *)URLString
           parameters:(nullable NSDictionary *)parameters
              success:(void(^)(id responseObject))success
              failure:(void(^)(NSString *))failure {
    NSURLSessionTask *task = [_sessionManager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         FreshNetworkModel *networkModel = [FreshNetworkModel yy_modelWithJSON:responseObject];
        if (networkModel.success) {
            if (success) success(networkModel.data);
        }else {
            if (failure) {
                failure(networkModel.errmsg);
                if (networkModel.code == 100) {
                    [self accessTokenDidInvalid];
                }
#ifdef DEBUG
                NSLog(@"%@",networkModel.errmsg);
#endif
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error.localizedDescription);
#ifdef DEBUG
        NSLog(@"%@",error);
#endif
    }];
    return [SKDisposable disposableWithBlock:^{
        [task cancel];
    }];
}

- (SKDisposable *)GET:(NSString *)URLString
              success:(void(^)(id responseObject))success
              failure:(void(^)(NSString *))failure {
    return [self GET:URLString parameters:nil success:success failure:failure];
}

- (SKDisposable *)POST:(NSString *)URLString
            parameters:(nullable NSDictionary *)parameters
               success:(void(^)(id responseObject))success
               failure:(void(^)(NSString *))failure {
    NSURLSessionTask *task = [_sessionManager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        FreshNetworkModel *networkModel = [FreshNetworkModel yy_modelWithJSON:responseObject];
        if (networkModel.success) {
            if (success) success(networkModel.data);
        }else {
            if (failure) {
                failure(networkModel.errmsg);
                if (networkModel.code == 100) {
                    [self accessTokenDidInvalid];
                }
#ifdef DEBUG
                NSLog(@"%@",networkModel.errmsg);
#endif
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error.localizedDescription);
#ifdef DEBUG
        NSLog(@"%@",error);
#endif
    }];
    return [SKDisposable disposableWithBlock:^{
        [task cancel];
    }];
}

- (SKDisposable *)POST:(NSString *)URLString
               success:(void(^)(id responseObject))success
               failure:(void(^)(NSString *))failure {
    return [self POST:URLString parameters:nil success:success failure:failure];
}

- (SKDisposable *)DELETE:(NSString *)URLString
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSString *errmsg))failure {
    return [self DELETE:URLString parameters:nil success:success failure:failure];
}

- (SKDisposable *)DELETE:(NSString *)URLString
              parameters:(nullable NSDictionary *)parameters
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSString *errmsg))failure {
    NSURLSessionTask *task = [_sessionManager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        FreshNetworkModel *networkModel = [FreshNetworkModel yy_modelWithJSON:responseObject];
        if (networkModel.success) {
            if (success) success(networkModel.data);
        }else {
            if (failure) {
                failure(networkModel.errmsg);
                if (networkModel.code == 100) {
                    [self accessTokenDidInvalid];
                    
                }
#ifdef DEBUG
                NSLog(@"%@",networkModel.errmsg);
#endif
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error.localizedDescription);
#ifdef DEBUG
        NSLog(@"%@",error);
#endif
    }];
    return [SKDisposable disposableWithBlock:^{
        [task cancel];
    }];
}

@end
