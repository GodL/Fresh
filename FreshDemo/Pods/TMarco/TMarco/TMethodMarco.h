//
//  TMethodMarco.h
//  TagQ
//
//  Created by 李浩 on 2017/3/29.
//  Copyright © 2017年 Genius. All rights reserved.
//

#ifndef TMethodMarco_h
#define TMethodMarco_h

#define T_Init(block) \
    - (instancetype)init { \
        self = [super init]; \
        if (self) { \
            block(); \
        } \
        return self; \
    } \

#define trycatch_argcount_if_1(block) \
     try {block();} @catch (NSException *exception) {} @finally {}

#define trycatch_argcount_if_2(_1,_2) \
    try {_1();} @catch (NSException *exception) {_2(exception);} @finally {}

#define trycatch_argcount_if_3(_1,_2,_3) \
    try {_1();} @catch (NSException *exception) {_2(exception);} @finally {_3();}

#define try(...) SK_PASTEARG2(trycatch_argcount_if_,sk_argcount(__VA_ARGS__))(__VA_ARGS__)

#define T_NetworkFail(errmsg) \
    complete(nil,NO,errmsg)

#define T_NetworkFaile \
    T_NetworkFail(@"请求失败")

#define dispatch_async_main(block) \
    if ([NSThread isMainThread]) { \
        !block?:block(); \
    }else \
        dispatch_async(dispatch_get_main_queue(), ^{!block?:block();});

#define dis_af(s,block) \
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s * NSEC_PER_SEC)), \
        dispatch_get_main_queue(), block)

#define isKindofClass(obj,Class) \
    [obj isKindOfClass:[Class class]]

#define isMemberofClass(obj,Class) \
    [obj isMemberOfClass:[Class class]]

#define isEqualString(_1,_2) \
    [_1 isEqualToString:_2]

#define isLogin(x) [x shareInstance].access_token.length>0

#ifdef DEBUG
#define TLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#define T_Debug(block) block();

#define T_BlockTime(block) \
    do{ \
        NSTimeInterval begin = CACurrentMediaTime(); \
        block();\
        NSTimeInterval end = CACurrentMediaTime();\
        TLog(@"runtime = %f",(end-begin));\
    }while(0);

#else

#define TLog(...)

#define T_Debug(block)

#define T_BlockTime(block)          block();

#endif

#endif /* TMethodMarco_h */
