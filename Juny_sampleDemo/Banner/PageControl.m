//
//  PageControl.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/7.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "PageControl.h"


@implementation PageControl




- (void)layoutSubviews{

    CGFloat dotw = 20;
    CGFloat dotH = 2;
    CGFloat topGap = (self.frame.size.height-dotH)/2.0;
    CGFloat gap = 0;
    CGFloat leftGap = (self.frame.size.width-(self.subviews.count*dotw)-(gap*(MAX(self.subviews.count-1, 0))))/2.0;
   
    
    for (int i=0; i<[self.subviews count]; i++)
    {
        UIView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(leftGap + i * (dotw+gap), topGap , dotw, dotH)];
        dot.clipsToBounds = NO;
        if (i == self.currentPage)
        {
            dot.backgroundColor = [UIColor redColor];
        }
        else
        {
            dot.backgroundColor = [UIColor blueColor];
        }
    }}

@end
