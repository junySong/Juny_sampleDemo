//
//  PopAnimation.m
//  Juny_trasitionDemo
//
//  Created by sy on 2017/4/13.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "PopAnimation.h"
#import "TrasitionViewController.h"
#import "RootViewController.h"

@implementation PopAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //获取动画前后两个VC 和 发生的容器containerView
    RootViewController *toVC = (RootViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    TrasitionViewController *fromVC = (TrasitionViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    //在前一个VC上创建一个截图
    UIView  *snapShotView = [fromVC.imageView snapshotViewAfterScreenUpdates:NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    snapShotView.frame = [containerView convertRect:fromVC.imageView.frame fromView:fromVC.imageView.superview];
    fromVC.imageView.hidden = YES;
    
    //初始化后一个VC的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    //获取toVC中图片的位置
    UITableViewCell *cell = (UITableViewCell *)[toVC.tableView cellForRowAtIndexPath:toVC.seLectedIndexPath];
    cell.imageView.hidden = YES;
    
//    CGRect finalRect =  [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
  
    
    
    //顺序很重要，
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapShotView];
    //
    
    //发生动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        snapShotView.frame = toVC.finalCellRect;
    } completion:^(BOOL finished) {
       
        fromVC.imageView.hidden = NO;
        cell.imageView.hidden = NO;
        [snapShotView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];;
        
    }];
    
    //发生动画
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        
//        snapShotView.frame = toVC.finalCellRect;
//        
//    } completion:^(BOOL finished) {
//        
//        fromVC.imageView.hidden = NO;
//        cell.imageView.hidden = NO;
//        [snapShotView removeFromSuperview];
//        
//    }];
  
}

@end
