//
//  ScanViewController.m
//  Juny_ERAndMatixCode
//
//  Created by 宋俊红 on 17/3/31.
//  Copyright © 2017年 Juny_song. All rights reserved.
//
/*
 **使用AVFoundation来捕获图像和电影,AVCam仅在实际的设备上运行，无论是iPad还是iPhone，无法在模拟器中运行。
 **在程序里打开设置界面
 	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
 */

#import <Masonry.h>

#import "ScanViewController.h"

@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>


@property (nonatomic,strong)AVCaptureDevice *device;//设备
@property (nonatomic,strong)AVCaptureDeviceInput *input;
@property (nonatomic,strong)AVCaptureMetadataOutput *output;
@property (nonatomic,strong)AVCaptureSession *session;//生成绘画
@property (nonatomic,strong)AVCaptureVideoPreviewLayer *preview;//生成图层
@property (nonatomic) dispatch_queue_t sessionQueue;//队列

@property (nonatomic,strong)UIImageView *logoImageView;
@property (nonatomic,strong)UIView *line;
@property BOOL isLightOn;  //默认未打开
@property (nonatomic, strong) UIImagePickerController *imagePickerController;


@property (nonatomic, strong)UIButton *popButton;
@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkAuthorizedAndSetting];

    
    _popButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_popButton setTitle:@"back" forState:UIControlStateNormal];
    _popButton.backgroundColor = [UIColor cyanColor];
    [_popButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_popButton];
    
    [_popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.top.mas_equalTo(@(30));
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark------------------private----------------------

/**
 先检查授权，不管授权返回时候，都初始化输入和输出设备，如果授权显示拒绝，做相应的处理
 */
- (void)checkAuthorizedAndSetting{
    
    
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^( BOOL granted ) {
        if ( ! granted ) {
            NSLog(@"未授权");
            //返回上一级，同时提示用户给app相机的使用权限
            [self pop];
            
            return;
        }else{
          
            
        }
        
    }];
    [self setupCamara];
    
   

}

- (void)setupCamara{
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (_input == nil) {
        //提醒用户打开权限，返回上级页面
        [self pop];
        return;
    }else{
        _output = [[AVCaptureMetadataOutput alloc]init];
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        
        _session = [[AVCaptureSession alloc]init];
        [_session setSessionPreset:AVCaptureSessionPresetHigh];
        if ([_session canAddInput:_input]) {
            [_session addInput:_input];
        }else{
            [self pop];
            return;
        }
        
        if ([_session canAddOutput:_output]) {
            [_session addOutput:_output];
            [_output setMetadataObjectTypes:[NSArray arrayWithObjects:AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode, nil]];
        }
    }
    
    _preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = self.view.bounds;
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    [_session startRunning];
}


- (void)pop{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark------------------btnCLick----------------------

- (IBAction)backBtnClick:(UIButton *)sender {
    [self pop];
}

#pragma mark ---------------AVCaptureMetadataOutputObjectsDelegate----------------------------

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
    
    __weak typeof(self) wself = self;
    
  
   
    if ([wself.delegate respondsToSelector:@selector(scanViewController:result:)]) {
        [wself.delegate scanViewController:self result:stringValue];
      
    }
    
      [self pop];
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
