//
//  NSString+FreshCategory.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FreshCategory)

@property (nonatomic,strong,readonly) NSURL *urlValue;

- (BOOL)isPhoneNumber;

- (BOOL)isValidateByRegex:(NSString *)regex;

- (BOOL)isEmailAddress;

- (BOOL)isInputRuleNotBlank;

- (NSDecimalNumber *)decimalNumberValue;

- (NSString *)add:(NSString *)other;

- (NSString *)subtract:(NSString *)other;

- (NSString *)multiply:(NSString *)other;

- (NSString *)divide:(NSString *)other;


@end

NS_ASSUME_NONNULL_END
