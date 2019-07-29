//
//  FreshViewModel.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshViewModel.h"
#import <StreamKit/StreamKit.h>

@implementation FreshViewModel

@synthesize command = _command;

- (SKCommand *)command {
    if (!_command) {
        @weakify(self)
        _command = [[SKCommand alloc] initWithEnabled:[self enabledSignal] signalBlock:^SKSignal *(id value) {
            @strongify(self)
            return [self commandSignal:value];
        }];
    }
    return _command;
}

- (NSString *)URLString {
    return @"";
}

- (NSDictionary *)parameters {
    return nil;
}

- (SKSignal *)enabledSignal {
    return nil;
}

- (SKSignal *)commandSignal:(id)executeValue {
    return nil;
}

- (void)dealloc {
    NSLog(@"%@ delloc",NSStringFromClass(self.class));
}

@end
