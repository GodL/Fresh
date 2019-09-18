//
//  FreshCollectionViewController.m
//  FreshDemo
//
//  Created by imac on 2019/4/24.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshCollectionViewController.h"
#import "FreshCollectionView.h"
#import "FreshReusableView.h"
#import "UIScrollView+RefreshView.h"
#import "FreshDatasViewModel.h"
#import <Masonry/Masonry.h>
#import <StreamKit/StreamKit.h>
#import "FreshDatasProtocol.h"

@interface FreshCollectionViewController ()

@end

@implementation FreshCollectionViewController

@synthesize collectionView = _collectionView;
@synthesize viewModel = _viewModel;
@synthesize refreshControl = _refreshControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutCollectionView];
    [self setupRefreshControl];
    // Do any additional setup after loading the view.
}

- (FreshCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [self initializationCollectionView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [[self registerCells] enumerateObjectsUsingBlock:^(Class<FreshCellModelable>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_collectionView registerClass:obj forCellWithReuseIdentifier:[[obj cellModel] description]];
        }];
        [[self registerReusableViews] enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_collectionView registerClass:obj forSupplementaryViewOfKind:[obj reusableKind] withReuseIdentifier:[obj description]];
        }];
        [self.view addSubview:_collectionView];
        SKSelector(_collectionView, reloadData) = [self.viewModel.command.executeSignals.switchToLatest takeUntil:self.deallocSignal];
    }
    return _collectionView;
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

- (FreshCollectionView *)initializationCollectionView {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (FreshDatasViewModel *)initializationViewModel {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (NSArray<Class<FreshCellModelable>> *)registerCells {
    return @[];
}

- (NSArray<Class> *)registerReusableViews {
    return @[];
}

- (void)layoutCollectionView {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (UICollectionViewStyle)collectionViewStyle {
    return UICollectionViewStylePlain;
}

- (UICollectionViewCell *)cellForItem:(NSIndexPath *)indexPath {
    NSAssert(NO, @"should be overrided by subclass");
    return nil;
}

- (UIRefreshControl *)initializationRefreshControl {
    return nil;
}

- (void)setupRefreshControl {
    UIRefreshControl *refreshControl = [self refreshControl];
    if (refreshControl) {
        _collectionView.refreshView = refreshControl;
        refreshControl.sk_command = self.viewModel.command;
        [[SKScheduler mainThreadScheduler] schedule:^{
            [self.collectionView beginRefresh];
        }];
    }
}

- (void)collectionViewDidSelectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath {}

- (void)collectionViewDidDeselectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath {}

#pragma mark- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.collectionViewStyle == UICollectionViewStylePlain ? 1 : self.viewModel.datas.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionViewStyle == UICollectionViewStylePlain ? self.viewModel.datas.count : [((id<FreshDatasProtocol>)self.viewModel.datas[section]).datas count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id item = self.collectionViewStyle == UICollectionViewStylePlain ? self.viewModel.datas[indexPath.row] : ((id<FreshDatasProtocol>)self.viewModel.datas[indexPath.section]).datas[indexPath.row];
    NSString *identifier = [[item class] description];
    id<FreshCellModelable> cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell configurationCellWithItem:item];
    return (UICollectionViewCell *)cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = [self reusableViewForKind:kind atIndexPath:indexPath];
    return reusableView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    id item = self.collectionViewStyle == UICollectionViewStylePlain ? self.viewModel.datas[indexPath.row] : ((id<FreshDatasProtocol>)self.viewModel.datas[indexPath.section]).datas[indexPath.row];
    [self collectionViewDidSelectedWithModel:item atIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    id item = self.collectionViewStyle == UICollectionViewStylePlain ? self.viewModel.datas[indexPath.row] : ((id<FreshDatasProtocol>)self.viewModel.datas[indexPath.section]).datas[indexPath.row];
    [self collectionViewDidDeselectedWithModel:item atIndexPath:indexPath];
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
