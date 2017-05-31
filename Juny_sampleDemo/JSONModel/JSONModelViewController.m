//
//  JSONModelViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <JSONModel.h>
#import "CountryModel.h"
#import "ProductModel.h"
#import "OrderModel.h"
#import "collectionOrderModel.h"
#import "snake_case_orderModel.h"
#import "optionProductModel.h"
#import "IgnoreModel.h"
#import "ScalarModel.h"

#import "JSONModelViewController.h"
#import <Masonry.h>

@interface JSONModelViewController ()

@end

@implementation JSONModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self test];
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
#pragma mark --------------------private-------------------------
- (void)test{
    
    //基本的转换
    NSString *string = @"{ \"id\": 10, \"country\": \"Germany\", \"dialCode\": 49.5, \"isInEurope\": true }";
    JSONModelError *error;
    CountryModel *country = [[CountryModel alloc] initWithString:string error:&error];
    NSLog(@"%@",country);
    //嵌套转换
    NSString *string1 = @"{\"orderId\": 104,\"totalPrice\": 103.45,\"products\": {\"id\": 123,\"name\": \"Product #1\",\"price\": 12.95}}";
    
    //    OrderModel *order = [[OrderModel alloc] initWithString:string1 error:&error];
    //    ProductModel *pd = order.products ;
    //    NSLog(@"%@%@%.2f",pd.id,pd.name,pd.price);
    
    //带数组的嵌套转换
    NSString *string2 = @"{\"orderId\": 104,\"totalPrice\": 103.45,\"products\": [{\"id\": 123,\"name\": \"Product #1\",\"price\": 12.95},{\"id\": 137,\"name\": \"Product #2\",\"price\": 82.95}]}";
    
    OrderModel *order = [[OrderModel alloc] initWithString:string2 error:&error];
    ProductModel *pd = [order.products objectAtIndex:0];
    NSLog(@"%d,%@,%.2f",pd.id,pd.name,pd.price);
    NSLog(@"%d",order.products.count);
    
    //嵌套键映射
    NSString *string3 = @"{\"orderId\": 104,\"orderDetails\": {\"name\": \"Product #1\",\"price\": {\"usd\": 12.95}}}";
    collectionOrderModel *newOrderModel = [[collectionOrderModel alloc]initWithString:string3 error:&error];
    
    NSLog(@"%d,%@,%.2f",newOrderModel.id,newOrderModel.productName,newOrderModel.price);
    NSLog(@"%@",error);
    
    //映射到snake_case（去掉中间的下划线）
    NSString *string4 = @"{\"order_id\": 104,\"order_product\": \"Product #1\",\"order_price\":12.95}";
    snake_case_orderModel *orderModel1 = [[snake_case_orderModel alloc]initWithString:string4 error:&error];
    NSLog(@"%d,%@,%.2f",orderModel1.orderId,orderModel1.orderProduct,orderModel1.orderPrice);
    NSLog(@"%@",error);
    
    //可选属性（即可以缺少或为null）
    NSString *string5 = @"{\"id\": 123,\"name\": null,\"price\": 12.95}";
    optionProductModel *op = [[optionProductModel alloc]initWithString:string5 error:&error];
    NSLog(@"%ld,%@,%.2f,%@",op.id,op.name,op.price,op.uuid);
    NSLog(@"%@",error);
    
    //被忽略的属性（即JSONModel完全忽略它们）
    NSString *string6 = @"{\"id\": 123,\"name\": null}";
    IgnoreModel *ignoreModel = [[IgnoreModel alloc]initWithString:string6 error:&error];
    NSLog(@"%@",error);
    
    //使标量类型可选
    NSString *string7 = @"{\"id\": null}";
    ScalarModel *scalarModel = [[ScalarModel alloc]initWithString:string7 error:&error];
    NSLog(@"%@",error);
    
    //将模型导出为NSDictionary或JSON
    ProductModel *pm = [ProductModel new];
    pm.name = @"Some Name";
    
    // convert to dictionary
    NSDictionary *dict = [pm toDictionary];
    NSLog(@"%@",dict);
    // convert to json
    NSString *string8 = [pm toJSONString];
    NSLog(@"%@",string8);
    
}
#pragma mark --------------------btnClick
- (void)backBtnClick:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
