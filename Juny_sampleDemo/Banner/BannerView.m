//
//  BannerView.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/7.
//  Copyright © 2017年 Juny. All rights reserved.
//
#define  ViewTag 20170607
#import "BannerView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@implementation BannerView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initView];
        
        _scrollView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _defaultImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _pageControl.frame = CGRectMake(0, frame.size.height-50-20, frame.size.width, 50);
    }
    return  self;
}
- (void)initData{
    WS(weakSelf);
    _dataArray = [NSMutableArray array];
    _defaultImage = [UIImage imageNamed:@"huanchong_bj"];
    
    
    
}

- (void)initView{
    _scrollView = [[UIScrollView alloc]init];
    [self addSubview:_scrollView];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollsToTop = NO;
    _scrollView.delegate = self;
    
    _pageControl = [[UIPageControl alloc]init];
    [self addSubview:_pageControl];
    
    _defaultImageView = [[UIImageView alloc]init];
    [self addSubview:_defaultImageView];
    _defaultImageView.clipsToBounds = YES;
    _defaultImageView.contentMode = UIViewContentModeScaleAspectFill;
    _defaultImageView.image = _defaultImage;
}

/**
 填充数据,
 1、首先判断数据源的个数，如果是1个的话，就不用滑动，直接default改变图片就可以了
 2、如果是2个或者是过个的话。首位各家一个，以便轮播的时候实现平滑过渡的效果；这种情况下，记得进入时的位置是理论上的第一个，实际上的第二个
 3、无论如何，记得点击事件,并且记得用代理吧点击事件传递出去
 */
- (void)configViewWithDataArray:(NSMutableArray*)array{
    
    //移除旧视图
    NSArray *subViews = _scrollView.subviews;
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[UIImageView  class]]) {
            [view removeFromSuperview];
        }
    }

    [self bringSubviewToFront:_defaultImageView];
    
    if (array&&array.count>0) {
        _dataArray = array;
        _pageControl.numberOfPages = _dataArray.count;
        [self bringSubviewToFront:_pageControl];
        
        if (_dataArray.count>1) {
            //1、将默认的图移除，2、添加相应的图和代理
            [_defaultImageView removeFromSuperview];
      
            
            //首尾各加一个
            NSMutableArray *tempArray = [NSMutableArray arrayWithArray:_dataArray];
            [tempArray insertObject:[_dataArray lastObject] atIndex:0];
            [tempArray addObject:[_dataArray firstObject]];
            
            //将子视图添加到对应位置
            for (int i=0; i<tempArray.count; i++) {
                NSString *imageName = [tempArray objectAtIndex:i];
                UIImageView*imageV= [self scrllViewAddImageViewWithImageName:imageName Index:i];
                //添加相对应的点击事件
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
                [imageV addGestureRecognizer:tap];
            }
            
            //设置scrollView的容量和初始位置(第二个位置)
            _scrollView.contentSize = CGSizeMake(self.frame.size.width*tempArray.count, self.frame.size.height);
            _scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
            
            //GCD 的timer，开始之后立即执行，不像是NSTimer那样要等个时间间隔，所以，要延迟一个时间间隔执行
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [self deallocTimer];
                [self startTimer];
            });
            
            
        }else{
            //将默认图替换为数据源的图
            NSString *imageName = [_dataArray firstObject];
            [_defaultImageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:_defaultImage];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGuseture:)];
            [self addGestureRecognizer:tap];
        }
    }
    
    
}


/**
 向scrollView上添加子视图

 @param imageName 子视图的图片的名字
 @param aIndex 子视图的索引
 */
- (UIImageView*)scrllViewAddImageViewWithImageName:(NSString *)imageName Index:(NSUInteger)aIndex{
    
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = self.frame.size.height;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageW*aIndex, 0, imageW, imageH)];
    [_scrollView addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    imageView.tag = ViewTag +aIndex;
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:_defaultImage];
    
    return imageView;
    
   
    
}
#pragma mark --------------------private-------------------------
- (void)handleTimer{
    if (_dataArray&&_dataArray.count>1) {
        [self scrollToNextPage];
    }else{
        
    }
}
- (void)scrollToNextPage{
    //获取当前页
    int toPage = self.scrollView.contentOffset.x/self.frame.size.width;
    toPage += 1;
    [self.scrollView scrollRectToVisible:CGRectMake(self.frame.size.width*toPage, 0, self.frame.size.width, self.frame.size.height) animated:YES];
    
}

- (void)startTimer{
         WS(weakSelf)
        //初始化timer
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(_timer, ^{
            [weakSelf handleTimer];
        });

        dispatch_resume(_timer);
    
    
}


- (void)deallocTimer{
    dispatch_cancel(_timer);
    _timer = nil;
}

#pragma mark --------------------click------------------------- 

- (void)tapGuseture:(UITapGestureRecognizer*)tap{
    if ([self.delegate respondsToSelector:@selector(bannerView:didSelectedRowAtIndex:)]) {
        [self.delegate bannerView:self didSelectedRowAtIndex:0];
    }
}

- (void)click:(UITapGestureRecognizer*)tap{
    UIView *view = tap.view;
    NSUInteger myViewTag = view.tag - ViewTag;
    if (_dataArray&&_dataArray.count>1) {
        //找到真正的index
        NSUInteger trueIndex = 0;
        if (myViewTag == 0) {
            trueIndex = _dataArray.count-1;
        }else if(myViewTag == _dataArray.count+1){
            trueIndex = 0;
        }else{
            trueIndex = myViewTag - 1 ;
        }
        //点击事件代理
        if ([self.delegate respondsToSelector:@selector(bannerView:didSelectedRowAtIndex:)]) {
            [self.delegate bannerView:self didSelectedRowAtIndex:trueIndex];
        }
    }
    
}

#pragma mark - scroller view delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _isTouch = YES;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _isTouch = NO;
    [self checkCurrentView2TopOrLast:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self checkCurrentView2TopOrLast:scrollView];
}

/**
 判断是否滑到了第一个或者是最后一个，重置当前的PageIndex和scrollView的IndexPath，把pageIndex赋值给PageConTrol

 @param scrollView 滑动视图
 */
- (void)checkCurrentView2TopOrLast:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x/self.frame.size.width;
    if (currentPage == 0) {
        currentPage = _dataArray.count;
        [self.scrollView scrollRectToVisible:CGRectMake(self.frame.size.width*(_dataArray.count), 0, self.frame.size.width, self.frame.size.height) animated:NO];
    }
    else if (currentPage == _dataArray.count+1){
        currentPage = 0;
        [self.scrollView scrollRectToVisible:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:NO];
    }
    
    self.pageControl.currentPage = currentPage-1;
}
@end
