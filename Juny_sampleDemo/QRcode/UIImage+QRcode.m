//
//  UIImage+QRcode.m
//  Juny_ERAndMatixCode
//
//  Created by 宋俊红 on 17/3/31.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "UIImage+QRcode.h"

@implementation UIImage (QRcode)

#pragma mark------------------二维码----------------------
/**
 生成图片的大小不是固定不变的，而是随着内容的复杂度而改变，跟内容的复杂度成正比
 */
+ (UIImage*)createQRcodeImageWithString:(NSString*)string{
    if (string.length) {
        UIImage *outImage = [UIImage createQRcodeImageWithString:string size:0];
        return outImage;
        
    }
    return nil;
   
}


+ (UIImage*)createQRcodeImageWithString:(NSString*)string size:(CGFloat)size{
    CIImage *image =  [UIImage createQRcodeImage:string];
    UIImage *outImage = nil;
    if (size>0) {
        outImage = [self creatNonInterpolatedUIImageFormCIImage:image withSize:size];
    }else{
        outImage = [UIImage imageWithCIImage:image ];
    }
    // 5. 返回UIImage对象
     return outImage;
}

+ (CIImage*)createQRcodeImage:(NSString*)string{
    if (string.length) {
        // 1.创建过滤器，这里的@"CIQRCodeGenerator"是固定的
        CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        
        // 2.恢复默认设置
        [filter setDefaults];
        
        // 3. 给过滤器添加数据，要从字符串或URL创建QR码，NSData请使用NSISOLatin1StringEncoding字符串编码将其转换为对象
        NSString *dataString = string;
        //        NSData *data = [dataString dataUsingEncoding:NSISOLatin1StringEncoding];
        NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        // 注意，这里的value必须是NSData类型
        [filter setValue:data forKeyPath:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
        [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
        
        // 4. 生成二维码CIImage
        CIImage *outputImage = [filter outputImage];
        
        return outputImage;
   
    }
    return nil;
    
}

#pragma mark------------------条形码----------------------
+ (UIImage*)createCode128BarCodeImageWithString:(NSString*)string{
    if (string.length) {
        // 1.创建过滤器，这里的@"CIQRCodeGenerator"是固定的
        CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
        
        // 2.恢复默认设置
        [filter setDefaults];
        
        // 3. 给过滤器添加数据
        NSString *dataString = string;
        NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        // 注意，这里的value必须是NSData类型
        [filter setValue:data forKeyPath:@"inputMessage"];//通过kvo方式给一个字符串，生成条形码。要编码为128码的数据。不能包含非ASCII字符。NSData显示名称为Message 的对象。
        [filter setValue:@(8) forKey:@"inputQuietSpace"];//条形码两侧添加的空格的像素数。一个NSNumber其属性类型是对象CIAttributeTypeScalar和显示名称是QuietSpace。默认值：7.00最小值：0.00最大值：20.00滑块最小值：0.00滑块最大值：20.00标识：0.00
        
        // 4. 生成条形码
        CIImage *outputImage = [filter outputImage];
        
        UIImage *outImage = [UIImage imageWithCIImage:outputImage];
        
        // 5. 返回UIImage对象

        return outImage;
    }
    return nil;
}

#pragma mark------------------图片处理----------------------

+(UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    CIImage *outPutImage = [filter outputImage];//拿到二维码图片
    return [[self alloc] createNonInterpolatedUIImageFormCIImage:outPutImage withSize:Imagesize waterImageSize:waterImagesize];
}



- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size waterImageSize:(CGFloat)waterImagesize{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    //创建一个DeviceGray颜色空间
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //CGBitmapContextCreate(void * _Nullable data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef  _Nullable space, uint32_t bitmapInfo)
    //width：图片宽度像素
    //height：图片高度像素
    //bitsPerComponent：每个颜色的比特值，例如在rgba-32模式下为8
    //bitmapInfo：指定的位图应该包含一个alpha通道。
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    //创建CoreGraphics image
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef); CGImageRelease(bitmapImage);
    
    //原图
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    //给二维码加 logo 图
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0,0 , size, size)];
    //logo图
    UIImage *waterimage = [UIImage imageNamed:@"icon_imgApp"];
    //把logo图画到生成的二维码图片上，注意尺寸不要太大（最大不超过二维码图片的%30），太大会造成扫不出来
    [waterimage drawInRect:CGRectMake((size-waterImagesize)/2.0, (size-waterImagesize)/2.0, waterImagesize, waterImagesize)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度，以为是方形图片，宽和高相等
 *
 *  @return 生成的高清的UIImage
 */
+ (UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);//CGRectIntegral 将表示原点的值向下取整，表示大小的值向上取整，这样就保证了你的绘制代码平整地对齐到像素边界。
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1. 创建bitmap，
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //CGBitmapContextCreate(void * _Nullable data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef  _Nullable space, uint32_t bitmapInfo)
    //sizt_t是定义的一个可移植性的单位，在64位机器中为8字节，32位位4字节。
    //width：图片宽度像素
    //height：图片高度像素
    //bitsPerComponent：每个颜色的比特值，例如在rgba-32模式下为8
    //bitsPerPixel：每个像素的总比特数
    //bytesPerRow：每一行占用的字节数，注意这里的单位是字节
    //space：颜色空间模式，例如const CFStringRef kCGColorSpaceGenericRGB 这个函数可以返回一个颜色空间对象。
    /*
     //bitmapInfo：指定的位图应该包含一个alpha通道。bitmapInfo：位图像素布局，枚举如下：
     typedef CF_OPTIONS(uint32_t, CGBitmapInfo) {
     kCGBitmapAlphaInfoMask = 0x1F,
     kCGBitmapFloatComponents = (1 << 8),
     
     kCGBitmapByteOrderMask = 0x7000,
     kCGBitmapByteOrderDefault = (0 << 12),
     kCGBitmapByteOrder16Little = (1 << 12),
     kCGBitmapByteOrder32Little = (2 << 12),
     kCGBitmapByteOrder16Big = (3 << 12),
     kCGBitmapByteOrder32Big = (4 << 12)
     }
     */
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
