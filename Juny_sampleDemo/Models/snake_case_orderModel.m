//
//  snake_case_orderModel.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "snake_case_orderModel.h"

@implementation snake_case_orderModel
+ (JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}
@end
