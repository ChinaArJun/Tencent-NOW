//
//  ProfileCellModel.h
//  NOW
//
//  Created by ArJun on 16/8/31.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileCellModel : NSObject
/// 标题
@property (nonatomic, copy) NSString *title;
/// 每栏的图片
@property (nonatomic, copy) NSString *icon;
/// 用户图片
@property (nonatomic, copy) NSString *userIcon;
/// cell右边显示的文字
@property (nonatomic, copy) NSString *rightLabel;
/// 右边消息红点
@property (nonatomic, assign) NSInteger msgNumber;
/// 需要执行的Block
@property (nonatomic, copy) void (^complete)();


- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon;
@end
