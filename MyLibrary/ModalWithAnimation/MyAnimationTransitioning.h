//
//  MyAnimationTransitioning.h
//  ios8New
//
//  Created by nero on 15/1/23.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAnimationTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
/**
 *  是在展示 还是在 销毁
 */
@property (nonatomic, assign,getter=isPresented) BOOL presented;
@end
