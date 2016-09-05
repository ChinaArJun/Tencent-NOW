//
//  FansViewController.m
//  NOW
//
//  Created by ArJun on 16/8/17.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "FansViewController.h"

@interface FansViewController ()
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *label;
@end

@implementation FansViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"error"]];
    _img.center = self.view.center;
    _img.mj_y -=50;
    [self.view addSubview:_img];
    
    _label = [[UILabel alloc]init];
    _label.textColor = [UIColor grayColor];
    _label.text = @"还没有人跟你说话,找个人聊聊";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.frame = CGRectMake(0, 0, SCREENWIDTH, 30);
    _label.mj_y = CGRectGetMaxY(_img.frame)+10;
    [self.view addSubview:_label];
}


- (void)setContentText:(NSString *)contentText{
    _contentText = contentText;
    _label.text = self.contentText;
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
