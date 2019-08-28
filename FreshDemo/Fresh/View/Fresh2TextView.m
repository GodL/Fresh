//
//  Fresh2TextView.m
//  FreshDemo
//
//  Created by imac on 2019/8/28.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "Fresh2TextView.h"
#import <Masonry/Masonry.h>

@implementation Fresh2TextView

- (void)setupSubViews {
    [super setupSubViews];
    _leftLabelFitWidth = YES;
    self.insets = UIEdgeInsetsZero;
    _leftLabel = [UILabel new];
    [self addSubview:_leftLabel];
    
    _rightField = [UITextField new];
    _rightField.textAlignment = NSTextAlignmentRight;
    [self addSubview:_rightField];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(self.insets.left);
        make.top.offset(self.insets.top);
        make.width.mas_equalTo(100);
        make.bottom.offset(-self.insets.bottom);
    }];
    
    [_rightField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-self.insets.right);
        make.centerY.height.equalTo(self.leftLabel);
        make.left.equalTo(_leftLabel.mas_right).offset(self.insets.right);
    }];
}

- (void)setInsets:(UIEdgeInsets)insets {
    _insets = insets;
    [self setNeedsLayout];
}

- (void)setLeftLabelFitWidth:(BOOL)leftLabelFitWidth {
    _leftLabelFitWidth = leftLabelFitWidth;
    [self setNeedsLayout];
}

- (void)configurationLeftLabel:(void (^)(UILabel * _Nonnull))completeHandle {
    NSParameterAssert(completeHandle);
    completeHandle(self.leftLabel);
}

- (void)configurationRightField:(void (^)(UITextField * _Nonnull))completeHandle {
    NSParameterAssert(completeHandle);
    completeHandle(self.rightField);
}

- (void)setLeftText:(id)text {
    NSAssert([text isKindOfClass:NSString.class] || [text isKindOfClass:NSAttributedString.class], @"text must be string");
    if ([text isKindOfClass:NSString.class]) {
        self.leftLabel.text = text;
    }else
        self.leftLabel.attributedText = text;
    [self setNeedsLayout];
}

- (void)setRightText:(id)text {
    NSAssert([text isKindOfClass:NSString.class] || [text isKindOfClass:NSAttributedString.class], @"text must be string");
    if ([text isKindOfClass:NSString.class]) {
        self.rightField.text = text;
    }else
        self.rightField.attributedText = text;
}

- (void)setLeftText:(id)leftText rightText:(id)rightText {
    [self setLeftText:leftText];
    [self setRightText:rightText];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(self.insets.left);
        make.top.offset(self.insets.top);
        make.bottom.offset(self.insets.bottom);
    }];
    if (self.leftLabelFitWidth) {
        CGFloat left_width = [self.leftLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 40)].width;
        [self.leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(left_width);
        }];
    }
    
    [self.rightField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-self.insets.right);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
