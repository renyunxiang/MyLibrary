//
//  JYADView.h
//  ScrollView图片轮播器
//
//  Created by nero on 15/3/12.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KADViewheight 150
@interface JYADView : UIView
@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic,copy)void (^adDidClick)(NSInteger index);
@end

