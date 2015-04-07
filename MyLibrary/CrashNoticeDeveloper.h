//
//  CrashNoticeDeveloper.h
//  MyLibrary
//
//  Created by nero on 15/4/1.
//  Copyright (c) 2015年 nero. All rights reserved.
//  程序退出时  可以发送邮件通知开发者

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CrashNoticeDeveloper : NSObject
UIKIT_EXTERN void UncaughtExceptionHandler(NSException *exception);

//在 didFinish直接调用
//NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
@end
