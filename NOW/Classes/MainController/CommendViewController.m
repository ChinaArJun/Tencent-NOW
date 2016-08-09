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

#define mainURL @"http://service.inke.com/api/live/aggregation?imsi=&uid=147970465&proto=6&idfa=3EDE83E7-9CD1-4186-9F37-EE77B7423265&lc=0000000000000027&cc=TG0001&imei=&sid=20tJHn0JsxdmOGkbNjpEjo3DIKFyoyboTrCjMvP7zNxofi1QNXT&cv=IK3.2.00_Iphone&devi=134a83cdf2e6701fa8f85c099c5e68ac3ea7bd4b&conn=Wifi&ua=iPhone%205s&idfv=5CCB6FE7-1F0F-4288-90DC-946D6F6C45C2&osversion=ios_9.300000&interest=1&location=0"
#define Ratio 708/550
@interface CommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation CommendViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self bulidTableView];
    [self bulidCenterBtn];
    // 添加下拉刷新
    [self addRefresh];
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
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData{
    // 格式
    NSDictionary *dic = @{@"format":@"json"};
    [AFNetwork GET:mainURL parameters:dic success:^(id  _Nonnull json) {
        
        NSArray *listArray = [json objectForKey:@"lives"];
        for (NSDictionary *dic in listArray) {
            MJWeakSelf
            PlayerModel *playerModel = [[PlayerModel alloc] initWithDictionary:dic];
            playerModel.city = dic[@"city"];
            playerModel.portrait = dic[@"creator"][@"portrait"];
            playerModel.name = dic[@"creator"][@"nick"];
            playerModel.online_users = [dic[@"online_users"] intValue];
            NSLog(@"playerModel.online_users = %d",playerModel.online_users);
            playerModel.url = dic[@"stream_addr"];
            [weakSelf.dataList addObject:playerModel];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
        [self.tableView.mj_header endRefreshing];
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
    playerVc.liveUrl = PlayerModel.url;
    playerVc.imageUrl = PlayerModel.portrait;
    [self.navigationController pushViewController:playerVc animated:true];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }return _dataList;
}

@end
