//
//  QRcodeViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import "ScanViewController.h"
#import "QRandMatixCreatViewController.h"
#import "AppDelegate.h"

#import "QRcodeAndMatixViewController.h"

#import <Masonry.h>

@interface QRcodeAndMatixViewController ()<ScanViewControllerDelegate>


@property (nonatomic, strong)UILabel *tipsLabel;
@end

@implementation QRcodeAndMatixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    
    // Do any additional setup after loading the view.
    UIButton *buton1 = [[UIButton alloc]init];
    [buton1 setTitle:@"扫描" forState:UIControlStateNormal];
    buton1.backgroundColor = [UIColor purpleColor];
    [buton1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton1];
    [buton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(@(30));
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    
    
    UIButton *buton2 = [[UIButton alloc]init];
    [buton2 setTitle:@"生成二维码和条形码" forState:UIControlStateNormal];
    buton2.backgroundColor = [UIColor purpleColor];
    [buton2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton2];
    
    [buton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(buton1.mas_bottom).with.offset(20);
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];

    _tipsLabel = [[UILabel alloc]init];
    _tipsLabel.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_tipsLabel];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.right.mas_equalTo(@(-30));
        make.bottom.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    
    UIButton *buton3 = [[UIButton alloc]init];
    [buton3 setTitle:@"返回上一级" forState:UIControlStateNormal];
    buton3.backgroundColor = [UIColor purpleColor];
    [buton3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton3];
    
    [buton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(buton2.mas_bottom).with.offset(20);
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -------------------------- btnClick-------

- (void)btn1Click:(UIButton*)sender{
    ScanViewController *vc = [[ScanViewController alloc]init];
    vc.delegate = self;
    [self presentViewController:vc animated:NO completion:^{
        
    }];
}

- (void)btn2Click:(UIButton*)sender{
    AppDelegate *app = ( AppDelegate *)[[UIApplication sharedApplication]delegate];
    QRandMatixCreatViewController *vc = [app.window.rootViewController.storyboard  instantiateViewControllerWithIdentifier:@"QRandMatixCreatViewController"];
    [self presentViewController:vc animated:NO completion:^{
        
    }];
}

- (void)btn3Click:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark------------------ScanViewControllerDelegate----------------------
- (void)scanViewController:(ScanViewController *)scanVC result:(NSString *)result{
    if (result) {
        _tipsLabel.text = result;
    }
}

@end
