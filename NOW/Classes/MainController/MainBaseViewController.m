//
//  MainBaseViewController.m
//  NOW
//
//  Created by ArJun on 16/8/7.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "MainBaseViewController.h"
#import "CommendViewController.h"
#import "RegardViewController.h"
#import <WMPageController.h>

@implementation MainBaseViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self bulidNavigationBarView];
}
- (void)bulidNavigationBarView
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClick)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"personal"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarClick)];
}
- (void)rightBarClick{
    
}
- (void)leftBarClick{
    
}

@end
