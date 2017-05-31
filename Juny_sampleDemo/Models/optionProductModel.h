//
//  optionProductModel.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface optionProductModel : JSONModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSString  <Optional>*name;
@property (nonatomic) float price;
@property (nonatomic) NSNumber <Optional> *uuid;
@end
