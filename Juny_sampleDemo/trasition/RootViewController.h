//
//  RootViewController.h
//  Juny_trasitionDemo
//
//  Created by sy on 2017/4/13.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController
<UIViewControllerTransitioningDelegate>

@property(nonatomic,strong)NSIndexPath *seLectedIndexPath;
@property(nonatomic,assign)CGRect finalCellRect;

@end
