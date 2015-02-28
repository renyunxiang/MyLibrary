//
//  NSObject+JYCloneProperty.h
//  MJExtensionExample
//
//  Created by nero on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JYCloneProperty)
/**
 *  讲另外一个对象的属性复制到自己上面
 *
 *  @param instance 同类的实例
 * @warn  必须是同类的
 */
- (void)clonePropertyFormAInstance:(NSObject *)instance;
@end
