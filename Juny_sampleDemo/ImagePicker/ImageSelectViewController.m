//
//  ImageSelectViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <Masonry.h>
#import "ImageSelectViewController.h"

@interface ImageSelectViewController ()<UIImagePickerControllerDelegate,
UIActionSheetDelegate>

@property (strong, nonatomic)  UIImageView *imageView;

@end

@implementation ImageSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *buton1 = [[UIButton alloc]init];
    [buton1 setTitle:@"打开相册" forState:UIControlStateNormal];
    buton1.backgroundColor = [UIColor purpleColor];
    [buton1 addTarget:self action:@selector(openAlbumBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton1];
    [buton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(@(30));
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    
    
    UIButton *buton2 = [[UIButton alloc]init];
    [buton2 setTitle:@"打开相机" forState:UIControlStateNormal];
    buton2.backgroundColor = [UIColor purpleColor];
    [buton2 addTarget:self action:@selector(openCamaraBtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton2];
    
    [buton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(buton1.mas_bottom).with.offset(20);
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    
    _imageView = [[UIImageView alloc]init];
    _imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(buton2.mas_bottom).with.offset(20);
        make.width.mas_equalTo(@(250));
        make.height.mas_equalTo(@(250));
    }];
    
    UIButton *buton3 = [[UIButton alloc]init];
    [buton3 setTitle:@"back" forState:UIControlStateNormal];
    buton3.backgroundColor = [UIColor magentaColor];
    [buton3 addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton3];
    
    [buton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(_imageView.mas_bottom).with.offset(20);
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
//打开相册
- (void)goToAlbum {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    //    picker.allowsEditing = YES;
    if([[[UIDevice
          currentDevice] systemVersion] floatValue]>=8.0) {
        
        self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        
    }
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}


//打开相机
- (void)opneCamera {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        //        picker.allowsEditing = YES;
        
        picker.sourceType = sourceType;
        if([[[UIDevice
              currentDevice] systemVersion] floatValue]>=8.0) {
            
            self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else
    {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
    
}

#pragma mark -------------------------- 
- (void)backBtnClick:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)openAlbumBtnClick:(UIButton *)sender {
    [self goToAlbum];
}

- (IBAction)openCamaraBtonClick:(UIButton *)sender {
    [self opneCamera];
}

#pragma mark - UIImagePickerController
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{ [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *pickedImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    _imageView.image = pickedImg;
    //当选择的类型是图片
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    picker.delegate = nil;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
@end
