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

#pragma mark- Overrided
- (FreshTableView *)initializationTableView;

- (void)registerCell;

- (void)layoutTableView;

- (__kindof UITableViewCell *)cellForItem:(NSIndexPath *)indexPath;

- (FreshDatasViewModel *)initializationViewModel;

- (UIRefreshControl *)initializationRefreshControl;

@end

NS_ASSUME_NONNULL_END
