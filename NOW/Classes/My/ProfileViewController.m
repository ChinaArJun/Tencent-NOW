//
//  PersonalViewController.m
//  NOW
//
//  Created by ArJun on 16/8/16.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileCellArrowModel.h"
#import "ProfileCellGroupModel.h"
#import "ProfileCellModel.h"
#import "WebViewController.h"

@interface ProfileViewController ()
@property (nonatomic, strong) NSArray *dataList;
@end
@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我";
    [self setupDateLiset];
}

- (void)setupDateLiset{
    ProfileCellArrowModel *liveRecord = [[ProfileCellArrowModel alloc]initWithTitle:@"精彩回放" icon:@"liveRecord"];
    ProfileCellArrowModel *profit = [[ProfileCellArrowModel alloc]initWithTitle:@"我的收益(元)" icon:@"profit"];
    ProfileCellArrowModel *money = [[ProfileCellArrowModel alloc]initWithTitle:@"我的金币" icon:@"money"];
    ProfileCellArrowModel *history = [[ProfileCellArrowModel alloc]initWithTitle:@"浏览记录" icon:@"history"];
    ProfileCellArrowModel *setting = [[ProfileCellArrowModel alloc]initWithTitle:@"设置" icon:@"setting"];
    
    ProfileCellGroupModel *group = [[ProfileCellGroupModel alloc]initWithCells:@[liveRecord,profit,money,history,setting]];
    [self.groups addObject:group];
    
    Class target = [WebViewController class];
    
    liveRecord.target = target;
    profit.target = target;
    money.target = target;
    history.target = target;
    setting.target = target;
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
