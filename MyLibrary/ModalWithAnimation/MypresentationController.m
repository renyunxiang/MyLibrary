//
//  MypresentationController.m
//  ios8New
//
//  Created by nero on 15/1/23.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "MypresentationController.h"

@implementation MypresentationController
/*  只是单纯改变大小 实现这个方法
- (CGRect)frameOfPresentedViewInContainerView
{
//    return  CGRectMake(20, 20, 200, 200);
//    return  self.containerView.bounds;
    return  CGRectInset(self.containerView.bounds, 50, 50);//上下左右切掉各50

}
 */


#warning 如果动画自定义的画  所有的view都要自己加
- (void)presentationTransitionWillBegin
{
    
    NSLog(@"%s",__FUNCTION__);
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
}
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    NSLog(@"%s",__FUNCTION__);
}
- (void)dismissalTransitionWillBegin
{
    NSLog(@"%s",__FUNCTION__);
}
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    [self.presentedView removeFromSuperview];
    NSLog(@"%s",__FUNCTION__);
}
@end
