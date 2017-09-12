//
//  BannerViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/7.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import "BannerView1.h"

#import "BannerViewController.h"
#import "BannerView.h"
@interface BannerViewController ()<BannerViewDelegate>
@property (nonatomic, strong)BannerView *bannerView; //
@property (nonatomic, strong)NSMutableArray *dataArray; //
@property (nonatomic, strong)UILabel *label; //
@property (nonatomic, strong) BannerView1 *myBannerView;//
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initMyView];
    [self performSelector:@selector(downLoadDatas) withObject:nil afterDelay:2];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_bannerView startTimer];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
     [_bannerView deallocTimer];
}

#pragma mark --------------------private-------------------------

- (void)initData{
    _dataArray = [NSMutableArray array];
}

- (void)initView{
    [super initView];
    

}

- (void)initMyView{
    _bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.view addSubview:_bannerView];
    _bannerView.delegate = self;
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0,200, SCREEN_WIDTH, 50)];
    [self.view addSubview:_label];
    _label.text = [NSString stringWithFormat:@"%@",@"准备好点击了吗?"];
    
    _myBannerView = [[BannerView1 alloc]initWithFrame:CGRectMake(0, 250, SCREEN_WIDTH, 100)];
    [self.view addSubview:_myBannerView];
    
    
    
}

- (void)downLoadDatas{
    _dataArray = [NSMutableArray arrayWithObjects:
                  @"https://newliveimgfile1.kss.ksyun.com/images/20161018/2016101813424905220e44.png",
                  @"https://newliveimgfile1.kss.ksyun.com/images/20161018/201610181707088020d11f.png",
                  @"https://newliveimgfile1.kss.ksyun.com/images/20161028/20161028162617763f6b04.png",
                  @"https://newliveimgfile1.kss.ksyun.com/images/20161018/2016101813424905220e44.png",
                  @"https://newliveimgfile1.kss.ksyun.com/images/20161018/201610181707088020d11f.png",
                  @"https://newliveimgfile1.kss.ksyun.com/images/20161028/20161028162617763f6b04.png",nil];
    [_bannerView configViewWithDataArray:_dataArray];
    
    
    [_myBannerView configViewWithArray:_dataArray];
}


#pragma mark --------------------delegate-------------------------

- (void)bannerView:(BannerView *)bannerView didSelectedRowAtIndex:(NSUInteger)index{
    _label.text = [NSString stringWithFormat:@"我点击了----%d------",index];
    
    BasicViewController *vc = [[BasicViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}


@end
