//
//  RunloopViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/7/13.
//  Copyright © 2017年 Juny. All rights reserved.
//


#import "HLThread.h"
#import "RunloopViewController.h"
#import <Masonry.h>
@interface RunloopViewController ()

@property (nonatomic, strong)HLThread *subThread; //
@property (nonatomic, strong)UILabel *testLabel; //

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.测试线程的销毁
    [self threadTest];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //在分线程中执行方法
    [self performSelector:@selector(subThreadOpetion) onThread:self.subThread withObject:nil waitUntilDone:NO];
}

- (void)threadTest
{
    HLThread *subThread = [[HLThread alloc] initWithTarget:self selector:@selector(subThreadEntryPoint) object:nil];
    [subThread setName:@"HLThread"];
    [subThread start];
    self.subThread = subThread;
    
 
}

/**
 子线程启动后，启动runloop
 */
- (void)subThreadEntryPoint
{
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        //如果注释了下面这一行，子线程中的任务并不能正常执行
        [runLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        NSLog(@"启动RunLoop前--%@",runLoop.currentMode);
        [runLoop run];
         NSLog(@"我哦哦哦哦哦RunLoop--%@",runLoop.currentMode);
    }
}

/**
 子线程任务
 */
- (void)subThreadOpetion
{
    NSLog(@"启动RunLoop后--%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
    [NSThread sleepForTimeInterval:3.0];
    NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    for (NSInteger i = 1; i <= 5; i++) {
        [[cell.contentView viewWithTag:i] removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd - Drawing index is top priority", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 1;
    [cell.contentView addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
    imageView.tag = 2;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    NSLog(@"current:%@",[NSRunLoop currentRunLoop].currentMode);
    [cell.contentView addSubview:imageView];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
    imageView2.tag = 3;
    UIImage *image2 = [UIImage imageWithContentsOfFile:path];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = image2;
    [cell.contentView addSubview:imageView2];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    label2.numberOfLines = 0;
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor colorWithRed:0 green:100.f/255.f blue:0 alpha:1];
    label2.text = [NSString stringWithFormat:@"%zd - Drawing large image is low priority. Should be distributed into different run loop passes.", indexPath.row];
    label2.font = [UIFont boldSystemFontOfSize:13];
    label2.tag = 4;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
    imageView3.tag = 5;
    UIImage *image3 = [UIImage imageWithContentsOfFile:path];
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.image = image3;
    [cell.contentView addSubview:label2];
    [cell.contentView addSubview:imageView3];
    
    return cell;
}



@end
