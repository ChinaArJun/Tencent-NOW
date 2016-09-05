//
//  ProfileCell.m
//  NOW
//
//  Created by ArJun on 16/9/2.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "ProfileCell.h"
#import "ProfileCellArrowModel.h"

@interface ProfileCell ()
@property (nonatomic, weak) UIButton *userIconBtn;
@property (nonatomic, weak) UILabel *rightLabel;
@property (nonatomic, weak) UIView *buttomLineView;
@end

@implementation ProfileCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton *btn = [[UIButton alloc]init];
        self.userIconBtn = btn;
        
        UIView *buttomLineView= [[UIView alloc] init];
        self.buttomLineView = buttomLineView;
        buttomLineView.hidden = YES;
        buttomLineView.alpha = 0.6;
        buttomLineView.backgroundColor = [UIColor grayColor];
        [self addSubview:buttomLineView];
        
        UILabel *label = [[UILabel alloc]init];
        self.rightLabel = label;
        [label setFont:[UIFont systemFontOfSize:14]];
        [label setTextColor:[UIColor colorWithWhite:0.502 alpha:1.000]];
        
    }
    return self;
}

- (void)setCellModel:(ProfileCellModel *)cellModel
{
    _cellModel = cellModel;
    self.textLabel.text = cellModel.title;
    self.textLabel.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
    self.textLabel.font = [UIFont systemFontOfSize:16];
    if (cellModel.icon) {
        self.imageView.image = [UIImage imageNamed:cellModel.icon];
    }
    if (cellModel.userIcon) {
        [self.userIconBtn setImage:[UIImage imageNamed:cellModel.userIcon] forState:UIControlStateNormal];
        [self addSubview:self.userIconBtn];
    }
    if (cellModel.rightLabel) {
        self.self.rightLabel.text = cellModel.rightLabel;
        [self addSubview:self.rightLabel];
    }

    if ([self.cellModel isKindOfClass:[ProfileCellArrowModel class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

#define msgBtnWidth 15
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.userIconBtn setFrame:CGRectMake(CGRectGetWidth(self.frame)-100, 0, 70, 70)];
    [self.userIconBtn setCenterY:self.frame.size.width * 0.5];
    
    [self.rightLabel setFrame:CGRectMake(CGRectGetWidth(self.frame)-140, 0, 200, 50)];
    [self.rightLabel setCenterY:self.height * 0.5];
    
    self.buttomLineView.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5,SCREENWIDTH, 0.5);
}

- (void)beautifyCell
{
    self.textLabel.font = [UIFont systemFontOfSize:18.f];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.f];
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = BMColor(225, 219, 219);
    self.selectedBackgroundView = selectedView;
    self.textLabel.textColor = [UIColor darkGrayColor];
}


@end
