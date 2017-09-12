


//
//  BannerView1.m
//  Juny_sampleDemo
//
//  Created by 宋俊红 on 2017/9/12.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "BannerView1.h"

@interface BannerView1 (){
    UIScrollView *_scrollView;
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImageView;
    UIPageControl *_pageControl;
    UILabel *_label;
    NSMutableDictionary *_imageData;//图片数据
    int _currentImageIndex;//当前图片索引

}

@property (nonatomic, strong) NSTimer *timer;//


@end

@implementation BannerView1

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initView];
    }
    return self;
}

- (void)dealloc{
    [self deallocTimer];
}

- (void)initData{
    _dataArray = nil;
    _currentImageIndex = 0;
    
}


- (void)initView{
    self.backgroundColor = [UIColor redColor];
    [self addScrollView];
    //添加图片控件
    [self addImageViews];
    //添加分页控件
    [self addPageControl];
    //添加图片信息描述控件
    [self addLabel];

}


#pragma mark 添加控件
-(void)addScrollView{
    _scrollView=[[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:_scrollView];
    //设置代理
    _scrollView.delegate=self;

    //设置当前显示的位置为中间图片
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
    //设置分页
    _scrollView.pagingEnabled=YES;
    //去掉滚动条
    _scrollView.showsHorizontalScrollIndicator=NO;
}

#pragma mark 添加图片三个控件
-(void)addImageViews{
    _leftImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
    _leftImageView.contentMode=UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_leftImageView];
    _centerImageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    _centerImageView.contentMode=UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_centerImageView];
    _rightImageView=[[UIImageView alloc]initWithFrame:CGRectMake(2*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    _rightImageView.contentMode=UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_rightImageView];
    
    _leftImageView.image = [UIImage imageNamed:@"huanchong_bj"];
    _centerImageView.image = [UIImage imageNamed:@"huanchong_bj"];
    _rightImageView.image = [UIImage imageNamed:@"huanchong_bj"];
    
    //设置contentSize
        _scrollView.contentSize=CGSizeMake(3*self.frame.size.width, self.frame.size.height) ;
    
}


#pragma mark 添加分页控件
-(void)addPageControl{
    _pageControl=[[UIPageControl alloc]init];
    _pageControl.frame = CGRectMake(0, 50, 300, 20);
    _pageControl.center=CGPointMake(self.frame.size.width/2, self.frame.size.height-100);
    //设置颜色
    _pageControl.pageIndicatorTintColor=[UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    //设置当前页颜色
    _pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    //设置总页数
    _pageControl.numberOfPages=_dataArray.count;
    
    [self addSubview:_pageControl];
}

#pragma mark 添加信息描述控件
-(void)addLabel{
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.frame.size.width,30)];
    _label.textAlignment=NSTextAlignmentCenter;
    _label.textColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    
    [self addSubview:_label];
}


#pragma mark- ------------------------privateMethod------------------------------------
#pragma mark 重新加载图片
-(void)reloadImage{
    int leftImageIndex,rightImageIndex;
    CGPoint offset=[_scrollView contentOffset];
    if (offset.x >self.frame.size.width) { //向右滑动
        _currentImageIndex=(_currentImageIndex+1)%_dataArray.count;
    }else if(offset.x<self.frame.size.width){ //向左滑动
        _currentImageIndex=(_currentImageIndex+_dataArray.count-1)%_dataArray.count;
    }else{
        
    }
 
    [_centerImageView sd_setImageWithURL:[NSURL URLWithString:[_dataArray objectAtIndex:_currentImageIndex]] placeholderImage:[UIImage imageNamed:@"huanchong_bj"]];
    if (_dataArray&&_dataArray.count>1) {
        //重新设置左右图片
        leftImageIndex=(_currentImageIndex+_dataArray.count-1)%_dataArray.count;
        rightImageIndex=(_currentImageIndex+1)%_dataArray.count;
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:[_dataArray objectAtIndex:leftImageIndex]] placeholderImage:[UIImage imageNamed:@"huanchong_bj"]];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:[_dataArray objectAtIndex:rightImageIndex]] placeholderImage:[UIImage imageNamed:@"huanchong_bj"]];
    }else if(_dataArray.count == 1){
        //重新设置左右图片
        leftImageIndex=0;
        rightImageIndex=0;
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:[_dataArray objectAtIndex:leftImageIndex]] placeholderImage:[UIImage imageNamed:@"huanchong_bj"]];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:[_dataArray objectAtIndex:rightImageIndex]] placeholderImage:[UIImage imageNamed:@"huanchong_bj"]];
    }else{//只显示默认图片就可以了
        
        _leftImageView.image = [UIImage imageNamed:@"huanchong_bj"];
        _centerImageView.image = [UIImage imageNamed:@"huanchong_bj"];
        _rightImageView.image = [UIImage imageNamed:@"huanchong_bj"];
    }
    //设置描述
    _label.text = [NSString stringWithFormat:@"这是第%i张图片",_currentImageIndex];

}

- (void)handleTimer{
    if (_dataArray&&_dataArray.count>1) {
        [self scrollToNextPage];
    }
}

- (void)scrollToNextPage{
    CLog(@"scrollToNextPage---%d",_currentImageIndex);
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width*2, 0) animated:YES];
}

- (void)setRelatedViews{
    //重新加载图片
    [self reloadImage];
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
    //设置分页
    _pageControl.currentPage=_currentImageIndex;
    //设置描述
    _label.text = [NSString stringWithFormat:@"这是第%i张图片",_currentImageIndex];
}
#pragma mark- ------------------------puclic------------------------------------
- (void)configViewWithArray:(NSMutableArray*)array;{

    _dataArray  = array;
    
    _scrollView.contentSize = CGSizeMake(_dataArray.count*self.frame.size.width, self.frame.size.height);
    _pageControl.numberOfPages = _dataArray.count;
    [self reloadImage];
    [self startTimer];
    
    
}

#pragma mark-------------------------------------Timer

- (void)startTimer{
  
    [self deallocTimer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(handleTimer) userInfo:nil repeats:YES];
    
}



- (void)deallocTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}


#pragma mark - -----------------------scrollViewDelagate-------------------
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  CLog(@"scrollViewDidEndDecelerating---");
    [self setRelatedViews];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    CLog(@"scrollViewDidEndScrollingAnimation---%d",_currentImageIndex);
     [self setRelatedViews];
}

@end
