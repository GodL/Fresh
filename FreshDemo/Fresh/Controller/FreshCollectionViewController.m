//
//  FreshCollectionViewController.m
//  FreshDemo
//
//  Created by imac on 2019/4/24.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshCollectionViewController.h"
#import "FreshCollectionView.h"
#import "FreshCollectionViewCell.h"
#import "UIScrollView+RefreshView.h"
#import "FreshDatasViewModel.h"
#import <Masonry/Masonry.h>
#import <StreamKit/StreamKit.h>

@interface FreshCollectionViewController ()

@end

@implementation FreshCollectionViewController

@synthesize collectionView = _collectionView;
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (FreshCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [self initializationCollectionView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        UIRefreshControl *refreshControl = [self initializationRefreshControl];
        if (refreshControl) {
            _collectionView.refreshView = refreshControl;
            refreshControl.sk_command = self.viewModel.command;
            [[SKScheduler mainThreadScheduler] schedule:^{
                [self.collectionView beginRefresh];
            }];
        }
        [self registerCell];
        [self.view addSubview:_collectionView];
        SKSelector(_collectionView, reloadData) = self.viewModel.command.executeSignals.switchToLatest;
    }
    return _collectionView;
}

- (FreshDatasViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [self initializationViewModel];
    }
    return _viewModel;
}

- (FreshCollectionView *)initializationCollectionView {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (FreshDatasViewModel *)initializationViewModel {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (void)registerCell {
    
}

- (void)layoutCollectionView {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (UICollectionViewCell *)cellForItem:(NSIndexPath *)indexPath {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (UIRefreshControl *)initializationRefreshControl {
    return nil;
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FreshCollectionViewCell *cell = [self cellForItem:indexPath];
    [cell configurationCellWithItem:self.viewModel.datas[indexPath.row]];
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
