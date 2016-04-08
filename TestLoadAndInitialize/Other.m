//
//  Other.m
//  TestLoadAndInitialize
//
//  Created by liyang on 16/4/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "Other.h"
#import <objc/runtime.h>

@implementation Other
static NSString *name;

+ (void)load
{
    NSLog(@"%@", NSStringFromClass(self));
    
    name = @"other";
    
    Method originalFunc = class_getInstanceMethod([self class], @selector(originalFunc));
    
    Method swizzledFunc = class_getInstanceMethod([self class], @selector(swizzledFunc));
    // 在runtime中交换了两个方法的action
    method_exchangeImplementations(originalFunc, swizzledFunc);
}

+ (void)printName {
    NSLog(@"%@",name);
}

- (void)originalFunc {
    NSLog(@"Original Output");
}

- (void)swizzledFunc {
    NSLog(@"Swizzled Output");
}

@end
