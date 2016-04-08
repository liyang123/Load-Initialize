//
//  Child.m
//  TestLoadAndInitialize
//
//  Created by liyang on 16/4/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "Child.h"
#import "Other.h"
@implementation Child
+ (void)load
{
    NSLog(@"%@", NSStringFromClass(self));
    Other *other = [Other new];
    [other originalFunc];
}

+ (void)initialize
{
    NSLog(@"%s, %@", __func__, NSStringFromClass(self));
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}
@end
