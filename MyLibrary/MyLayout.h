//
//  MyLayout.h
//  MyLibrary
//
//  Created by nero on 14/12/31.
//  Copyright (c) 2014年 nero. All rights reserved.
//  自定义布局类


#import <UIKit/UIKit.h>
@interface MyLayout : NSObject
+ (void)storyBoradAutoLay:(UIView *)allView;
//修改CGRectMake
/**
 *   如果你只是想单独布局一个View 可以使用这个方法  xywh 这四个数值安装 iPhone5写即可
 *
 *  @param x      320下的x
 *  @param y      320下的y
 *  @param width  320下的w
 *  @param height 320写的h
 *
 *  @return new rect
 */
CG_INLINE CGRect CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
@end
