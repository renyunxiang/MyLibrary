//
//  JYStorage.h
//  MyLibrary
//
//  Created by nero on 15/3/18.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYStorage : NSObject

+ (void)setValue:(id)value forKey:(NSString *)kye;
+ (id)getValueForKey:(NSString *)key;
//下面是Test

+ (void)setPhone:(NSString *)phone;
+ (NSString *)getPhone;
@end
