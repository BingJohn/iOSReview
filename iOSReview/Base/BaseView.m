//
//  BaseView.m
//  iOSReview
//
//  Created by Apple on 2017/8/2.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
- (instancetype)init{
    if (self == [super init]) {
        self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"网络连接失败，请点击连接重试！";
    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-64);
        make.width.mas_equalTo(HitoScreenW - 100);
        make.height.mas_equalTo(50);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"Load_failed"];
    [self addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(label.mas_top).offset(-10);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(HitoScreenW - 100);
        make.height.mas_equalTo(80);
    }];
    
    UIColor *iosSystemBlue = [UIColor colorWithRed:18/255.0 green:150/255.0 blue:219/255.0 alpha:1];
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderWidth = 1;
    button.layer.borderColor = [iosSystemBlue CGColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:iosSystemBlue forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(clickLoadBtn) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置图像大小
    [button setImage:[UIImage imageNamed:@"Refresh_Img"] forState:UIControlStateNormal];
    [button setTitle:@"重新加载" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setImageEdgeInsets:UIEdgeInsetsMake(7,10,7,115)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(button.frame.size.height/2, -button.imageView.frame.size.width+10, 0, 0)];
    
    // 设置布局
   
    [self addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(40);
    }];
}

- (void)clickLoadBtn{
    if (self.clickLoadBtnBlock) {
        self.clickLoadBtnBlock();
    }
}


@end
