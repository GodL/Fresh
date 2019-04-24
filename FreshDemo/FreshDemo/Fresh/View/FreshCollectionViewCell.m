//
//  FreshCollectionViewCell.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation FreshCollectionViewCell

@synthesize backgroundImageView = _backgroundImageView;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    
}

- (void)configurationCellWithItem:(id)value {}

+ (void)registerToTableView:(UICollectionView *)collectionView {
    [collectionView registerClass:self forCellWithReuseIdentifier:[self description]];
}

+ (NSString *)description {
    return [NSStringFromClass(self.class) stringByAppendingString:@"_reuseIdentifier"];
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
        _backgroundImageView.userInteractionEnabled = YES;
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
    }
    return _backgroundImageView;
}

@end
