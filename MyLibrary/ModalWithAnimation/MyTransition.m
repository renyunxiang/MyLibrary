//
//  MyTransition.m
//  ios8New
//
//  Created by nero on 15/1/23.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "MyTransition.h"
#import "MypresentationController.h"
#import "MyAnimationTransitioning.h"
@implementation MyTransition
HMSingletonM(MyTransition)

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    MypresentationController *my = [[MypresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
    return  my;
    
}
#pragma mark - 设置动画来自谁
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    //    这是展示动画
    MyAnimationTransitioning *presentAnim = [MyAnimationTransitioning new];
    presentAnim.presented = YES;
    return  presentAnim;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    //    这是消除动画
    MyAnimationTransitioning *presentAnim = [MyAnimationTransitioning new];
    presentAnim.presented = NO;
    return  presentAnim;
}

@end
