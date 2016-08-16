//
//  PersonalViewController.m
//  NOW
//
//  Created by ArJun on 16/8/16.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()
@property (nonatomic, strong) NSArray *dataList;
@end
@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupDateLiset];
}

- (void)setupDateLiset{
    
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
