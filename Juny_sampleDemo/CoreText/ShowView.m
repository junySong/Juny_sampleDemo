//
//  ShowView.m
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/7.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "ShowView.h"
#import <CoreText/CoreText.h>
@implementation ShowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
        //得到当前绘制画布的上下文，用于后续将内容绘制再画布上
        CGContextRef context = UIGraphicsGetCurrentContext();
    
        /*将坐标系上下旋转。对于底层的绘制引擎来说，屏幕的左下角是（0，0）坐标。
        **而对于UIKit来说，左上角是（0，0）坐标。
        **所以我们为了之后的坐标系描述按UIKit来做，所以现在这里做一个整体上移一个屏幕高度，上移后，0坐标点重合了
        **然后Y坐标轴沿着X坐标轴旋转一周
         */
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGContextTranslateCTM(context, 0, self.bounds.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
    
        //
//        CGMutablePathRef path = CGPathCreateMutable();
//    //    CGPathAddRect(path, NULL, self.bounds);
//        CGPathAddEllipseInRect(path, NULL, self.bounds);
    
        //
//        NSAttributedString *attString = [[NSAttributedString alloc]initWithString:@"Hello World! "
//                                         " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
//                                         " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
//                                         " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
//                                         " 测试设置不同的绘制区域带来的界面变化。"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"图片测试富文本显示"];
    //为所有文本设置字体
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [attributedString length])];
    //将“测试”两字字体颜色设置为蓝色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 2)];
    //将“富文本”三个字字体颜色设置为红色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
    
    //插入一张图片CTRunDelegateCallbacks callBacks;
    /*
     *设置一个回调结构体，告诉dialing该回调那些方法
     */
    CTRunDelegateCallbacks callBacks;//
    memset(&callBacks,0,sizeof(CTRunDelegateCallbacks));//内存空间初始化
    callBacks.version = kCTRunDelegateVersion1;//设置回调版本，默认的是这个
    callBacks.getAscent = ascentCallBacks;//设置图片顶部距离基线的距离
    callBacks.getDescent = descentCallBacks;//设置图片底部距离基线的距离
    callBacks.getWidth = widthCallBacks;//设置图片宽度
    NSDictionary * dicPic = @{@"height":@129,@"width":@400};//
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callBacks, (__bridge void *)dicPic);//
    unichar placeHolder = 0xFFFC;//创建空白字符
    NSString * placeHolderStr = [NSString stringWithCharacters:&placeHolder length:1];//以空白字符生成字符串
    NSMutableAttributedString * placeHolderAttrStr = [[NSMutableAttributedString alloc] initWithString:placeHolderStr];//用字符串初始化占位符的富文本
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)placeHolderAttrStr, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);//给富文本字符串设置代理
    CFRelease(delegate);//释放（__bridge进行C与OC数据类型的转换，C为非ARC，需要手动管理）
    [attributedString insertAttributedString:placeHolderAttrStr atIndex:2];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);//一个frame的工厂，负责生成frame
    CGMutablePathRef path = CGPathCreateMutable();//创建绘制区域
    CGPathAddRect(path, NULL, self.bounds);//添加绘制尺寸
    NSInteger length = attributedString.length;//
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, length), path, NULL);//工厂根据绘制区域及富文本（可选范围，可多次设置），设置frame
    CTFrameDraw(frame, context);//根据frame绘制文字
    
    NSString *imageName = @"Left.png";
    UIImage *image = [UIImage imageNamed:imageName];
    
    CGRect imgFrm = [self calculateImageRectWithFrame:frame];//
    CGContextDrawImage(context,imgFrm, image.CGImage);//
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
   

}


static CGFloat ascentCallBacks(void * ref)
{
    return [(NSNumber *)[(__bridge NSDictionary *)ref valueForKey:@"height"] floatValue];
}
static CGFloat descentCallBacks(void * ref)
{
    return 0;
}
static CGFloat widthCallBacks(void * ref)
{
    return [(NSNumber *)[(__bridge NSDictionary *)ref valueForKey:@"width"] floatValue];
}


-(CGRect)calculateImageRectWithFrame:(CTFrameRef)frame
{
    NSArray * arrLines = (NSArray *)CTFrameGetLines(frame);
    NSInteger count = [arrLines count];
    CGPoint points[count];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), points);//获取每一行起始位置的坐标
    for (int i = 0; i < count; i ++) {//遍历线的数组
        CTLineRef line = (__bridge CTLineRef)arrLines[i];
        NSArray * arrGlyphRun = (NSArray *)CTLineGetGlyphRuns(line);//获取GlyphRun数组（GlyphRun：高效的字符绘制方案）
        for (int j = 0; j < arrGlyphRun.count; j ++) {//遍历CTRun数组
            CTRunRef run = (__bridge CTRunRef)arrGlyphRun[j];//获取CTRun
            NSDictionary * attributes = (NSDictionary *)CTRunGetAttributes(run); //获取CTRun的属性
            CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[attributes valueForKey:(id)kCTRunDelegateAttributeName];
            if (delegate == nil) {
                continue;
            }
            NSDictionary * dic = CTRunDelegateGetRefCon(delegate);//判断代理字典
            if (![dic isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            CGPoint point = points[i];//获取一个起点
            CGFloat ascent;//获取上距
            CGFloat descent;//获取下距
            CGRect boundsRun;//创建一个frame
            boundsRun.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
            boundsRun.size.height = ascent + descent;//取得高
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            boundsRun.origin.x = point.x + xOffset;//point是行起点位置，加上每个字的偏移量得到每个字的x
            boundsRun.origin.y = point.y - descent;//计算原点
            CGPathRef path = CTFrameGetPath(frame);//获取绘制区域
            CGRect colRect = CGPathGetBoundingBox(path);//获取剪裁区域边框
            CGRect imageBounds = CGRectOffset(boundsRun, colRect.origin.x, colRect.origin.y);
            return imageBounds;
        }
    }
    return CGRectZero;
}
@end
