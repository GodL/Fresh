//
//  FreshPageTableViewController.m
//  FreshDemo
//
//  Created by imac on 2019/5/6.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshPageTableViewController.h"
#import "FreshTableView.h"
#import "MJRefreshComponent+FreshCategory.h"
#import "FreshPageViewModel.h"
#import <MJRefresh/MJRefresh.h>
#import <StreamKit/StreamKit.h>

@interface FreshPageTableViewController ()

@property (nonatomic,strong,readwrite) FreshPageViewModel *viewModel;

@end

@implementation FreshPageTableViewController

@dynamic viewModel;

- (UIRefreshControl *)initializationRefreshControl {
    return UIRefreshControl.new;
}

- (MJRefreshFooter *)initializationRefreshFooter {
    return MJRefreshAutoNormalFooter.new;
}

- (void)setupRefreshControl {
    [super setupRefreshControl];
    MJRefreshFooter *footer = [self initializationRefreshFooter];
    footer.hidden = YES;
    if (footer) {
        NSAssert(self.viewModel == nil || [self.viewModel isKindOfClass:FreshPageViewModel.class], @"must be pageViewModel");
        footer.sk_command = self.viewModel.footerCommand;
        self.tableView.mj_footer = footer;
        SKSelector(self.tableView, reloadData) = [self.viewModel.footerCommand.executeSignals.switchToLatest takeUntil:self.deallocSignal];
        SK(footer,hidden) = self.viewModel.hasMoreDataSignal;
    }
}

@end
