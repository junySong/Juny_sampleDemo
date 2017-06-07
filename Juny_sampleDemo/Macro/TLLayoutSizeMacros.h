//
//  TLLayoutSizeMacros.h
//  TLBasicDev
//
//  Created by 宋俊红 on 17/1/23.
//  Copyright © 2017年 统领得一网络科技（上海）有限公司. All rights reserved.
//

#ifndef TLLayoutSizeMacros_h
#define TLLayoutSizeMacros_h
#pragma mark -----------------------------------------尺寸大小--------------------------------------------

/**
 屏幕的宽度

 @return 屏宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 屏幕的高度

 @return 屏高
 */
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 tabbar 的高度

 @return 49
 */
#define TABBAR_HEIGHT  49

/**
 状态栏的高度

 @return 20
 */
#define STATUSBAR_HEIGHT 20

/**
 导航栏的高度

 @return 49
 */
#define NAVBAR_HEIGHT  44


/**
 圆角的半径

 @return 7.5
 */
#define CORNER_RADIS  7.5
/**
 一般来说，控件的左边距
 
 @return 12
 */
#define LEFT_GAP  12

/**
 线的宽度
 
 @return 7.5
 */
#define LINE_WIDTH  0.5

/**
 当前屏幕宽度/750屏幕宽度，相对于750宽度的屏幕，
 
 @return 相对的比例
 */
#define  ScreenWTo750 SCREEN_WIDTH*2/750.0

#endif /* TLLayoutSizeMacros_h */
