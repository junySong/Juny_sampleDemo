//
//  ProductModel.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/27.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <JSONModel/JSONModelLib.h>
#import <JSONModel/JSONModel.h>
@class ProductModel;
@protocol ProductModel <NSObject>
@end


@interface ProductModel : JSONModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) float price;

@end
