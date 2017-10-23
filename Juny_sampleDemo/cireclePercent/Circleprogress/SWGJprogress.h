//
//  SWGJprogress.h
//  SWGJ
//
//  Created by mingxum on 14-11-4.
//  Copyright (c) 2014年 mingxum. All rights reserved.
//

#import <UIKit/UIKit.h>


#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define  PROGREESS_WIDTH 200 //圆直径
#define PROGRESS_LINE_WIDTH 8//弧线的宽度
@interface SWGJprogress : UIView{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_progressLayer;
    NSInteger _percent;
 
}
@property(nonatomic,assign)NSInteger percent;
@property(nonatomic,strong)UILabel *label;
-(void)setPercent:(NSInteger)percent animated:(BOOL)animated;
@end
