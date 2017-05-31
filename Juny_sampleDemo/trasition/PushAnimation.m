//
//  PushAnimation.m
//  Juny_trasitionDemo
//
//  Created by sy on 2017/4/13.
//  Copyright © 2017年 Juny. All rights reserved.
//
/*
 IOS－－ UIView中的坐标转换
 
 // 将像素point由point所在视图转换到目标视图view中，返回在目标视图view中的像素值
 
 - (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
 
 // 将像素point从view中转换到当前视图中，返回在当前视图中的像素值
 
 - (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
 
 // 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
 
 - (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
 
 // 将rect从view中转换到当前视图中，返回在当前视图中的rect
 
 - (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;
 */

#import "RootViewController.h"
#import "TrasitionViewController.h"

#import "PushAnimation.h"


@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    TrasitionViewController *toVC   = (TrasitionViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    RootViewController *fromVC = (RootViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    //接下来，获得我们需要过渡的 Cell，并且对它上面的 imageView 截图。这个截图就会用在我们的过渡效果中。同时，我们将这个 imageView 本身隐藏，从而让用户以为是 imageView 在移动的。
    
    //  //对Cell上的 imageView 截图，同时将这个 imageView 本身隐藏
    NSIndexPath *index = [fromVC.tableView indexPathForSelectedRow];
    UITableViewCell *cell =(UITableViewCell *)[fromVC.tableView cellForRowAtIndexPath:index];
    UIView * snapShotView = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    fromVC.finalCellRect = snapShotView.frame;
    
    //设置第二个控制器的位置、透明度、
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    
    //把动画前后的两个ViewController加到容器中
    [containerView addSubview:snapShotView];
    
    //现在来做 view 的动画，移动之前生成的 imageView 的截图，淡入第二个 viewController 的 view。在动画结束后，移除 imageView 的截图，让第二个 view 完全呈现。
    //动起来。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新；
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
        snapShotView.frame = [containerView convertRect:toVC.imageView.frame fromView:toVC.view];
       
    } completion:^(BOOL finished){
        
        [containerView addSubview:toVC.view];

        [snapShotView removeFromSuperview];
    }];
    
    
    //告诉系统动画结束
    [transitionContext completeTransition:!transitionContext.transitionWasCancelled];

}

@end
