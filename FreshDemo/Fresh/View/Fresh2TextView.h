//
//  Fresh2TextView.h
//  FreshDemo
//
//  Created by imac on 2019/8/28.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface Fresh2TextView : FreshBaseView

@property (nonatomic,strong,readonly) UILabel *leftLabel;

@property (nonatomic,strong,readonly) UITextField *rightField;

@property (nonatomic) UIEdgeInsets insets;

@property (nonatomic,assign) BOOL leftLabelFitWidth;

- (void)configurationLeftLabel:(void(^)(UILabel *label))completeHandle;

- (void)configurationRightField:(void(^)(UITextField *field))completeHandle;

- (void)setLeftText:(id)text;

- (void)setRightText:(id)text;

- (void)setLeftText:(id)leftText rightText:(id)rightText;

@end

NS_ASSUME_NONNULL_END
