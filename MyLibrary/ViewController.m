//
//  ViewController.m
//  MyLibrary
//
//  Created by nero on 14/12/13.
//  Copyright (c) 2014年 nero. All rights reserved.
//

#import "ViewController.h"
#import "GUIDTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog([GUIDTool GUID]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
