//
//  NSObject+JYCloneProperty.m
//  MJExtensionExample
//
//  Created by nero on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSObject+JYCloneProperty.h"
#import "NSObject+MJIvar.h"
#import "MJIvar.h"
@implementation NSObject (JYCloneProperty)
- (void)clonePropertyFormAInstance:(NSObject *)instance
{
    if ([self isKindOfClass:[instance class]]) return;
    [[instance class] enumerateIvarsWithBlock:^(MJIvar *ivar, BOOL *stop) {
        [self setValue:[ivar valueFromObject:instance] forKey:ivar.name];
    }];
}
@end
