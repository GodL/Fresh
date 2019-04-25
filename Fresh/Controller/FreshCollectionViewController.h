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

@property (nonatomic,strong,readonly) FreshCollectionView *collectionView;

@property (nonatomic,strong,readonly) FreshDatasViewModel *viewModel;

#pragma mark- Overrided
- (FreshCollectionView *)initializationCollectionView;

- (void)registerCell;

- (void)layoutCollectionView;

- (__kindof UICollectionViewCell *)cellForItem:(NSIndexPath *)indexPath;

- (FreshDatasViewModel *)initializationViewModel;

- (UIRefreshControl *)initializationRefreshControl;

@end

NS_ASSUME_NONNULL_END
