//
//  FreshReusableView.m
//  FreshDemo
//
//  Created by 李浩 on 2019/5/25.
//  Copyright © 2019年 com.GodL.github. All rights reserved.
//

#import "FreshReusableView.h"

@implementation FreshReusableView

+ (void)registerToCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:self forCellWithReuseIdentifier:[self description]];
}

+ (NSString *)reusableKind {
    return UICollectionElementKindSectionHeader;
}

+ (NSString *)description {
    return [NSStringFromClass(self) stringByAppendingString:@"_reuseIdentifier"];
}

@end
