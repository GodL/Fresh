//
//  NSDecimalNumber+FreshCategory.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "NSDecimalNumber+FreshCategory.h"

@implementation NSDecimalNumber (FreshCategory)

- (NSDecimalNumber *)add:(NSDecimalNumber *)other {
    return [self decimalNumberByAdding:other];
}

- (NSDecimalNumber *)subtract:(NSDecimalNumber *)other {
    return [self decimalNumberBySubtracting:other];
}

- (NSDecimalNumber *)multiply:(NSDecimalNumber *)other {
    return [self decimalNumberByMultiplyingBy:other];
}

- (NSDecimalNumber *)divide:(NSDecimalNumber *)other {
    return [self decimalNumberByDividingBy:other];
}

@end
