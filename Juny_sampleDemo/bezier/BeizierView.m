//
//  BeizierView.m
//  Juny_BezierPath
//
//  Created by sy on 2017/4/18.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "BeizierView.h"

@implementation BeizierView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark --------------------------使用贝塞尔曲线画五边形
// 使用贝塞尔曲线画五边形

//- (void)drawRect:(CGRect)rect {
//
//    UIColor *color = [UIColor redColor];
//    [color set]; //设置线条颜色
//
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    aPath.lineWidth = 5.0;
//
//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//
//    // Set the starting point of the shape.
//    [aPath moveToPoint:CGPointMake(100.0, 10)];
//
//    // Draw the lines
//    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
//    [aPath addLineToPoint:CGPointMake(160, 140)];
//    [aPath addLineToPoint:CGPointMake(40.0, 140)];
//    [aPath addLineToPoint:CGPointMake(10, 40.0)];
//    [aPath closePath];//第五条线通过调用closePath方法得到的
//
////    [aPath stroke];//Draws line 根据坐标点连线
//    [aPath fill];//填充坐标区域
//}

#pragma mark --------------------------使用beizier曲线画矩形
/*
 //使用beizier曲线画矩形
 - (void)drawRect:(CGRect)rect
 {
 UIColor *color = [UIColor redColor];
 [color set]; //设置线条颜色
 
 UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 100, 50)];
 
 aPath.lineWidth = 5.0;
 aPath.lineCapStyle = kCGLineCapRound; //线条拐角
 aPath.lineJoinStyle = kCGLineCapRound; //终点处理
 
 [aPath stroke];
 }
 
 */

#pragma mark --------------------------使用UIBezierPath创建圆形或者椭圆形
/*
 //使用UIBezierPath创建圆形或者椭圆形
 + (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect
 */


#pragma mark --------------------------使用UIBezierPath创建一段弧线
/*
 //使用UIBezierPath创建一段弧线
 + (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
 参数：
 center:圆弧的圆心
 radius:圆弧的半径
 startAngle:圆弧的起始角度
 endAngle:圆弧的结束角度
 clockwise:是否是顺时针方向
 
 //示例代码
 - (void)drawRect:(CGRect)rect
 {
 UIColor *color = [UIColor redColor];
 [color set]; //设置线条颜色
 
 UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
 radius:75
 startAngle:0
 endAngle:DEGREES_TO_RADIANS(135)
 clockwise:YES];
 
 aPath.lineWidth = 5.0;
 aPath.lineCapStyle = kCGLineCapRound; //线条拐角
 aPath.lineJoinStyle = kCGLineCapRound; //终点处理
 
 [aPath stroke];
 }
 
 */
#pragma mark -------------- UIBezierPath类提供了添加二次贝塞尔曲线和三次贝塞尔曲线


/**
 曲线段在当前点开始，在指定的点结束。曲线的形状有开始点，结束点，一个或者多个控制点的切线定义。
 
 
 绘制二次贝塞尔曲线
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
 参数：
 endPoint：结束点
 controlPoint：控制点
 */
//示例代码：
// - (void)drawRect:(CGRect)rect
// {
// UIColor *color = [UIColor redColor];
// [color set]; //设置线条颜色
//
// UIBezierPath* aPath = [UIBezierPath bezierPath];
//
// aPath.lineWidth = 5.0;
// aPath.lineCapStyle = kCGLineCapRound; //线条拐角
// aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//
// [aPath moveToPoint:CGPointMake(20, 100)];//设置起始点
//
// [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];
//
// [aPath stroke];
// }
//


/*//绘制三次贝塞尔曲线
 - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
 参数：
 endPoint：结束点
 controlPoint1：第一个控制点
 controlPoint2：第二个控制点
 */

//示例代码
//- (void)drawRect:(CGRect)rect
//{
//    UIColor *color = [UIColor redColor];
//    [color set]; //设置线条颜色
//
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//
//    aPath.lineWidth = 5.0;
//    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
//    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
//
//    [aPath moveToPoint:CGPointMake(20, 50)];
//
//    [aPath addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(110, 0) controlPoint2:CGPointMake(110, 100)];
//
//    [aPath stroke];
//}


#pragma mark -------------------------- 使用Core Graphics函数去修改path。

/*
 有两种方法可以用来修改和UIBezierPath对象相关的path。可以完全的使用Core Graphics函数去修改path，也可以使用Core Graphics函数和UIBezierPath函数混合去修改。第一种方法在某些方面相对来说比较容易。我们可以创建一个CGPathRef数据类型，并调用我们需要修改path信息的函数。
 
 */
//赋值一个新的CGPathRef给UIBezierPath类

//- (void)drawRect:(CGRect)rect
//{
//    // Create the path data
//    CGMutablePathRef cgPath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));
//
//    // Now create the UIBezierPath object
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    aPath.CGPath = cgPath;
//    aPath.usesEvenOddFillRule = YES;
//
//    // After assigning it to the UIBezierPath object, you can release
//    // your CGPathRef data type safely.
//    CGPathRelease(cgPath);
//
//    //划线,设置线的颜色和宽度，划线
//    [[UIColor redColor]setStroke];
//    [aPath setLineWidth:5];
//    [aPath stroke];
//
//}
//使用Core Graphics函数和UIBezierPath函数混合去修改，我们必须小心的移动Path信息在两者之间。因为UIBezier类拥有自己底层的CGPathRef data type，我们不能简单的检索该类型并直接的修改它。相反，我们应该生成一个副本，然后修此副本，然后赋值给CGPath属性。


//示例代码

//- (void)drawRect:(CGRect)rect
//{
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
//    // Get the CGPathRef and create a mutable version.
//    CGPathRef cgPath = aPath.CGPath;
//    CGMutablePathRef  mutablePath = CGPathCreateMutableCopy(cgPath);
//    
//    // Modify the path and assign it back to the UIBezierPath object
//    CGPathAddEllipseInRect(mutablePath, NULL, CGRectMake(50, 50, 200, 200));
//    aPath.CGPath = mutablePath;
//    
//    // Release both the mutable copy of the path.
//    CGPathRelease(mutablePath);
////    划线,设置线的颜色和宽度，划线
//    [[UIColor blueColor]setStroke];
//    [aPath setLineWidth:5];
//    [aPath stroke];
//}



#pragma mark -------------------------- rendering（渲染）Bezier Path对象的内容。
/**
 当创建一个UIBezierPath对象之后，我们可以使用它的stroke和fill方法在current graphics context中去渲染它。在调用这些方法之前，我们要进行一些其他的任务去确保正确的绘制path。
 使用UIColor类的方法去stroke和fill想要的颜色。
 设置形状在目标视图中的位置。如果我们创建的path相对于原点（0，0），则我们可以给current drawing context应用一个适当的affie transform。例如，我想drawing一个形状起始点在（0，0），我可以调用函数CGContextTranslateCTM,并指定水平和垂直方向的translation值为10。调整graphic context相对于调整path对象的points是首选的方法，因为我们可以很容易的保存和撤销先前的graphics state。
 更新path对象的drawing 属性。当渲染path时，UIBezierPath实例的drawing属性会覆盖graphics context下的属性值。
 */

//示例代码。绘制一个椭圆，椭圆边框矩形的左上角位于视图坐标系统的店（50，50）处
- (void)drawRect:(CGRect)rect
{
 UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:
 CGRectMake(0, 0, 200, 100)];

 // Set the render colors
 [[UIColor cyanColor] setStroke];
 [[UIColor redColor] setFill];

 CGContextRef aRef = UIGraphicsGetCurrentContext();

 // If you have content to draw after the shape,
 // save the current state before changing the transform
// CGContextSaveGState(aRef);

   /* //在上下文中更改用户坐标系的起点。
    void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty);
    c:图形上下文。
    tx:以指定上下文的用户空间为单位移位坐标空间的x轴的量。
    ty:以指定上下文的用户空间为单位移位坐标空间的y轴的量。
    */
 CGContextTranslateCTM(aRef, 50, 50);

 // Adjust the drawing options as needed.
 aPath.lineWidth = 5;

 [aPath fill];
 [aPath stroke];

}


@end









