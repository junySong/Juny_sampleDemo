//
//  OrderModel.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/27.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import "ProductModel.h"
#import <JSONModel/JSONModel.h>
#import <JSONModel/JSONModelLib.h>


@interface OrderModel : JSONModel
@property (nonatomic) NSInteger orderId;
@property (nonatomic) float totalPrice;
@property (nonatomic) NSArray <ProductModel> *products;
@end
