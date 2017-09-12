//
//  RegularViewController.m
//  Juny_sampleDemo
//
//  Created by 宋俊红 on 2017/8/24.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "RegularViewController.h"

@interface RegularViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFIled;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation RegularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)BtnClick:(UIButton *)sender {
    
  BOOL match =  [self judgeString:_textFIled.text];
    if (match) {
        _outputLabel.text = @"输出：符合规则";
    }else{
        _outputLabel.text = @"输出：不符合规则";
    }
}

/**
 校验6到16位的数字和字母组合

 @param string string description
 @return return value description
 */
-(BOOL)judgeString:(NSString *)string{
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    // 创建谓词对象并设定条件的表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    // 判断的字符串
 
    // 对字符串进行判断
    
    BOOL match = [predicate evaluateWithObject:string];
     
    return match;
}

@end
