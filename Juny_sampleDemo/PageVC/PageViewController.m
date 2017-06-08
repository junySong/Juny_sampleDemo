//
//  PageViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/8.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, strong)UIPageViewController *pageVC; //
@property (nonatomic, strong)NSMutableArray *dataArray; //

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initMyData];
    [self initMyView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------------------private-------------------------

- (void)initMyData{
    _dataArray = [NSMutableArray array];
    
    for (int i=0; i<4; i++) {
        UIViewController *vc = [[UIViewController alloc]init];
        [_dataArray addObject:vc];
        switch (i) {
            case 0:
            {
                vc.view.backgroundColor = [UIColor redColor];
            }
                break;
            case 1:
            {
                vc.view.backgroundColor = [UIColor yellowColor];
            }
                break;
            case 2:
            {
                vc.view.backgroundColor = [UIColor blueColor];
            }
                break;
            case 4:
            {
                vc.view.backgroundColor = [UIColor blackColor];
            }
                break;
                
            default:
            {
                vc.view.backgroundColor = [UIColor cyanColor];
            }
                break;
        }
    }
    
}

- (void)initMyView{
    _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageVC.view.frame = CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT-300);
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    [self.view addSubview:_pageVC.view];
    
    
    [_pageVC setViewControllers:@[[_dataArray firstObject]] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:^(BOOL finished) {
        
    }];
}

#pragma mark --------------------delegate-------------------------
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    int index = (int)[_dataArray indexOfObject:viewController];
    if (index==0) {
        return nil;
    }else{
        return _dataArray[index-1];
    }
}
//翻页控制器进行向后翻页动作 这个数据源方法返回的视图控制器为要显示视图的视图控制器
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    int index = (int)[_dataArray indexOfObject:viewController];
    if (index==_dataArray.count-1) {
        return nil;
    }else{
        index = 1+index;
        if (index<_dataArray.count) {
            return _dataArray[index];
        }else{
            return nil;
        }
    }
}


@end
