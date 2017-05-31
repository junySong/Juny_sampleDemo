//
//  UIImage+QRcode.h
//  Juny_ERAndMatixCode
//
//  Created by 宋俊红 on 17/3/31.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRcode)


/**
 根据字符串生成二维码
 @param string 字符串
 @return 二维码图片
 */
+ (UIImage*)createQRcodeImageWithString:(NSString*)string;

/**
  根据字符串生成二维码

 @param string 字符串
 @param size 二维码的宽度（因为二维码的宽高是一样的，所以只设置一样就行啦）
 @return 二维码图片
 */
+ (UIImage*)createQRcodeImageWithString:(NSString*)string size:(CGFloat)size;

/**
 根据字符串生成条形码（字符串必须是数字喔，文字是不能生成的）

 @param string 字符串
 @return 条形码图片
 */
+ (UIImage*)createCode128BarCodeImageWithString:(NSString*)string;



@end
