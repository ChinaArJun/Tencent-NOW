//
//  BaseTableViewController.m
//  NOW
//
//  Created by ArJun on 16/8/31.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "BaseTableViewController.h"
#import "ProfileCellGroupModel.h"
#import "ProfileCellArrowModel.h"
#import "MainNavigationController.h"
#import "ProfileCellModel.h"
#import "ProfileCell.h"

@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end
@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
    
}

- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  0.1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ProfileCellGroupModel *group = self.groups[section];
    return group.cells.count;
}

#define cellIdentifier @"cell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ProfileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ProfileCellGroupModel *group = self.groups[indexPath.section];
    ProfileCellModel *model = group.cells[indexPath.row];
    cell.cellModel = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ProfileCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ProfileCellModel *item = cell.cellModel;
    
    if (item.complete) {  // 执行blockk
        item.complete();
        return;
    }
    
    if ([item isKindOfClass:[ProfileCellArrowModel class]]){
        ProfileCellArrowModel *arrow = (ProfileCellArrowModel *)item;
        Class vcName = arrow.target;
        UIViewController *vc = [[vcName alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - 懒加载
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


@end
