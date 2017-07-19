//
//  UITestViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/6/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "DetailViewController.h"

#import "UITestViewController.h"

@interface UITestViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (nonatomic, strong)UIAlertController *alter; //
@end

@implementation UITestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _alter = [UIAlertController alertControllerWithTitle:nil message:@"用户名或密码为空" preferredStyle:UIAlertControllerStyleAlert];
    [_alter addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
    }]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --------------------private-------------------------

/**
 检查输入框的输入是否合法
 */
- (BOOL)checkTFs{
    if (_passWordTextField.text.length&&_userNameTextField) {
        return  YES;
    }else{
        if (_userNameTextField.text.length == 0 && _passWordTextField.text.length == 0) {
            _alter.message = @"用户名和密码为空";
        }else{
            if (_userNameTextField.text.length == 0) {
                _alter.message = @"用户名为空";
            }else{
                _alter.message = @"密码为空";
            }
            
        }
        [self presentViewController:_alter animated:NO completion:^{
            
        }];
    }
  
    return NO;
}
#pragma mark --------------------btnClick-------------------------
- (IBAction)LoginBtnClick:(UIButton *)sender {
    if ([self checkTFs]) {
        if ([_userNameTextField.text isEqualToString:@"username"]&&[_passWordTextField.text isEqualToString:@"pwd"])
        {
            
            DetailViewController *vc = [[DetailViewController alloc]init];
            [self presentViewController:vc animated:NO completion:^{
                
            }];
        }
       
    }
}



@end
