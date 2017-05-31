//
//  MJChiBaoZiFooter2.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/12.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJChiBaoZiFooter2.h"

@implementation MJChiBaoZiFooter2
#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];

//    // 设置普通状态的动画图片
//    NSMutableArray *idleImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=60; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
//        [idleImages addObject:image];
//    }
//    [self setImages:idleImages forState:MJRefreshStateIdle];
//    
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    NSMutableArray *refreshingImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=3; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
//        [refreshingImages addObject:image];
//    }
//    [self setImages:refreshingImages forState:MJRefreshStatePulling];
//    
//    // 设置正在刷新状态的动画图片
//    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
//     = YES;
    //
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    [idleImages addObject:[UIImage imageNamed:@"loading-2_00050"]];
    
    //设置下拉状态下的图片
    for (NSUInteger i = 0; i<=9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading-2_0000%zd", i]];
        [idleImages addObject:image];
    }
    for (NSUInteger j = 10; j<=50; j++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading-2_000%zd", j]];
        [idleImages addObject:image];
    }
    
    
    
    NSMutableArray *pullingImage = [NSMutableArray array];
    [pullingImage addObject:[UIImage imageNamed:@"loading-2_00050"]];
    
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger j = 55; j<=80; j++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading-2_000%zd", j]];
        [refreshingImages addObject:image];
    }
    //
    [self setImages:idleImages forState:MJRefreshStateIdle];//下拉动作的时候的图片
    [self setImages:pullingImage forState:MJRefreshStatePulling];//下拉结束动作的图片
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];

}

- (void)setState:(MJRefreshState)state{
    [super setState:state];
    self.stateLabel.text = @"更多";
}


@end
