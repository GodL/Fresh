//
//  FreshViewModel.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SKSignal;
@class SKCommand;

@interface FreshViewModel : NSObject

@property (nonatomic,strong,readonly) SKCommand *command;

//to overrided
- (NSString *)URLString;

- (NSDictionary *)parameters;

- (SKSignal *)enabledSignal;

- (SKSignal *)commandSignal:(nullable id)executeValue;

@end

NS_ASSUME_NONNULL_END
