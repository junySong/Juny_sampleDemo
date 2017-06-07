//
//  TLColorMacros.h
//  TLBasicDev
//
//  Created by 宋俊红 on 17/1/23.
//  Copyright © 2017年 统领得一网络科技（上海）有限公司. All rights reserved.
//

#ifndef TLColorMacros_h
#define TLColorMacros_h
#pragma mark -----------------------------------------颜色相关----------------------------------------------

/**
 三原色（透明度默认是1）

 @param r 红色
 @param g 绿色
 @param b 蓝色
 @return 颜色对象
 */
#define RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
/**
 三原色加透明度

 @param r 红
 @param g 绿
 @param b 蓝
 @param a 透明度（0~1）
 @return 颜色对象
 */
#define RGBA(r,g,b,a)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/**
 用16进制的色值表示颜色（透明度是默认的1）

 @param hex 色值
 @return 颜色对象
 */
#define HEX_COLOR(hex)          ([UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1])

/**
 用16进制的色值加透明度表示颜色

 @param hex 色值
 @param a 透明度
 @return 颜色对象
 */
#define HEX_COLORVALUES(hex,a)    ([UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a])



/**
 分割线的颜色
 
 @param 0 0 description
 @param 0 0 description
 @param 0 0 description
 @param 0.12 透明度
 @return 颜色对象
 */
#define COLOR_PARTITION      RGBA(0, 0, 0, 0.12)

/**
 主色调的颜色（常用的高亮状态下的颜色）
 
 @param 236 236 description
 @param 107 107 description
 @param 41 41 description
 @return color对象
 */
#define COLOR_MAINCOLOR      HEX_COLOR(0xf9221c)

/**
 控件间隙的颜色
 
 @return 颜色对象
 */
#define COLOR_BGCOLOR      HEX_COLOR(0xf5f4f4)
/**
 TagLabel边框的颜色
 
 @return 颜色对象
 */
#define COLOR_LINECOLOR      HEX_COLOR(0xe5e5e5)


/**
 主要字体的颜色
 
 @return 颜色对象
 */
#define COLOR_TEXTCOLOR      HEX_COLOR(0x333333)

/**
 次要字体的颜色
 
 @return 颜色对象
 */
#define COLOR_GRAYTEXTCOLOR      HEX_COLOR(0xaaaaaa)

#endif /* TLColorMacros_h */
