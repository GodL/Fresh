//
//  FreshMarco.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#ifndef FreshMarco_h
#define FreshMarco_h

#define LocalizedString(x) NSLocalizedString(@sk_stringify(x), nil)

#define HexColor(x) [UIColor colorWithHexString:@sk_stringify(x)]

#define kGetMediumFont(x) [UIFont systemFontOfSize:x weight:UIFontWeightMedium]

#define NavigationHeight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

#define ThemeText(text,font,color) [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}]


#endif /* FreshMarco_h */
