//
//  MJRefreshComponent+FreshCategory.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "MJRefreshComponent+FreshCategory.h"
#import <StreamKit/StreamKit.h>

@implementation MJRefreshComponent (FreshCategory)

- (SKCommand *)sk_command {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)sk_setCommand:(SKCommand *)command {
    if (command == nil) return;
    @weakify(self)
    [self setRefreshingBlock:^{
        [[[[[command execute:nil]
            catchTo:[SKSignal empty]]
           ignoreValues]
          concat:[SKSignal return:nil]]
         subscribeNext:^(id x) {
             @strongify(self)
             [self endRefreshing];
         }];
    }];
    objc_setAssociatedObject(self, @selector(sk_command), command, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
