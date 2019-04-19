//
//  TObjectifyMarco.h
//  TagQ
//
//  Created by 李浩 on 2017/4/1.
//  Copyright © 2017年 Genius. All rights reserved.
//

#ifndef TObjectifyMarco_h
#define TObjectifyMarco_h

#define classify(Class) \
    (((NO && ([Class class],NO)),# Class)).fh_classify

#define selectorify(sel) \
    ((NO && (@selector(sel),NO)),sel)

#define urlify(str) \
    str.fh_urlValue

#define initializeify(Class) \
    classify(Class).new

#if __has_include(<YYModel/YYModel.h>)
#define modelify(Class,JSON) \
    [@classify(Class) yy_modelWithJSON:JSON]

#define modelsify(Class,JSON) \
    [NSArray yy_modelArrayWithClass:@classify(Class) json:JSON]
#endif

#define scheduleify_argcount_if_1(selector) \
    selector

#define scheduleify_argcount_if_2(selector,arg) \
    selector arg

#define recursionCallify_argcount_if_1(OBJ,sel) \
    scheduleify(OBJ,sel)

#define recursionCallify_argcount_if_2(OBJ,sel1,sel2) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_1(OBJ,sel1),sel2)

#define recursionCallify_argcount_if_3(OBJ,sel1,sel2,sel3) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_2(OBJ,sel1,sel2),sel3)

#define recursionCallify_argcount_if_4(OBJ,sel1,sel2,sel3,sel4) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_3(OBJ,sel1,sel2,sel3),sel4)

#define recursionCallify_argcount_if_5(OBJ,sel1,sel2,sel3,sel4,sel5) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_4(OBJ,sel1,sel2,sel3,sel4),sel5)

#define recursionCallify_argcount_if_6(OBJ,sel1,sel2,sel3,sel4,sel5,sel6) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_5(OBJ,sel1,sel2,sel3,sel4,sel5),sel6)

#define recursionCallify_argcount_if_7(OBJ,sel1,sel2,sel3,sel4,sel5,sel6,sel7) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_6(OBJ,sel1,sel2,sel3,sel4,sel5,sel6),sel7)

#define recursionCallify_argcount_if_8(OBJ,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_7(OBJ,sel1,sel2,sel3,sel4,sel5,sel6,sel7),sel8)

#define recursionCallify_argcount_if_9(OBJ,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9) \
    recursionCallify_argcount_if_1(recursionCallify_argcount_if_8(OBJ,sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8),sel9)

#define sequentialCallify_argcount_if_1(OBJ,_1) \
    scheduleify(OBJ,_1)

#define sequentialCallify_argcount_if_2(OBJ,_1,_2) \
    sequentialCallify_argcount_if_1(OBJ,_1); scheduleify(OBJ,_2)

#define sequentialCallify_argcount_if_3(OBJ,_1,_2,_3) \
    sequentialCallify_argcount_if_2(OBJ,_1,_2); scheduleify(OBJ,_3)

#define sequentialCallify_argcount_if_4(OBJ,_1,_2,_3,_4) \
    sequentialCallify_argcount_if_3(OBJ,_1,_2,_3); scheduleify(OBJ,_4)

#define sequentialCallify_argcount_if_5(OBJ,_1,_2,_3,_4,_5) \
    sequentialCallify_argcount_if_4(OBJ,_1,_2,_3,_4); scheduleify(OBJ,_5)

#define sequentialCallify_argcount_if_6(OBJ,_1,_2,_3,_4,_5,_6) \
    sequentialCallify_argcount_if_5(OBJ,_1,_2,_3,_4,_5); scheduleify(OBJ,_6)

#define sequentialCallify_argcount_if_7(OBJ,_1,_2,_3,_4,_5,_6,_7) \
    sequentialCallify_argcount_if_6(OBJ,_1,_2,_3,_4,_5,_6); scheduleify(OBJ,_7)

#define sequentialCallify_argcount_if_8(OBJ,_1,_2,_3,_4,_5,_6,_7,_8) \
    sequentialCallify_argcount_if_7(OBJ,_1,_2,_3,_4,_5,_6,_7); scheduleify(OBJ,_8)

#define sequentialCallify_argcount_if_9(OBJ,_1,_2,_3,_4,_5,_6,_7,_8,_9) \
    sequentialCallify_argcount_if_8(OBJ,_1,_2,_3,_4,_5,_6,_7,_8); scheduleify(OBJ,_9)

#define sequentialCallifyOne_argcount_if_1(OBJ,SEL,_1) \
    scheduleify(OBJ,SEL,_1) \

#define sequentialCallifyOne_argcount_if_2(OBJ,SEL,_1,_2) \
    sequentialCallifyOne_argcount_if_1(OBJ,SEL,_1); \
    scheduleify(OBJ,SEL,_2)

#define sequentialCallifyOne_argcount_if_3(OBJ,SEL,_1,_2,_3) \
    sequentialCallifyOne_argcount_if_2(OBJ,SEL,_1,_2); \
    scheduleify(OBJ,SEL,_3)

#define sequentialCallifyOne_argcount_if_4(OBJ,SEL,_1,_2,_3,_4) \
    sequentialCallifyOne_argcount_if_3(OBJ,SEL,_1,_2,_3);    \
    scheduleify(OBJ,SEL,_4)

#define sequentialCallifyOne_argcount_if_5(OBJ,SEL,_1,_2,_3,_4,_5) \
    sequentialCallifyOne_argcount_if_4(OBJ,SEL,_1,_2,_3,_4);    \
    scheduleify(OBJ,SEL,_5)

#define sequentialCallifyOne_argcount_if_6(OBJ,SEL,_1,_2,_3,_4,_5,_6) \
    sequentialCallifyOne_argcount_if_5(OBJ,SEL,_1,_2,_3,_4,_5); \
    scheduleify(OBJ,SEL,_6)

#define sequentialCallifyOne_argcount_if_7(OBJ,SEL,_1,_2,_3,_4,_5,_6,_7) \
    sequentialCallifyOne_argcount_if_6(OBJ,SEL,_1,_2,_3,_4,_5,_6);   \
    scheduleify(OBJ,SEL,_7)

#define sequentialCallifyOne_argcount_if_8(OBJ,SEL,_1,_2,_3,_4,_5,_6,_7,_8) \
    sequentialCallifyOne_argcount_if_7(OBJ,SEL,_1,_2,_3,_4,_5,_6,_7); \
    scheduleify(OBJ,SEL,_8)

#define sequentialCallifyOne_argcount_if_9(OBJ,SEL,_1,_2,_3,_4,_5,_6,_7,_8,_9) \
    sequentialCallifyOne_argcount_if_8(OBJ,SEL,_1,_2,_3,_4,_5,_6,_7,_8);    \
    scheduleify(OBJ,SEL,_9)
/**
 this marco defines a method will be executed by the given object.
 should receive two or three arguments except OBJ.
 if you give three args and the second arg should be a method and the third
 arg should be the argument of the second's.
 */
#define scheduleify(OBJ,...) \
    [OBJ SK_PASTEARG2(scheduleify_argcount_if_,sk_argcount(__VA_ARGS__))(__VA_ARGS__)]

/**
 recursion-call
 This marco defines a recursion-call.that means use the return value of the
 previous function to call the next function.the first caller is OBJ.
 This macro supports up to nine parameters in addition to OBJ.
 */
#define recursionCallify(OBJ,...) \
    SK_PASTEARG2(recursionCallify_argcount_if_,sk_argcount(__VA_ARGS__))(OBJ,__VA_ARGS__)

/**
 sequential-call
 This marco defines a sequential-call.thats means these functions will be called 
 one by one in sequence use the given OBJ.
 This marco supports up to nine parameters in addition to OBJ.
 */
#define sequentialCallify(OBJ,...) \
    SK_PASTEARG2(sequentialCallify_argcount_if_,sk_argcount(__VA_ARGS__))(OBJ,__VA_ARGS__)

#define sequentialCallifyOne(OBJ,SEL,...) \
    SK_PASTEARG2(sequentialCallifyOne_argcount_if_,sk_argcount(__VA_ARGS__))(OBJ,SEL,__VA_ARGS__)


#endif /* TObjectifyMarco_h */
