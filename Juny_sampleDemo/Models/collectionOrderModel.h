//
//  collectionOrderModel.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <JSONModel/JSONModel.h>

//@class collectionOrderModel;
//@protocol collectionOrderModel <NSObject>
//
//
//@end

@interface collectionOrderModel : JSONModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *productName;
@property (nonatomic) float price;
@end
