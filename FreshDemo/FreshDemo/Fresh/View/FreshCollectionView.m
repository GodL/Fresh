//
//  FreshCollectionView.m
//  FreshDemo
//
//  Created by imac on 2019/4/24.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshCollectionView.h"

@implementation FreshCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.showsVerticalScrollIndicator = self.showsHorizontalScrollIndicator = YES;
    }
    return self;
}

#ifdef DEBUG
- (void)dealloc {
    NSLog(@"%@ delloc",NSStringFromClass(self.class));
}
#endif
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
