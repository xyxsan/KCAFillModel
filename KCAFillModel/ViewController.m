//
//  ViewController.m
//  KCAFillModel
//
//  Created by apple on 17/8/14.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "ViewController.h"
#import "FillModeVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FillMode";
    self.dataSource = @[@"kCAFillModeForwards",@"kCAFillModeBackwards",@"kCAFillModeBoth",@"kCAFillModeRemoved",];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44.f;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00000001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            [self pushToFillModelVC:kCAFillModeForwards];
        }
            break;
        case 1:
        {
            [self pushToFillModelVC:kCAFillModeBackwards];
        }
            break;
        case 2:
        {
            [self pushToFillModelVC:kCAFillModeBoth];
        }
            break;
        case 3:
        {
            [self pushToFillModelVC:kCAFillModeRemoved];
        }
            break;
   
        default:
            break;
    }
}

- (void)pushToFillModelVC:(NSString *)fillMode{
    FillModeVC *fillModeVC = [[FillModeVC alloc]initWithFillMode:fillMode];
    [self.navigationController pushViewController:fillModeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
