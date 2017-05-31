//
//  snake_case_orderModel.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface snake_case_orderModel : JSONModel
@property (nonatomic) NSInteger orderId;
@property (nonatomic) NSString *orderProduct;
@property (nonatomic) float orderPrice;
@end
