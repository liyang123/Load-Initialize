//
//  ViewController.m
//  TestLoadAndInitialize
//
//  Created by liyang on 16/4/8.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Child.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Btn:(id)sender {
    Child *child = [[Child alloc] init];
    NSLog(@"%@",child);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
