//
//  LMJPerson.m
//  Runtime-Method Swizzle
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJPerson.h"
#import <objc/runtime.h>

@implementation LMJPerson

- (void)run
{
    NSLog(@"%s", __func__);
    
    [self run];
}


- (void)eat
{
    NSLog(@"%s", __func__);
    
    [self eat];
}

- (void)sleep
{
    NSLog(@"%s", __func__);
}

+ (void)load
{
   Method method1 = class_getInstanceMethod(self, @selector(run));
    
    Method method2 = class_getInstanceMethod(self, @selector(sleep));
    
    method_exchangeImplementations(method1, method2);
}

@end
