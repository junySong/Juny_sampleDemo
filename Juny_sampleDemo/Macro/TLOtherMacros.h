//
//  TLOtherMacros.h
//  TLBasicDev
//
//  Created by 宋俊红 on 17/1/23.
//  Copyright © 2017年 统领得一网络科技（上海）有限公司. All rights reserved.
//

#ifndef TLOtherMacros_h
#define TLOtherMacros_h

#pragma mark - 通用宏

/**
 打印日志相关
 */
#ifdef DEBUG
#define CLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#else
#define CLog(format,...)
#endif


/**
 对自己的弱引用，一般用在block里面，避免造成循环引用

 @param weakSelf self
 @return 对自己弱引用的指针
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define kUserInfoModel       [USAppRelatedSingleModel sharedUSAppRelatedSingleModel];

#endif /* TLOtherMacros_h */
