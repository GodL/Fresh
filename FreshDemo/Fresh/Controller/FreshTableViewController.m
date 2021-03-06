//
//  FreshTableViewController.m
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshTableViewController.h"
#import "FreshTableView.h"
#import "FreshDatasViewModel.h"
#import "UIScrollView+RefreshView.h"
#import <Masonry/Masonry.h>
#import <StreamKit/StreamKit.h>
#import "FreshDatasProtocol.h"

@interface FreshTableViewController ()

@end

@implementation FreshTableViewController

@synthesize tableView = _tableView;
@synthesize viewModel = _viewModel;
@synthesize refreshControl = _refreshControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutTableView];
    [self setupRefreshControl];
    // Do any additional setup after loading the view.
}

- (FreshTableView *)tableView {
    if (!_tableView) {
        _tableView = [self initializationTableView];
        _tableView.tableHeaderView = [self tableViewHeaderView];
        _tableView.tableFooterView = [self tableViewFooterView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [[self registerCells] enumerateObjectsUsingBlock:^(Class<FreshCellModelable>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_tableView registerClass:obj forCellReuseIdentifier:[[obj cellModel] description]];
        }];
        [self.contentView addSubview:_tableView];
        SKSelector(_tableView, reloadData) = [self.viewModel.command.executeSignals.switchToLatest takeUntil:self.deallocSignal];
    }
    return _tableView;
}

- (FreshDatasViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [self initializationViewModel];
    }
    return _viewModel;
}

- (UIRefreshControl *)refreshControl {
    if (!_refreshControl) {
        _refreshControl = [self initializationRefreshControl];
    }
    return _refreshControl;
}

- (FreshTableView *)initializationTableView {
    FreshTableView *tableView = [[FreshTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 100;
    return tableView;
}

- (NSArray<Class<FreshCellModelable>> *)registerCells {
    return @[];
}

- (void)configCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {}

- (void)layoutContentView {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)layoutTableView {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (FreshDatasViewModel *)initializationViewModel {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (UIRefreshControl *)initializationRefreshControl {
    return nil;
}

- (void)setupRefreshControl {
    UIRefreshControl *refreshControl = [self refreshControl];
    if (refreshControl) {
        self.tableView.refreshView = refreshControl;
        refreshControl.sk_command = self.viewModel.command;
        [[SKScheduler mainThreadScheduler] schedule:^{
            [self.tableView beginRefresh];
        }];
    }
}

- (void)tableViewDidSelectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath {}

- (void)tableViewDidDeselectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath {}

- (UIView *)tableViewHeaderView {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame), CGFLOAT_MIN)];
}

- (UIView *)tableViewFooterView {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame), CGFLOAT_MIN)];
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableView.style == UITableViewStyleGrouped ? self.viewModel.datas.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableView.style == UITableViewStyleGrouped ? [((id<FreshDatasProtocol>)self.viewModel.datas[section]).datas count] : self.viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id value = tableView.style == UITableViewStyleGrouped ? ((id<FreshDatasProtocol>)self.viewModel.datas[indexPath.section]).datas[indexPath.row] : self.viewModel.datas[indexPath.row];
    NSString *identifier = [[value class] description];
    id<FreshCellModelable> cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [self configCell:(UITableViewCell *)cell atIndexPath:indexPath];
    [cell configurationCellWithItem:value];
    return (UITableViewCell *)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id value = tableView.style == UITableViewStyleGrouped ? ((id<FreshDatasProtocol>)self.viewModel.datas[indexPath.section]).datas[indexPath.row] : self.viewModel.datas[indexPath.row];
    [self tableViewDidSelectedWithModel:value atIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    id value = tableView.style == UITableViewStyleGrouped ? ((id<FreshDatasProtocol>)self.viewModel.datas[indexPath.section]).datas[indexPath.row] : self.viewModel.datas[indexPath.row];
    [self tableViewDidDeselectedWithModel:value atIndexPath:indexPath];
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
