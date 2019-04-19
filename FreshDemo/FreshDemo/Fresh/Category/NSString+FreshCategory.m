//
//  NSString+FreshCategory.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "NSString+FreshCategory.h"

@implementation NSString (FreshCategory)

- (NSURL *)urlValue {
    NSURL* url = [NSURL URLWithString:self];
    if (!url) {
        url = [[NSURL alloc] initWithString:[self stringByRemovingPercentEncoding]];
    }
    return url;
}

- (BOOL)isPhoneNumber {
    return self.length > 0;
}

- (BOOL)isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isEmailAddress {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}

- (BOOL)isInputRuleNotBlank {
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

- (NSDecimalNumber *)decimalNumberValue {
    return [NSDecimalNumber decimalNumberWithString:self];
}

- (NSString *)add:(NSString *)other {
    return [[self decimalNumberValue] decimalNumberByAdding:other.decimalNumberValue].stringValue;
}

- (NSString *)subtract:(NSString *)other {
    return [self.decimalNumberValue decimalNumberBySubtracting:other.decimalNumberValue].stringValue;
}

- (NSString *)multiply:(NSString *)other {
    return [self.decimalNumberValue decimalNumberByMultiplyingBy:other.decimalNumberValue].stringValue;
}

- (NSString *)divide:(NSString *)other {
    return [self.decimalNumberValue decimalNumberByDividingBy:other.decimalNumberValue].stringValue;
}

@end
