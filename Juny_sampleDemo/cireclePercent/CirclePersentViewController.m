//
//  CirclePersentViewController.m
//  Juny_sampleDemo
//
//  Created by 宋俊红 on 2017/10/19.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "CirclePersentViewController.h"
#import "SWGJprogress.h"

@interface CirclePersentViewController ()
@property (nonatomic,strong)  SWGJprogress *progress;
@end

@implementation CirclePersentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   _progress = [[SWGJprogress alloc ]initWithFrame:CGRectMake(20, 100, 200, 200)];
    [self.view addSubview:_progress];
    [self performSelector:@selector(pregressSelector) withObject:nil afterDelay:3];
    
    
}

- (void)pregressSelector{
    [_progress setPercent:75 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
