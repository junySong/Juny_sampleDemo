//
//  QRandMatixCreatViewController.m
//  Juny_ERAndMatixCode
//
//  Created by 宋俊红 on 17/3/31.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "QRandMatixCreatViewController.h"

@interface QRandMatixCreatViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@end

@implementation QRandMatixCreatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark------------------private----------------------
- (void)pop{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)back:(UIButton *)sender {
    [self pop];
}
- (IBAction)createMatixCodeImageBtnClick:(UIButton *)sender {
    if (_textfield.text.length) {
    

        UIImage *image = [UIImage createCode128BarCodeImageWithString:_textfield.text];
        _imageView.image = image;
        
        
    }
   
}

- (IBAction)createQRcodeImageBtnClick:(UIButton *)sender {
    
    if (_textfield.text.length) {

        UIImage *image = [UIImage createQRcodeImageWithString:_textfield.text];
        _imageView.image = image;
        
        UIImage *image1 = [UIImage createQRcodeImageWithString:_textfield.text size:200];
        _bottomImageView.image = image1;
        
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
