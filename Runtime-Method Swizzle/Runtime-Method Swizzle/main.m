//
//  main.m
//  Runtime-Method Swizzle
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
   
        
        
        LMJPerson *p = [LMJPerson new];
        
        [p performSelector:NSSelectorFromString(@"sleep")];
//        [p eat];
        
        
        
        
    }
    return 0;
}
