//
//  TMetaMacro.h
//  TagQ
//
//  Created by 李浩 on 2017/3/28.
//  Copyright © 2017年 Genius. All rights reserved.
//

#ifndef TMetaMarco_h
#define TMetaMarco_h

#define T_ClassForceify(obj,Class) \
    (NO && ((void)[Class class],NO),((Class*)obj))

#define T_BasicForceity(obj,type) \
    ((type)obj)

#endif /* TMetaMacro_h */
