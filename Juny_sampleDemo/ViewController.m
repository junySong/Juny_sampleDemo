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


#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray *dataSourceArray;
@property (weak, nonatomic) IBOutlet UITableView *tableVeiw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataSourceArray =  @[@"自定义刷新",@"贝塞尔曲线",@"二维码生成和扫描",@"仿创建一条微博的动画",@"仿格瓦拉转场动画",@"选择照片",@"CoreText",@"删除单元格",@"jsonModel",@"YYText",@"entrypt",@"banner",@"PageController"];
    
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
            
        }
            break;

        case 14://
        {
            
        }
            break;

            
        default:
            break;
    }
}


@end
