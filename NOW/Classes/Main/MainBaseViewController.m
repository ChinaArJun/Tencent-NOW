//
//  MainBaseViewController.m
//  NOW
//
//  Created by ArJun on 16/8/7.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "MainBaseViewController.h"
#import "CommendViewController.h"
#import "FansViewController.h"
#import "ProfileViewController.h"
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
    WMPageController *page = [self addPageController];
    [self showViewController:page sender:nil];
}
- (void)leftBarClick{
    ProfileViewController *personal = [[ProfileViewController alloc]init];
    [self showViewController:personal sender:nil];
}


- (WMPageController *)addPageController{
    NSMutableArray *salesVCs = [[NSMutableArray alloc] init];
    NSMutableArray *salesVCTitles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        FansViewController *vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [FansViewController new];
                title = @"已关注";
                break;
            case 1:
                vcClass = [FansViewController new];
                title = @"未关注";
                break;
        }
        [salesVCs addObject:vcClass.class];
        [salesVCTitles addObject:title];
    }
    
    WMPageController *salesVC = [[WMPageController alloc] initWithViewControllerClasses:salesVCs andTheirTitles:salesVCTitles];
    //在导航栏上展示
    salesVC.progressHeight = 3;
    salesVC.menuHeight = 44;
    salesVC.menuViewStyle = WMMenuViewStyleLine;
    salesVC.titleSizeSelected = 18;
    salesVC.titleSizeNormal = 18;
    salesVC.titleColorSelected = [UIColor colorWithRed:28/255.0 green:206/255.0 blue:109/255.0 alpha:1];
    salesVC.menuViewContentMargin = 30;
    salesVC.showOnNavigationBar = YES;
    salesVC.menuBGColor = [UIColor clearColor];
    salesVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    return salesVC;
}

@end
