//
//  FreshReusableView.h
//  FreshDemo
//
//  Created by 李浩 on 2019/5/25.
//  Copyright © 2019年 com.GodL.github. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FreshReusableView : UICollectionReusableView

+ (void)registerToCollectionView:(UICollectionView *)collectionView;

+ (NSString *)reusableKind;

@end

NS_ASSUME_NONNULL_END
