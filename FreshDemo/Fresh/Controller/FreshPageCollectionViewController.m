//
//  FreshPageCollectionViewController.m
//  FreshDemo
//
//  Created by imac on 2019/5/6.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshPageCollectionViewController.h"
#import "FreshPageViewModel.h"
#import <MJRefresh/MJRefresh.h>
#import "FreshCollectionView.h"
#import <StreamKit/StreamKit.h>
#import "MJRefreshComponent+FreshCategory.h"

@interface FreshPageCollectionViewController ()

@property (nonatomic,strong,readwrite) FreshPageViewModel *viewModel;

@end

@implementation FreshPageCollectionViewController

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
        self.collectionView.mj_footer = footer;
        SKSelector(self.collectionView, reloadData) = [self.viewModel.footerCommand.executeSignals.switchToLatest takeUntil:self.deallocSignal];
        SK(footer,hidden) = self.viewModel.hasMoreDataSignal;
    }
}

@end
