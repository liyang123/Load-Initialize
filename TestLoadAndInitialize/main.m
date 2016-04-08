//
//  main.m
//  TestLoadAndInitialize
//
//  Created by liyang on 16/4/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Other.h"
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        NSLog(@"%s",__func__);
        
        
        // 测试load方法时候写的
        Other *other = [Other new];
        [other originalFunc];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
