//
//  FreshTableViewController.h
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseController.h"
#import "FreshCellModelable.h"

NS_ASSUME_NONNULL_BEGIN

@class FreshTableView;
@class FreshDatasViewModel;

@interface FreshTableViewController : FreshBaseController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,readonly) __kindof FreshTableView *tableView;

@property (nonatomic,strong,readonly) __kindof UIRefreshControl *refreshControl;

@property (nonatomic,strong,readonly) __kindof FreshDatasViewModel *viewModel;

#pragma mark- Overrided
- (__kindof FreshTableView *)initializationTableView;

- (NSArray<Class<FreshCellModelable>> *)registerCells;

- (void)layoutTableView;

- (void)tableViewDidSelectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath;

- (void)tableViewDidDeselectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath;

- (__kindof FreshDatasViewModel *)initializationViewModel;

- (__kindof UIRefreshControl *)initializationRefreshControl;

- (void)setupRefreshControl;

@end

NS_ASSUME_NONNULL_END
