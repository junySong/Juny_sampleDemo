//
//  CountryModel.h
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/26.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface CountryModel : JSONModel
@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *country;
@property (nonatomic) CGFloat dialCode;
@property (nonatomic) BOOL isInEurope;
@end
