//
//  SWGJprogress.m
//  SWGJ
//
//  Created by mingxum on 14-11-4.
//  Copyright (c) 2014年 mingxum. All rights reserved.
//

#import "SWGJprogress.h"

@implementation SWGJprogress
@synthesize percent;
@synthesize label = _label;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)init
{
    if ((self = [super init]))
    {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setup];
    }
    
    return self;
}
-(void)setup{
    
    
        self.backgroundColor = [UIColor clearColor];
        _trackLayer = [CAShapeLayer layer];//创建一个track shape layer
        _trackLayer.frame = self.bounds;
    
        _trackLayer.fillColor = [[UIColor clearColor] CGColor];
        _trackLayer.strokeColor = [[UIColor grayColor] CGColor];//指定path的渲染颜色
        _trackLayer.opacity = 0.25; //背景同学你就甘心做背景吧，不要太明显了，透明度小一点
        _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
        _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(0) endAngle:degreesToRadians(-360) clockwise:NO];//上面说明过了用来构建圆形
        _trackLayer.path =[path CGPath];
        [self.layer addSublayer:_trackLayer];
    
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
        _progressLayer.strokeColor  = [[UIColor orangeColor] CGColor];
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.lineJoin =  kCALineJoinRound;
        _progressLayer.fillRule  =  kCAFillRuleEvenOdd;
        _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
        _progressLayer.path = [path CGPath];
        _progressLayer.strokeEnd = 0;
    
    
    CALayer *gradientLayer = [CALayer layer];
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    
        
    
    
    

    gradientLayer1.frame = CGRectMake(0, 0,( self.bounds.size.width), self.bounds.size.height/2.0);
    [gradientLayer1 setColors:[NSArray arrayWithObjects: [UIColor colorWithRed:87/255.0 green:198/255.0 blue:206/255.0 alpha:1].CGColor  ,[UIColor colorWithRed:88/255.0 green:238/255.0 blue:189/255.0 alpha:1].CGColor ,nil]];
    [gradientLayer1 setLocations:@[@0,@1 ]];
    [gradientLayer1 setStartPoint:CGPointMake(0, 1)];
    [gradientLayer1 setEndPoint:CGPointMake(1, 1.0)];
    [gradientLayer addSublayer:gradientLayer1];
    
    
    
    CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
    [gradientLayer2 setLocations:@[@0.4,@0.8,@1]];
    gradientLayer2.frame = CGRectMake(0, self.bounds.size.height/2.0,self.bounds.size.width ,self.bounds.size.height/2.0);
    [gradientLayer2 setColors:[NSArray arrayWithObjects:[UIColor colorWithRed:87/255.0 green:198/255.0 blue:206/255.0 alpha:1].CGColor ,[UIColor colorWithRed:74/255.0 green:157/255.0 blue:227/255.0 alpha:1].CGColor,[UIColor colorWithRed:88/255.0 green:238/255.0 blue:189/255.0 alpha:1].CGColor ,nil]];
    [gradientLayer2 setLocations:@[@0.2,@0.8,@0.1]];
    [gradientLayer2 setStartPoint:CGPointMake(0, 1)];
    [gradientLayer2 setEndPoint:CGPointMake(1, 1)];
    [gradientLayer addSublayer:gradientLayer2];
    [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    
    
        [self.layer addSublayer:gradientLayer];
    
    

    

}


-(void)setPercent:(NSInteger)percent animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:2];
    _progressLayer.strokeEnd =(NSInteger) percent /100.0;
    [CATransaction commit];
    
    
    _percent =(NSInteger) percent;
    
  
    
    
}


@end
