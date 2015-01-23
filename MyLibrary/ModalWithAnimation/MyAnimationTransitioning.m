//
//  MyAnimationTransitioning.m
//  ios8New
//
//  Created by nero on 15/1/23.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "MyAnimationTransitioning.h"
#import "UIView+frame.h"
const CGFloat duration = 1.0;

@implementation MyAnimationTransitioning
// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return  duration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
#warning   动画具体实现在这里
    NSLog(@"%s,%s",__func__,__FUNCTION__);
    
    
    if (self.presented) {
        
        //展示动画
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        toView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0.0, 0.2 , 0.5);
//        toView.y = -toView.height;
//        toView.x = toView.width;
        [UIView animateWithDuration:duration animations:^{
//            toView.y = 0;
//            toView.x = 0;
            toView.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else {
        //消除动画
        [UIView animateWithDuration:duration animations:^{
            UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
            fromView.y = -fromView.height;
            fromView.x = -fromView.width;
            fromView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0.5, 0, 0.5);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
