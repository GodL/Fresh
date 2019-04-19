//
//  FreshNetworkService.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AFHTTPSessionManager;
@class SKDisposable;

@interface FreshNetworkService : NSObject

+ (instancetype)shareInstance;

@property (nonatomic,strong,readonly) AFHTTPSessionManager *sessionManager;

- (void)configNetworkSettings;

- (void)accessTokenDidInvalid;


- (SKDisposable *)GET:(NSString *)URLString
           parameters:(nullable NSDictionary *)parameters
              success:(void(^)(id responseObject))success
              failure:(void(^)(NSString * errmsg))failure;

- (SKDisposable *)GET:(NSString *)URLString
              success:(void(^)(id responseObject))success
              failure:(void(^)(NSString *errmsg))failure;

- (SKDisposable *)POST:(NSString *)URLString
            parameters:(nullable NSDictionary *)parameters
               success:(void(^)(id responseObject))success
               failure:(void(^)(NSString *errmsg))failure;

- (SKDisposable *)POST:(NSString *)URLString
               success:(void(^)(id responseObject))success
               failure:(void(^)(NSString *errmsg))failure;

- (SKDisposable *)DELETE:(NSString *)URLString
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSString *errmsg))failure;

- (SKDisposable *)DELETE:(NSString *)URLString
              parameters:(nullable NSDictionary *)parameters
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSString *errmsg))failure;

@end

NS_ASSUME_NONNULL_END
