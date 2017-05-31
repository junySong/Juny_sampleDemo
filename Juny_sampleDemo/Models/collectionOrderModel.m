//
//  collectionOrderModel.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "collectionOrderModel.h"

@implementation collectionOrderModel
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"id": @"orderId",
                                                                  @"productName": @"orderDetails.name",
                                                                  @"price": @"orderDetails.price.usd"
                                                                  }];
}

@end
