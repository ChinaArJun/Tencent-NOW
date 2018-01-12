//
//  CommendViewController.m
//  NOW
//
//  Created by ArJun on 16/8/7.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "CommendViewController.h"
#import "PlayerTableViewCell.h"
#import "PlayerViewController.h"
#import "CustomButton.h"
#import "PlayerModel.h"

#define mainURL @"http://live.9158.com/Fans/GetHotLive?page=%ld"
#define Ratio 708/550
@interface CommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@property(nonatomic, assign) NSInteger page;
@end

@implementation CommendViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self addTimerNotifacition];
    [self bulidTableView];
    [self bulidCenterBtn];
    // 添加下拉刷新
    [self addRefresh];
    
}
#pragma mark ---
- (void)addTimerNotifacition{
//    NSTimer *timer = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(loadData) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)bulidTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = [UIScreen mainScreen].bounds.size.width * Ratio + 1;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
- (void)bulidCenterBtn{
    CustomButton *btn = [[CustomButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"logo_3745aaf"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(customBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@50);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-20);
    }];
}
- (void)customBtnClick{
    NSLog(@"%s",__func__);
}
#pragma mark - ---| 添加下拉刷新 |---
- (void)addRefresh {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    
    self.tableView.mj_header = header;
    self.tableView.mj_footer = footer;
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadNewData {
    self.page = 1;
    [self loadData];
}

- (void)loadMoreData {
    self.page ++;
    [self loadData];
}

- (void)loadData{
    
    [self.dataList removeAllObjects];
    // 格式
    NSDictionary *dic = @{@"format":@"json"};
    [AFNetwork GET:[NSString stringWithFormat:@"http://live.9158.com/Fans/GetHotLive?page=%zd", self.page] parameters:dic success:^(id  _Nonnull json) {
        NSLog(@"data = json");
        if (self.page == 1) {
            self.dataList = [PlayerModel mj_objectArrayWithKeyValuesArray:[json objectForKey:@"data"][@"list"]];
            [self.tableView.mj_header endRefreshing];
        } else {
            NSArray *array = [PlayerModel mj_objectArrayWithKeyValuesArray:[json objectForKey:@"data"][@"list"]];
            if (array.count == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [self.tableView.mj_header endRefreshing];
            for (PlayerModel *obj in array) {
                [self.dataList addObject:obj];
            }
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}


#pragma mark - ---| UITableViewDataSource |---

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[PlayerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.playerModel = self.dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayerViewController * playerVc = [[PlayerViewController alloc] init];
    PlayerModel * PlayerModel = self.dataList[indexPath.row];
    playerVc.liveUrl = PlayerModel.flv;
    playerVc.imageUrl = PlayerModel.smallpic;
    [self.navigationController pushViewController:playerVc animated:true];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }return _dataList;
}

@end
