//
//  TestViewController.m
//  MyLibrary
//
//  Created by nero on 15/1/23.
//  Copyright (c) 2015年 nero. All rights reserved.
//  modal 动画实现

#import "TestViewController.h"
#import "MyTransition.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIViewController *vc = [UIViewController new];
//    即可
    vc.modalPresentationStyle = UIModalPresentationCustom;
//    
    vc.transitioningDelegate = [MyTransition sharedMyTransition];

    
#warning 1 如果控制器是在sb里面 可以通过sb加载控制器 然后再设置属性
#warning 2 如果是想拖线的话选择 presntal modally 就行了
    
}

@end
