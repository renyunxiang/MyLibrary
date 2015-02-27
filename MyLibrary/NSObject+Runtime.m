//
//  NSObject+Runtime.m
//  MyLibrary
//
//  Created by nero on 15/2/27.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
@implementation NSObject (Runtime)

/**
 *  获取class 的属性
 *
 *  @param clazz class 对象
 *
 *  @return 属性数组
 */
- (NSArray *)getPropertyList: (Class)clazz
{
    u_int count;
    objc_property_t *properties = class_copyPropertyList(clazz, &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertyArray;
}

/**
 *  把一个实体对象，封装成字典Dictionary
 *
 *  @return 对象字典
 */
- (NSDictionary *)convertDictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSArray *propertyList = [self getPropertyList:[self class]];
    for (NSString *key in propertyList)
    {
        SEL selector = NSSelectorFromString(key);
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        id value = [self performSelector:selector];
#pragma clang diagnostic pop
        
        if (value == nil)
        {
            value = [NSNull null];
        }
        
        [dict setObject:value forKey:key];
    }
    return dict;
}
/**
 *  从一个字典中还原成一个实体对象
 *
 *  @param dict 字典
 */
- (void)dictionaryForObject:(NSDictionary*) dict
{
    for (NSString *key in [dict allKeys])
    {
        id value = [dict objectForKey:key];
        
        if (value==[NSNull null])
        {
            continue;
        }
        if ([value isKindOfClass:[NSDictionary class]])
        {
            id subObj = [self valueForKey:key];
            if (subObj)
                [subObj dictionaryForObject:value];
        }
        else
        {
            [self setValue:value forKeyPath:key];
        }
    }
}
/**
 *  返回对象的类名
 *
 *  @return className
 */
- (NSString *)className
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}
@end
