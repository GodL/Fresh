//
//  FreshCollectionViewController.h
//  FreshDemo
//
//  Created by imac on 2019/4/24.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseController.h"

NS_ASSUME_NONNULL_BEGIN

@class FreshCollectionView;
@class FreshDatasViewModel;

@interface FreshCollectionViewController : FreshBaseController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong,readonly) __kindof FreshCollectionView *collectionView;

@property (nonatomic,strong,readonly) __kindof FreshDatasViewModel *viewModel;

#pragma mark- Overrided
- (__kindof FreshCollectionView *)initializationCollectionView;

- (void)registerCell;

- (void)layoutCollectionView;

- (__kindof UICollectionViewCell *)cellForItem:(NSIndexPath *)indexPath;

- (__kindof FreshDatasViewModel *)initializationViewModel;

- (__kindof UIRefreshControl *)initializationRefreshControl;

- (void)setupRefreshControl;

@end

NS_ASSUME_NONNULL_END
