//
//  TestViewController.m
//  MyLibrary
//
//  Created by nero on 15/3/12.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "TestViewController.h"
#import "JYADView.h"
@interface TestViewController ()
@property(nonatomic,strong)JYADView *adView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adView = [[JYADView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.adView];
    self.adView.imageArray = @[@"img_01",@"img_02"];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置图片循环滚动，如果偏移位置大于一个图片的位置，则设置为一个图片的位置
    if (self.adView.scrollView.contentOffset.x > [UIScreen mainScreen].bounds.size.width) {
        self.adView.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width*2, 0);
    }
}

@end
