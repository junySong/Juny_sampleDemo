//
//  ScalarModel.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "ScalarModel.h"

@implementation ScalarModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"id"])
        return YES;
    
    return NO;
}
@end
