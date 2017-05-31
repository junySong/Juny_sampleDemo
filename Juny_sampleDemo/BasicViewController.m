//
//  BasicViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "BasicViewController.h"
#import <Masonry.h>
@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    UIButton *buton3 = [[UIButton alloc]init];
    [buton3 setTitle:@"back" forState:UIControlStateNormal];
    buton3.backgroundColor = [UIColor magentaColor];
    [buton3 addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton3];
    
    [buton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(@(30));
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
}
#pragma mark --------------------btnClick
- (void)backBtnClick:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
