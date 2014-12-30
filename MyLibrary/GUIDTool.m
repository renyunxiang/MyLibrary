//
//  GUIDTool.m
//  OOSSO
//
//  Created by nero on 14/12/26.
//  Copyright (c) 2014年 nero. All rights reserved.
//

#import "GUIDTool.h"

@implementation GUIDTool
+ (NSString *)GUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString *str = [NSString stringWithString:(__bridge NSString *)string];
    CFRelease(string);
    return str;
    //    return (NSString *)string;
    
}
@end
