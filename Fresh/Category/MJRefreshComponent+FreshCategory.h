//
//  MJRefreshComponent+FreshCategory.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "MJRefreshComponent.h"

NS_ASSUME_NONNULL_BEGIN

@class SKCommand;

@interface MJRefreshComponent (FreshCategory)

@property (nonatomic,strong,setter=sk_setCommand:) SKCommand *sk_command;

@end

NS_ASSUME_NONNULL_END
