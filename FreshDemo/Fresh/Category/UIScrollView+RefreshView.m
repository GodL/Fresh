//
//  UIScrollView+RefreshView.m
//  FreshDemo
//
//  Created by imac on 2019/4/25.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "UIScrollView+RefreshView.h"
@import ObjectiveC.runtime;

@implementation UIScrollView (RefreshView)

- (void)setRefreshView:(UIRefreshControl *)refreshView {
    objc_setAssociatedObject(self, @selector(refreshView), refreshView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (@available(iOS 10.0, *)) {
        self.refreshControl = refreshView;
    } else {
        [self addSubview:refreshView];
        // Fallback on earlier versions
    }
}

- (UIRefreshControl *)refreshView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)beginRefresh {
    [self.refreshView beginRefreshing];
    [self.refreshView sendActionsForControlEvents:UIControlEventValueChanged];
    if (self.contentOffset.y == 0) {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^(void){
            self.contentOffset = CGPointMake(0, -self.refreshView.frame.size.height);
        } completion:nil];
    }
}

@end
