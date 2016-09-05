//
//  WebViewController.m
//  NOW
//
//  Created by ArJun on 16/9/2.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "WebViewController.h"
#define arJun @"https://github.com/ChinaArJun"
@interface WebViewController ()
@property (nonatomic, strong) UIWebView *webView;

@end
@implementation WebViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self bulidWebView];
}
- (void)bulidWebView{
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest *res = [NSURLRequest requestWithURL:[NSURL URLWithString:arJun]];
    [_webView loadRequest:res];
    [self.view addSubview:_webView];
}
@end
