//
//  FreshTableViewController.h
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseController.h"

NS_ASSUME_NONNULL_BEGIN

@class FreshTableView;
@class FreshDatasViewModel;

@interface FreshTableViewController : FreshBaseController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,readonly) FreshTableView *tableView;

@property (nonatomic,strong,readonly) FreshDatasViewModel *viewModel;

@property (nonatomic,strong,readonly) UIRefreshControl *refreshControl;//default is nil.

#pragma mark- Overrided_tableView
- (FreshTableView *)initializationTableView;

- (void)registerCell;

- (void)layoutTableView;


- (FreshDatasViewModel *)initializationViewModel;

- (UIRefreshControl *)initializationRefreshControl;

@end

NS_ASSUME_NONNULL_END
