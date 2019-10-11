//
//  FreshCollectionViewController.h
//  FreshDemo
//
//  Created by imac on 2019/4/24.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshContentViewController.h"
#import "FreshCellModelable.h"

NS_ASSUME_NONNULL_BEGIN

@class FreshCollectionView;
@class FreshDatasViewModel;

typedef NS_ENUM(NSInteger,UICollectionViewStyle) {
    UICollectionViewStylePlain,
    UICollectionViewStyleGroup
};

@interface FreshCollectionViewController : FreshContentViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong,readonly) __kindof FreshCollectionView *collectionView;

@property (nonatomic,strong,readonly) __kindof UIRefreshControl *refreshControl;

@property (nonatomic,strong,readonly) __kindof FreshDatasViewModel *viewModel;

#pragma mark- Overrided
- (__kindof FreshCollectionView *)initializationCollectionView;

- (NSArray<Class<FreshCellModelable>> *)registerCells;

- (NSArray<Class> *)registerReusableViews;

- (void)layoutCollectionView;

- (UICollectionViewStyle)collectionViewStyle;

- (void)configCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

- (void)collectionViewDidSelectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath;

- (void)collectionViewDidDeselectedWithModel:(id)model atIndexPath:(NSIndexPath *)indexPath;


- (__kindof UICollectionReusableView *)reusableViewForKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath ;

- (__kindof FreshDatasViewModel *)initializationViewModel;

- (__kindof UIRefreshControl *)initializationRefreshControl;

- (void)setupRefreshControl;

@end

NS_ASSUME_NONNULL_END
