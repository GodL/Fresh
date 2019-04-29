//
//  NSDecimalNumber+FreshCategory.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (FreshCategory)

- (NSDecimalNumber *)add:(NSDecimalNumber *)other;

- (NSDecimalNumber *)subtract:(NSDecimalNumber *)other;

- (NSDecimalNumber *)multiply:(NSDecimalNumber *)other;

- (NSDecimalNumber *)divide:(NSDecimalNumber *)other;

@end

NS_ASSUME_NONNULL_END
