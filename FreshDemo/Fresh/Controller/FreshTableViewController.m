//
//  FreshTableViewController.m
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshTableViewController.h"
#import "FreshTableView.h"
#import "FreshTableViewCell.h"
#import "FreshDatasViewModel.h"
#import "UIScrollView+RefreshView.h"
#import <Masonry/Masonry.h>
#import <StreamKit/StreamKit.h>

@interface FreshTableViewController ()

@end

@implementation FreshTableViewController

@synthesize tableView = _tableView;
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutTableView];
    [self setupRefreshControl];
    // Do any additional setup after loading the view.
}

- (FreshTableView *)tableView {
    if (!_tableView) {
        _tableView = [self initializationTableView];
        [self registerCell];
        [self.view addSubview:_tableView];
        SKSelector(_tableView, reloadData) = self.viewModel.command.executeSignals.switchToLatest;
    }
    return _tableView;
}

- (FreshDatasViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [self initializationViewModel];
    }
    return _viewModel;
}

- (FreshTableView *)initializationTableView {
    FreshTableView *tableView = [[FreshTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 100;
    return tableView;
}

- (void)registerCell {
    
}

- (void)layoutTableView {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (UITableViewCell *)cellForItem:(NSIndexPath *)indexPath {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (FreshDatasViewModel *)initializationViewModel {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (UIRefreshControl *)initializationRefreshControl {
    return nil;
}

- (void)setupRefreshControl {
    UIRefreshControl *refreshControl = [self initializationRefreshControl];
    if (refreshControl) {
        self.tableView.refreshView = refreshControl;
        refreshControl.sk_command = self.viewModel.command;
        [[SKScheduler mainThreadScheduler] schedule:^{
            [self.tableView beginRefresh];
        }];
    }
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableView.style == UITableViewStyleGrouped ? self.viewModel.datas.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableView.style == UITableViewStyleGrouped ? [self.viewModel.datas[section] count] : self.viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FreshTableViewCell *cell = [self cellForItem:indexPath];
    id value = tableView.style == UITableViewStyleGrouped ? self.viewModel.datas[indexPath.section][indexPath.row] : self.viewModel.datas[indexPath.row];
    [cell configurationCellWithItem:value];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
