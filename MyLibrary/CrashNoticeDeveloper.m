//
//  CrashNoticeDeveloper.m
//  MyLibrary
//
//  Created by nero on 15/4/1.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "CrashNoticeDeveloper.h"

@implementation CrashNoticeDeveloper
void UncaughtExceptionHandler(NSException *exception) {
    
    NSArray *arr = [exception callStackSymbols];
    
    NSString *reason = [exception reason];
    
    NSString *name = [exception name];
    
    NSString *urlStr = [NSString stringWithFormat:@"mailto://jiangyi@zhuqu.com?subject=bug报告&body=感谢您的配合!<br><br><br>"
                        
                        "错误详情:<br>%@<br>--------------------------<br>%@<br>---------------------<br>%@",
                        
                        name,reason,[arr componentsJoinedByString:@"<br>"]];
    
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[UIApplication sharedApplication] openURL:url];
    
}
@end
