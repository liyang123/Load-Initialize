    //
//  Person.m
//  TestLoadAndInitialize
//
//  Created by liyang on 16/4/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (void)load
{
    NSLog(@"%@", NSStringFromClass(self));
}
+ (void)initialize
{
    NSLog(@"%s, %@", __func__, NSStringFromClass(self));
}
@end
