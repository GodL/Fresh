//
//  FreshTableView.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshTableView.h"

@implementation FreshTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.tableFooterView = UIView.new;
        if (style == UITableViewStyleGrouped) {
            self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.bounds.size.width, CGFLOAT_MIN)];
        }
    }
    return self;
}

- (void)setRefreshView:(UIRefreshControl *)refreshView {
    _refreshView = refreshView;
    if (@available(iOS 10.0, *)) {
        self.refreshControl = refreshView;
    } else {
        [self addSubview:refreshView];
        // Fallback on earlier versions
    }
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
