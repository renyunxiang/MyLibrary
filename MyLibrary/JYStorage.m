//
//  JYStorage.m
//  MyLibrary
//
//  Created by nero on 15/3/18.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "JYStorage.h"

@implementation JYStorage
+ (void)setValue:(id)value forKey:(NSString *)key {
    if (value && ![value isEqual:[NSNull null]] && key && ![key isEqual:[NSNull null]]) {
        [[NSUserDefaults standardUserDefaults] setValue:value
                                                 forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)getValueForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
//下面是test
+ (void)setPhone:(NSString *)phone {
    [[self class] setValue:phone forKey:@"oo_phone"];
}

+ (NSString *)getPhone {
    return [[self class] getValueForKey:@"oo_phone"];
}
@end
