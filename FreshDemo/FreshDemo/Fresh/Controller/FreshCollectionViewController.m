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
#import <Masonry/Masonry.h>

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
        [self registerCell];
        [self.view addSubview:_collectionView];
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

#pragma mark- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FreshCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FreshCollectionViewCell description] forIndexPath:<#(nonnull NSIndexPath *)#>]
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
