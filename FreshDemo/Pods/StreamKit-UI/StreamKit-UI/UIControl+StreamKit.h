//
//  UIControl+StreamKit.h
//  StreamKit
//
//  Created by 苏南 on 16/12/15.
//  Copyright © 2016年 苏南. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (StreamKit)

/**
 Set enabled.
 @code
 self.sk_enabled(enabled);
 @endcode
 */
- (UIControl* (^)(BOOL enabled))sk_enabled;

/**
 Set selected.
 @code
 self.sk_selected(selected);
 @endcode
 */
- (UIControl* (^)(BOOL selected))sk_selected;

/**
 Set hightlighted.
 @code
 self.sk_highlighted(highlighted);
 @endcode
 */
- (UIControl* (^)(BOOL highlighted))sk_highlighted;

/**
 Set contentVerticalAlignment.
 @code
 self.sk_contentVerticalAlignment(contentVerticalAlignment);
 @endcode
 */
- (UIControl* (^)(UIControlContentVerticalAlignment contentVerticalAlignment))sk_contentVerticalAlignment;

/**
 Set contentHorizontalAlignment.
 @code
 self.sk_contentHorizontalAlignment(contentHorizontalAlignment);
 @endcode
 */
- (UIControl* (^)(UIControlContentHorizontalAlignment contentHorizontalAlignment))sk_contentHorizontalAlignment;

@end
