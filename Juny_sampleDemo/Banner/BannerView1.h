//
//  BannerView1.h
//  Juny_sampleDemo
//
//  Created by 宋俊红 on 2017/9/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView1 : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;//

- (void)configViewWithArray:(NSMutableArray*)array;

- (void)startTimer;
- (void)deallocTimer;

@end
