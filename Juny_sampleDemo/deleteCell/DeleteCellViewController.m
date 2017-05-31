//
//  DeleteCellViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <Masonry.h>
#import "DeleteCellViewController.h"
#import "DeleteTableViewCell.h"
@interface DeleteCellViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tablleView;
@property (nonatomic, strong) NSMutableArray *array;//

@end

@implementation DeleteCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _array = [NSMutableArray array];
    for (int i = 0; i<50; i++) {
        [_array addObject:[NSString stringWithFormat:@"I am %d row",i]];
    }
    
    _tablleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tablleView.delegate = self;
    _tablleView.dataSource = self;
    [self.view addSubview:_tablleView];
    
    UIButton *buton3 = [[UIButton alloc]init];
    [buton3 setTitle:@"back" forState:UIControlStateNormal];
    buton3.backgroundColor = [UIColor magentaColor];
    [buton3 addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buton3];
    [buton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(30));
        make.bottom.mas_equalTo(@(-20));
        make.right.mas_equalTo(@(-30));
        make.height.mas_equalTo(@(50));
    }];
    
    
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
#pragma mark --------------------btnClick-------------------------
- (void)backBtnClick:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark --------------tableViewDataSource、tableViewDelegate------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid = @"rid";
    DeleteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: rid];
    if (cell == nil) {
        cell = [[DeleteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        
        //        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, 67, 44)];
        //        view.backgroundColor = [UIColor purpleColor];
        //        [cell.contentView addSubview:  view];
        //
        //
        //        UILabel *label = [[UILabel alloc]init];
        //        label.frame  = CGRectMake(0, 0, 67, 44);
        //        label.textColor = [UIColor blackColor];
        //        label.text = @"爱大红";
        //        label.font = [UIFont systemFontOfSize:15];
        //        [view addSubview:label];
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return TRUE;
    
}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//
//    return UITableViewCellEditingStyleDelete;
//
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
//
//        if (indexPath.row<[self.array count]) {
//
//            [self.array removeObjectAtIndex:indexPath.row];//移除数据源的数据
//
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
//
//        }
//
//    }
//
//}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if (indexPath.row<[self.array count]) {
            
            [self.array removeObjectAtIndex:indexPath.row];//移除数据源的数据
            
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
            
        }
    }];
    action.backgroundColor = [UIColor clearColor];
    
    return @[action];
}
@end
