//
//  CoreTextViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "CoreTextViewController.h"
#import "ShowView.h"
#import <Masonry.h>
@interface CoreTextViewController ()

@end

@implementation CoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ShowView *view = [[ShowView alloc]init];
    view.frame = CGRectMake(20, 100, 300, 300);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton *buton3 = [[UIButton alloc]init];
    [buton3 setTitle:@"back" forState:UIControlStateNormal];
    buton3.backgroundColor = [UIColor magentaColor];
    [buton3 addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton3];
    [buton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(view.mas_bottom).with.offset(20);
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

- (void)backBtnClick:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
