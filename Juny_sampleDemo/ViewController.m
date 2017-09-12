//
//  ViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "RefreshViewController.h"
#import "BeizierViewController.h"
#import "QRcodeAndMatixViewController.h"
#import "WeiboAniViewController.h"
#import "RootViewController.h"
#import "ImageSelectViewController.h"
#import "CoreTextViewController.h"
#import "DeleteCellViewController.h"
#import "JSONModelViewController.h"
#import "YYTextViewController.h"
#import "EntryptViewController.h"
#import "BannerViewController.h"
#import "PageViewController.h"
#import "UITestViewController.h"
#import "ShapeLayerViewController.h"
#import "RunloopViewController.h"
#import "WKWebViewController.h"
#import "RegularViewController.h"


#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray *dataSourceArray;
@property (weak, nonatomic) IBOutlet UITableView *tableVeiw;
@property (nonatomic, strong) UIActivityIndicatorView *testActivityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataSourceArray =  @[@"自定义刷新",@"贝塞尔曲线",@"二维码生成和扫描",@"仿创建一条微博的动画",@"仿格瓦拉转场动画",@"选择照片",@"CoreText",@"删除单元格",@"jsonModel",@"YYText",@"entrypt",@"banner",@"PageController",@"UITestVC",@"ShapeLayer",@"RunLoop",@"WKWebView",@"正则校验"];
    [self performSelector:@selector(fuction1) withObject:nil afterDelay:3];
    
}

- (void)fuction1{
    
//    [_testActivityIndicator stopAnimating];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认支付" message:@"请确认是否使用账户余额支付该课程，支付成功后即刻观看本课程内所有视频哦 ~" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    
//    [alertController addAction:cancelAction];
//    [alertController addAction:sureAction];
//    
//    [self presentViewController:alertController animated:YES completion:^{
//        
//    }];

}

- (void)fuction2{
//    _testActivityIndicator.hidden = NO;
    [_testActivityIndicator startAnimating];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -------------------------- tableViewDelegate,tableViewDataSource----------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [_dataSourceArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0://自定义刷新
        {
            RefreshViewController *vc = [[RefreshViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 1://贝塞尔曲线
        {
            BeizierViewController *vc = [[BeizierViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 2://二维码的生成和扫描
        {
            QRcodeAndMatixViewController *vc = [[QRcodeAndMatixViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 3://仿微博动画
        {
            WeiboAniViewController *vc = [[WeiboAniViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 4://仿格瓦拉转场动画
        {
            RootViewController *vc = [[RootViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
           [self presentViewController:nav animated:YES completion:^{
                
            }];

        }
            break;
        case 5://选择照片
        {
            ImageSelectViewController *vc = [[ImageSelectViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 6://CoreText
        {
            CoreTextViewController *vc = [[CoreTextViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 7://自定义删除单元格
        {
            DeleteCellViewController *vc = [[DeleteCellViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 8://jsonModel
        {
            JSONModelViewController *vc = [[JSONModelViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 9://YYText
        {
            YYTextViewController *vc = [[YYTextViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 10://
        {
            EntryptViewController *vc = [[EntryptViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 11://
        {
            BannerViewController *vc = [[BannerViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;

        case 12://
        {
            PageViewController *vc = [[PageViewController alloc]init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;

        case 13://
        {
            UITestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UITestViewController"];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;

        case 14://TLCardTicketViewController
            
        {
            ShapeLayerViewController *vc = [[ShapeLayerViewController alloc]init];
            [self presentViewController:vc animated:NO completion:^{
                
            }];
        }
            break;
        case 15://TLCardTicketViewController
            
        {
            RunloopViewController *vc = [[RunloopViewController alloc]init];
            [self presentViewController:vc animated:NO completion:^{
                
            }];
        }
            break;
            
        case 16://wkwebView
            
        {
            WKWebViewController *vc =[[WKWebViewController alloc]init];
            vc.urlSring = @"https://www.baidu.com/";
            [self presentViewController:vc animated:NO completion:^{
                
            }];

        }
            break;
        case 17://TLCardTicketViewController
            
        {
            RegularViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"RegularViewController"];
        
            [self presentViewController:vc animated:NO completion:^{
                
            }];

        }
            break;
        case 18://TLCardTicketViewController
            
        {
            
        }
            break;
        case 19://TLCardTicketViewController
            
        {
            
        }
            break;


            
        default:
            break;
    }
}


@end
