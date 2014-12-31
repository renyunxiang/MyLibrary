//
//  MyLayout.m
//  MyLibrary
//
//  Created by nero on 14/12/31.
//  Copyright (c) 2014年 nero. All rights reserved.
//

#import "MyLayout.h"

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height//获取屏幕高度，兼容性测试


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width//获取屏幕宽度，兼容性测试


/**
 *  x轴缩放比例
 */
static float _autoSizeScaleX;
/**
 *  y轴缩放比例
 */
static float _autoSizeScaleY;
@implementation MyLayout

+ (void)initialize{
    if(ScreenHeight > 480){
        _autoSizeScaleX = ScreenWidth/320;
        _autoSizeScaleY = ScreenHeight/568;
    }
    else{
        _autoSizeScaleX = 1.0;
        _autoSizeScaleY = 1.0;
    }
}
//修改CGRectMake
CG_INLINE CGRect CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{

    CGRect rect;
    rect.origin.x = x * _autoSizeScaleX; rect.origin.y = y * _autoSizeScaleY;
    rect.size.width = width * _autoSizeScaleX; rect.size.height = height * _autoSizeScaleY;
    return rect;
}
+ (void)storyBoradAutoLay:(UIView *)allView
{
    for (UIView *temp in allView.subviews) {
        temp.frame = CGRectMake1(temp.frame.origin.x, temp.frame.origin.y, temp.frame.size.width, temp.frame.size.height);
        if (temp.subviews.count) {
            [self storyBoradAutoLay:temp];
        }
    }

}
@end
