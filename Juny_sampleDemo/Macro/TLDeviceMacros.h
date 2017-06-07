//
//  TLDeviceMacros.h
//  TLBasicDev
//
//  Created by 宋俊红 on 17/1/23.
//  Copyright © 2017年 统领得一网络科技（上海）有限公司. All rights reserved.
//

#ifndef TLDeviceMacros_h
#define TLDeviceMacros_h
#pragma mark----------------------------------设备相关--------------------------------------------------
/**
 *系统信息-
 */
#define CURRENT_SYSTEM_VERSION                           ([[[UIDevice currentDevice] systemVersion] floatValue])
/**
 判断是否是iOS7.0及以上
 */
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
/**
 判断是否是iOS8.0及以上
 */
#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
/**
 判断设备是否是横屏
 */
#define UI_IS_LANDSCAPE         ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)
/**
 判断是否是ipad设备
 */
#define UI_IS_IPAD              ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
/**
 判断是否是iPhone设备
 */
#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
/**
 是否是4s的设备（指的是屏幕尺寸）
 */
#define UI_IS_IPHONE4           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
/**
 是否是5s的设备（指的是屏幕尺寸）
 */
#define UI_IS_IPHONE5           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
/**
 是否是6s的设备（指的是屏幕尺寸）
 */
#define UI_IS_IPHONE6           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
/**
 是否是6sPLUS的设备（指的是屏幕尺寸）
 */
#define UI_IS_IPHONE6PLUS       (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0) // Both orientations
/**
 屏幕的分辨率（是指一个物理相位上有几个逻辑像素点）
 */
#define UI_SCREEN_SCALE         [[UIScreen mainScreen] scale]


#endif /* TLDeviceMacros_h */
