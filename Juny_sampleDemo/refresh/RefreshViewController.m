//
//  RefreshViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "RefreshViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
@interface RefreshViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) MJChiBaoZiHeader *header ;
@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    _header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header = _header;
    [_header beginRefreshing];
    
    self.tableView.mj_footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
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

- (void)loadNewData{
    [self performSelector:@selector(endRefresh) withObject:nil afterDelay:3];
}

- (void)endRefresh{
    [_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    TestViewController *vc = [[TestViewController alloc]init];
//    [self presentViewController:vc animated:YES completion:^{
//        
//    }];
//}

#pragma mark------------------tableViewDatesource,tableViewDelegate----------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid = @"cellIdR";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: rid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"This is  the %ld row",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}

@end
