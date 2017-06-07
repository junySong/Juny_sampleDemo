//
//  BannerView.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/7.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BannerView;

@protocol BannerViewDelegate <NSObject>

- (void)bannerView:(BannerView*)bannerView didSelectedRowAtIndex:(NSUInteger)index;

@end





@interface BannerView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollView; //滑动视图
@property (nonatomic, strong)UIPageControl *pageControl; //pageControl
@property (nonatomic, strong)NSMutableArray *dataArray; //数据源
@property (nonatomic, strong)UIImageView *defaultImageView; //默认的imageView
@property (nonatomic, strong)UIImage *defaultImage; //
@property (nonatomic, assign)BOOL isTouch;//
@property (nonatomic, strong)dispatch_source_t timer;//定时器


@property (nonatomic, weak)id <BannerViewDelegate>delegate ;

/**
 根据数据源填充界面

 @param array 数据源
 */
- (void)configViewWithDataArray:(NSMutableArray*)array;

/**
 创建并开启定时器
 */
- (void)startTimer;



/**
 销毁定时器
 */
- (void)deallocTimer;

@end
