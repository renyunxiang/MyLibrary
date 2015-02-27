//
//  NSObject+Runtime.h
//  MyLibrary
//
//  Created by nero on 15/2/27.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
/**
 *  从一个字典中还原成一个实体对象
 *
 *  @param dict 字典
 */
- (void)dictionaryForObject:(NSDictionary*) dict;
/**
 *  把一个实体对象，封装成字典Dictionary
 *
 *  @return 对象字典
 */
- (NSDictionary *)convertDictionary;
/**
 *  获取class 的属性
 *
 *  @param clazz class 对象
 *
 *  @return 属性数组
 */
- (NSArray *)getPropertyList: (Class)clazz;
/**
 *  返回对象的类名
 *
 *  @return className
 */
- (NSString *)className;
@end
