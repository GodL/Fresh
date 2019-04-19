//
//  FreshPageViewModel.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshPageViewModel.h"
#import <StreamKit/StreamKit.h>

@interface FreshPageViewModel ()

@property (nonatomic,assign,readwrite) NSUInteger page;

@end

@implementation FreshPageViewModel

@synthesize headerCommand = _headerCommand;
@synthesize footerCommand = _footerCommand;
@synthesize hasMoreDataSignal = _hasMoreDataSignal;

- (SKSignal *)commandSignal {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (NSUInteger)countOfPage {
    return 20;
}

- (SKCommand *)headerCommand {
    if (!_headerCommand) {
        @weakify(self)
        _headerCommand = [[SKCommand alloc] initWithSignalBlock:^SKSignal *(id value) {
            @strongify(self)
            return [[self commandSignal] initially:^{
                @strongify(self)
                self.page = 1;
            }];
        }];
    }
    return _headerCommand;
}

- (SKCommand *)footerCommand {
    if (!_footerCommand) {
        @weakify(self)
        _footerCommand = [[SKCommand alloc] initWithSignalBlock:^SKSignal *(id value) {
            @strongify(self)
            return [[self commandSignal] initially:^{
                @strongify(self)
                self.page ++ ;
            }];
        }];
    }
    return _footerCommand;
}

- (SKSignal *)hasMoreDataSignal {
    if (!_hasMoreDataSignal) {
        NSUInteger countOfPage = [self countOfPage];
        SKMulticastConnection *connection = [[[[SKSignal return:@YES] scheduleOn:[SKScheduler mainThreadScheduler]] concat:[SKObserve(self,datas) map:^id(NSArray *x) {
            return @(x.count % countOfPage != 0 || x.count == 0);
        }]] publish];
        [connection connect];
        _hasMoreDataSignal = connection.signal;
    }
    return _hasMoreDataSignal;
}

@end
