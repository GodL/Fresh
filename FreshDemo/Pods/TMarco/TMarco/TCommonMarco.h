//
//  TCommonMarco.h
//  TagQ
//
//  Created by 李浩 on 2017/3/29.
//  Copyright © 2017年 Genius. All rights reserved.
//

#ifndef TCommonMarco_h
#define TCommonMarco_h

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#define URL_HOST [[[NSBundle mainBundle] infoDictionary] objectForKey:@"SERVER_URL"]

#define kWIDTH   [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a/100.0]

#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define kHexColor(str) [UIColor colorWithHexString:str]

#define kGetFont(x) [UIFont systemFontOfSize:x]

#define kGetImage(name) [UIImage imageNamed:name]

#define kStringEmpty(str) ((str) ==nil||[(str) isKindOfClass:[NSNull class]]||(str).length<=0)?YES:NO

#define kStringEqual(str1,str2) [str1 isEqualToString:str2]

#define kStringContain(str1,str2) [str1 containsString:str2]

#define view_width(view) (view).frame.size.width
#define view_height(view) (view).frame.size.height

#define view_x(view) (view).frame.origin.x
#define view_y(view) (view).frame.origin.y

#define view_width_x(view) view_width(view)+view_x(view)
#define view_height_y(view) view_height(view)+view_y(view)

#define view_center(view) (view).center

#define view_center_x(view) (view).center.x

#define view_center_y(view) (view).center.y

#define kSCALE(x)  floor(kWIDTH / 375 * (x))

#endif /* TCommonMarco_h */
